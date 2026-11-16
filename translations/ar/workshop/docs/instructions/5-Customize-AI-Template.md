# 5. تخصيص قالب

!!! tip "بنهاية هذه الوحدة ستتمكن من"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 إنشاء خط أساس

استخدم المستودع [البدء مع وكلاء الذكاء الاصطناعي](https://github.com/Azure-Samples/get-started-with-ai-agents) المهيأ من الوحدات السابقة. سجل مراجعة القالب، إصدار AZD، البيئة المختارة، نشر النموذج، وأسئلة العينة العاملة قبل إجراء أي تغييرات.

العينة تنفذ تطبيق دردشة مدعوم بالوكيل. لا تصبح نظام تجزئة ذو وكيلين بمجرد تعيين متغيرات البيئة أو حفظ ملفات التعليمات الإضافية. يتطلب وجود وكلاء إضافيين، ومديري أدوات، والتوجيه، والتفويض، والوصول إلى البيانات رمز تطبيق.

افحص تعليمات الوكيل والأدوات المنشورة حالياً في Foundry. اختبر سؤالاً واقعياً واحدًا، وسؤال استرجاع واحد، وسؤالاً لا يمكن لبيانات العينة الإجابة عليه. تحقق من الاستشهادات مقابل مستندات المصدر الفعلية بدلاً من افتراض صحة الرد الطليق.

## 5.2 تخصيص استرجاع المعرفة

القالب يدعم الاسترجاع المستند إلى الملفات والتكامل الاختياري مع Azure AI Search. اتبع [دليل AI Search الحالي](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) للفهرسة وتكوين الأدوات.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

تفعيل الخدمة هو جزء واحد فقط من الاسترجاع. قبل تحميل بياناتك الخاصة:

1. أكد أنك تملك إذن استخدام المستندات وأزل المعلومات الحساسة.
2. اختر نموذج تضمين مدعوم في منطقتك واضبط إصداره المتوافق ونوع النشر وأبعاد المتجه.
3. أنشئ/ادمج الفهرس باستخدام العملية الموثقة في العينة.
4. قم بتكوين أداة الاسترجاع الخاصة بالوكيل لاستخدام ذلك الفهرس.
5. اختبر الاسترجاع، والاستشهادات، والتفويض، والسلوك عند عدم وجود مستند ذي صلة.

لا تنتقل من `text-embedding-3-small` إلى نموذج تضمين مختلف دون التحقق من الأبعاد وإعادة بناء/إعادة فهرسة المتجهات حسب الحاجة. اسم مثل `retail-products` ليس كتالوجًا منفذاً أو سياسة تحكم وصول.

## 5.3 التتبع والمراقبة

اتبع [دليل المراقبة للعينة](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). تأكد من وجود مورد Application Insights والاتصال المطلوب؛ إذا كنت تغير إعدادات البنية التحتية، استخدم `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

أرسل طلب اختبار، ثم افحص سجلات تطبيق Container App وعرض تتبع الوكيل في Foundry. تحقق من التأخير، واستدعاءات الأدوات، والأخطاء، والارتباط بين الطلب والتتبع. لا تفترض أن القياس عن بُعد متصل لأن النشر نجح فقط.

اترك `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` معطلًا إلا إذا راجعت صراحة الموافقة، والإزالة، والاحتفاظ، وضوابط الوصول. قد تحتوي التتبعات على وسائط أدوات حساسة أو محتوى المستند حتى عندما تبدو سجلات التطبيق العادية حميدة.

## 5.4 تقييم الوكيل

نقطة الدخول لتقييم العينة الآن هي [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py)، ليست دليل `evals/`. من جذر العينة، استخدم بيئة Python تلبي متطلباتها الموثقة:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

قبل التشغيل، أكمل [متطلبات التقييم](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). تختبر الاختبارات تحميل التكوين من `.azure/<environment>/.env` المحدد؛ تحقق من اختيار البيئة المقصودة. المدخلات المهمة تشمل:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`، باستخدام التنسيق المطلوب من العينة الحالية (النسخة التي تم مراجعتها تستخدم `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`، يُستخدم كنشر نموذج الحكم

افحص الاختبارات لفهم اختيار المُقييم، العتبات، الأدوار المطلوبة، وتكاليف النموذج. لا يعني تشغيل مكتمل إتمام بوابة جودة ناجحة تلقائيًا؛ افحص الدرجات، الحالات الفاشلة/المخطئة، والنتائج المرتبطة في Foundry.

### امتداد تقييمات AZD المنفصل

اختبار Python أعلاه هو **سير عمل خاص بالعينة**. امتداد `azure.ai.evaluations` الاختياري هو سير عمل مختلف، مع تكوين `evals/azure.eval.yaml` الخاص به:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

للإعداد الكامل للامتداد، راجع [سير العمل والتوجيه للتقييم](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). منذ beta.22 لوكلاء الامتداد، لا تستخدم أوامر `azd ai agent eval` المحذوفة. تثبيت امتداد التقييمات لا يحول اختبارات Python الخاصة بالعينة أو ينشئ تكوين تقييم تلقائيًا.

## 5.5 الفرق الأحمر للذكاء الاصطناعي والتقييم المستمر

العينة الحالية توفر [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). أكمل متطلباته وراجع الهدف والتكاليف المقصودة قبل التشغيل:

```bash
pytest tests/test_red_teaming.py -s
```

استخدم نشر اختبار مخول وبيانات تركيبية. راجع الهجمات والنتائج المولدة؛ هذا الفحص لا يثبت أن تطبيقًا آمناً أو متوافقًا.

يصف [دليل المراقبة](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) أيضًا التقييم المستمر الذي يتم تكوينه عند بدء الحاوية. يقيم تفاعلات المستخدم الحقيقية، وليس حركة المرور الناتجة من الاختبارات، ودعم المُقييم يختلف حسب المنطقة. عدم وجود تفاعلات يعني عدم وجود مدخلات تقييم. تحقق من نسخة العينة المثبتة وتكوين المُقييم بدلاً من الافتراض بأن كل نشر له الإعدادات الافتراضية نفسها.

المصادقة منفصلة عن التقييم. اتبع إعداد تعريف/وصول العينة الموثق. لا يوجد "تراجع المصادقة الأساسية" موثق يمكن الاعتماد عليه لحماية نقطة نهاية عامة.

## 5.6 تمرين تصميم: تخصيص التجزئة

!!! warning "تمرين تصميم، ليس نشرًا مكتملًا"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

اكتب خطة قصيرة تتناول:

| المجال | القرار والأدلة التي يجب جمعها |
|------|----------------------------------|
| مسؤوليات الوكيل | ابدأ بوكيل واحد، أو برر الحاجة إلى وكلاء منفصلين للمشتري والولاء ومنطق التوجيه |
| البيانات | حدد مجموعة بيانات كتالوج/مكافآت تركيبية وملكية التحديثات |
| الأدوات | نفذ مديري قراءة فقط أولاً؛ حدد التفويض والتحقق لأي كتابات |
| النماذج | اختر تركيبات النموذج/الإصدار/الرقم التسلسلي المتوفرة وتحقق من الحصة؛ تجنب توفير نماذج غير مستخدمة |
| الاسترجاع | حدد الفهرسة، وأبعاد التضمين، والاستشهادات، وضوابط الوصول على مستوى المستند |
| التقييم | أضف حالات الإجابة المتوقعة، والسؤال غير المدعوم، واستخدام الأدوات، والسلامة مع عتبات صريحة |
| العمليات | حدد القياس، وميزانيات التأخير/الأخطاء، حدود التكلفة، ومسؤولية التنظيف |

حفظ `custom-agents/shopper-agent-instructions.md` لا يجعل العينة تقوم بتحميله. حدد رمز التطبيق الذي ينشئ/يحدث الوكيل، وصل تعليماتك المراجعة هناك، وتحقق من إصدار الوكيل الناتج قبل الاختبار. التعليمات لا يمكنها منح الوصول إلى بيانات أو أدوات لم تقم بتنفيذها.

طبق تغييرًا واحدًا في كل مرة، وأعد نشر المكونات المتأثرة، وأعد تشغيل أسئلة وخط الأساس والتقييمات. احتفظ بمراجعة عاملة للمقارنة. للإلهام المعماري، راجع [المخطط التجزئة](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md)، الذي هو أيضًا ليس تطبيق تجزئة مكتمل.

!!! quote "بنهاية هذا المختبر يجب أن يكون لديك"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

تابع إلى [تفكيك البنية التحتية](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->