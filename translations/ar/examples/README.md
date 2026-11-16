# أمثلة — المصدر الإنجليزي وعينات أزور

هذه عينات تعليمية، وليست تطبيقات معتمدة للإنتاج. اقرأ متطلبات كل مثال،
والقيود، والتكاليف، وتعليمات التنظيف قبل
تشغيل الأوامر. يجب التحقق من توفر أزور والحصص في الاشتراك الخاص بك.

- [الصفحة الرئيسية للدورة](../README.md)
- [التركيب](../docs/chapter-01-foundation/installation.md)
- [استكشاف الأخطاء وإصلاحها](../docs/chapter-07-troubleshooting/common-issues.md)

## ما الذي يوجد فعليًا محليًا

هناك **أربع عينات تطبيقات** و**هيكل بنية تحتية واحد**:

| المثال | التنفيذ المحلي | التركيز التعليمي | المستوى |
|---|---|---|---|
| [API بسيط باستخدام Flask](../../../examples/container-app/simple-flask-api) | API CRUD باستخدام Flask، Dockerfile، Bicep، `azure.yaml` | نشر الحاويات، الفحوصات، السجلات | مبتدئ |
| [خدمتان في بنية الميكروسيرفيس](../../../examples/container-app/microservices) | بوابة Node.js وخدمة منتج Python للقراءة فقط، ملفات Docker، Bicep، `azure.yaml` | اتصال HTTPS داخلي، التوسع المستقل | متوسط |
| [تطبيق قاعدة بيانات](../../../examples/database-app) | API قراءة Flask، قاعدة بيانات SQL في Azure، خدمة التطبيقات، Bicep، `azure.yaml` | اتصال SQL، التهيئة، السجلات | متوسط |
| [دردشة Azure OpenAI](../../../examples/azure-openai-chat) | CLI Python محلي، Bicep لـ Azure OpenAI و Key Vault، بنية تحتية فقط `azure.yaml` | توفير النموذج، سجل الدردشة، تقديرات الرموز | متوسط |
| [بنية تحتية للبيع بالتجزئة](../../../examples/retail-multiagent-arm-template) | قالب ARM، معلمات، سكربت نشر Bash؛ **حاويات hello-world فقط** | بنية تحتية لتطبيق متعدد الوكلاء مستقبلي | متقدم |

السيناريو [التجزئة](retail-scenario.md) هو **مخطط هندسي**، وليس
تنفيذًا متعدد الوكلاء كاملًا. لا يتضمن كود وكيل التجزئة، واجهة الدردشة الأمامية، API الموجه،
خط أنابيب بيانات البحث، CLI التقييم، التحويل التلقائي، أو
تأمين الإنتاج. يجب تصميم هذه وبناؤها واختبارها بشكل منفصل.

يشير [نظرة عامة على الميكروسيرفيس](microservices/README.md) إلى العينة التي تُشغل
لخدمتين؛ وليست دليل نشر آخر.

## مسار التعلم الموصى به

1. نشر Flask API والتحقق من `/health` وعمليات CRUD.
2. نشر تطبيق قاعدة البيانات والتحقق من خمسة منتجات مزروعة.
3. نشر مثال الخدمتين والتحقق من طلبات البوابة إلى المنتج.
4. توفير موارد الدردشة وتشغيل CLI التفاعلي **محليًا**.
5. دراسة مخطط التجزئة بعد إكمال الأمثلة العاملة.

خصص حوالي 30–60 دقيقة لكل مثال تطبيق يشمل المتطلبات والتحقق.
تنفيذ التجزئة مشروع تطوير منفصل، وليس ورشة عمل مدتها 30 دقيقة.
قراءة معماريتها تستغرق حوالي 2–3 ساعات؛ التنفيذ
وجاهزية الإنتاج يمكن أن تستغرق وقتًا أطول بكثير من
80–120 ساعة تطوير توضيحية في الدليل.

## بدء سريع

من جذر المستودع، للعينة الأولى من الحاويات:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

المتوقع: HTTP 200 و JSON يحتوي على `"status": "healthy"`.
تحتاج إلى تشغيل Docker لبناء الحاوية محليًا.

للدردشة، اتبع [README الدردشة](azure-openai-chat/README.md): استخدم
`azd provision`، حمّل مفتاح API من Key Vault إلى الصدفة الحالية، ثبت
`src/requirements.txt`، وشغل `python src/chat.py`. لا توجد خدمة دردشة مستضافة.

للتجزئة، استخدم [دليل ARM](retail-multiagent-arm-template/README.md).
لا يحتوي على `azure.yaml` و**لا** يُنشَر أو يُزال بواسطة `azd up`/`azd down`.

## التكاليف والقيود

- كل عمليات النشر تنشئ موارد Azure قابلة للفوترة. التوسع إلى الصفر ينطبق فقط على
  حساب التطبيق؛ لا يلغي تكاليف التسجيل، قاعدة البيانات، التخزين، البحث، أو السجلات.
- الأسعار الدقيقة تعتمد على المنطقة، العملة، حركة المرور، النموذج/رمز المنتج، ومدة الاحتفاظ.
  استخدم [حاسبة تسعير Azure](https://azure.microsoft.com/pricing/calculator/)
  قبل النشر وخصص ميزانية في إدارة تكاليف Azure.
- بيانات CRUD في Flask في الذاكرة، محدودة إلى عامل واحد وعلى الأكثر نسخة واحدة
  بشكل افتراضي. تختفي عند إعادة التشغيل أو التوسع إلى الصفر. هذا ليس تخزينًا دائمًا.
- ميكروسيرفيس المنتج يعرض نقاط نهاية GET فقط. لا توجد خدمة طلبات أو خدمة مستخدم،
  قاعدة بيانات، Service Bus، أو تطبيقات بـ C# أو Go مدرجة.
- موارد Application Insights لا تستجيب تلقائيًا لتتبع كل تطبيق.
  راجع كل مثال لمعرفة القياسات التي تُرسل فعليًا.
- العينات لا تنفذ مصادقة التطبيق. أضف الهوية، التفويض،
  التخزين الدائم، تحكمات الشبكة، الاختبارات، وإجراءات التشغيل قبل الإنتاج.

## عينات Azure الخارجية — استنساخ منفصل

هذه الروابط تشير إلى مستودعات منفصلة، **وليست عينات محلية**.
المديرون مسؤولون عن تعليمات الإعداد، التنفيذ، التبعيات، والتكاليف.

| العينة | التركيز |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | تطبيق Node.js مع قاعدة بيانات |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# و Azure SQL |
| [تطبيقات ويب ثابتة + دوال](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | واجهة أمامية ثابتة مع دوال C# و SQL |
| [دوال Python + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | تطبيق بدون خادم Python |
| [API متجر تطبيقات الحاويات](https://github.com/Azure-Samples/container-apps-store-api-microservice) | خلفية متجر محملة في حاويات |
| [بدء سريع دردشة AI](https://github.com/Azure-Samples/get-started-with-ai-chat) | تطبيق دردشة AI |
| [بدء سريع وكلاء AI](https://github.com/Azure-Samples/get-started-with-ai-agents) | تطبيق وكيل |
| [عرض بحث + OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG مع البحث والاستشهادات |
| [دردشة Contoso](https://github.com/Azure-Samples/contoso-chat) | عينة AI محادثة |
| [Java على تطبيقات الحاويات](https://github.com/Azure-Samples/java-on-aca) | ميكروسيرفيس Java |

اكتشف المزيد من المشاريع في [معرض قوالب AZD](https://azure.github.io/awesome-azd/).
لا تفترض أن مشروعًا خارجيًا يدعم `azd` بدون التحقق من README الحالي.

## هيكل المستودع

```text
examples/
├── azure-openai-chat/               # Local CLI + model infrastructure
├── container-app/
│   ├── simple-flask-api/            # Single Flask API
│   └── microservices/               # Gateway + read-only product service
├── database-app/                    # Flask + Azure SQL on App Service
├── microservices/README.md          # Navigation to the canonical example
├── retail-multiagent-arm-template/  # Infrastructure scaffold only
└── retail-scenario.md               # Architecture blueprint
```

لا يوجد `configurations/` مشترك، `scripts/`، أو دليل اختبار يتم وعده بواسطة
هذا الفهرس. يتم تحديد الملفات الفعلية وأفكار الامتداد الاختيارية في كل دليل.

## التنظيف

لأربع عينات AZD، شغل هذا الأمر **من دليل العينة المختار**:

```bash
azd down
```

راجع رسالة الحذف. للتجزئة، احذف فقط مجموعة الموارد المخصصة
التي أنشأتها، باستخدام التعليمات في دليل ARM الخاص بها. تحقق من إدارة تكاليف Azure
بعد التنظيف؛ قد تصل بيانات الفوترة لاحقًا.

## المساهمة

أدرج مصدر الكود، البنية التحتية، إعدادات النشر، الخطوات القابلة للتنفيذ للإعداد
والتحقق، القيود، وتعليمات التنظيف مع كل نموذج تطبيق.
ضع علامة صريحة على المحتوى المتعلق بالهندسة فقط وعلى الشظايا غير المكتملة.
لا تدّع الجاهزية للإنتاج دون اختبارات النشر والوظائف والتشغيل.

[الأسئلة الشائعة](../resources/faq.md) · [دليل الدراسة](../resources/study-guide.md) ·
[الإبلاغ عن مشكلة](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->