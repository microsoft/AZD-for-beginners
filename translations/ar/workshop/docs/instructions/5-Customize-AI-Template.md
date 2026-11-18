# 5. تخصيص قالب

!!! tip "بنهاية هذه الوحدة ستكون قادرًا على"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 إنشاء خط أساس

استخدم مستودع [البدء مع وكلاء الذكاء الاصطناعي](https://github.com/Azure-Samples/get-started-with-ai-agents) المُهيأ من الوحدات السابقة. سجل مراجعة القالب، نسخة AZD، البيئة المختارة، نشر النموذج، وأسئلة العينة العملية قبل تغيير أي شيء.

النموذج ينفذ تطبيق محادثة مدعوم بالوكيل. لا يصبح نظام بيع بالتجزئة بعاملين فقط عن طريق إعداد متغيرات البيئة أو حفظ ملفات تعليمات إضافية. يحتاج الوكلاء الإضافيون، ومعالجات الأدوات، والتوجيه، والتفويض، والوصول إلى البيانات إلى رمز تطبيق.

تفحص تعليمات وأدوات الوكيل المنشور حاليًا في Foundry. اختبر سؤالًا واقعيًا، وسؤال استرجاع واحد، وسؤالًا لا يمكن لبيانات العينة الإجابة عليه. تحقق من الاقتباسات مقابل المستندات المصدر الفعلية بدلاً من افتراض صحة استجابة سليمة.

## 5.2 تخصيص استرجاع المعرفة

يدعم القالب الاسترجاع المعتمد على الملفات وتكامل Azure AI Search الاختياري. اتبع [دليل AI Search الحالي](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) للفهرسة وتكوين الأدوات.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

تفعيل الخدمة هو جزء واحد فقط من الاسترجاع. قبل تحميل بياناتك الخاصة:

1. أكد أن لديك إذنًا لاستخدام المستندات وقم بإزالة المعلومات الحساسة.
2. اختر نموذج التضمين المدعوم في منطقتك وحدد نسخته المتوافقة، نوع النشر، وأبعاد المتجهات.
3. أنشئ/املأ الفهرس باستخدام عملية العينة الموثقة.
4. قم بتكوين أداة الاسترجاع للوكيل لاستخدام ذلك الفهرس.
5. اختبر الاسترجاع، الاقتباسات، التفويض، والسلوك عند عدم وجود مستند ذي صلة.

لا تتحول من `text-embedding-3-small` إلى نموذج تضمين مختلف دون التحقق من الأبعاد وإعادة بناء/إعادة فهرسة المتجهات حسب الحاجة. اسم مثل `retail-products` ليس فهرسًا منفذًا أو سياسة تحكم وصول.

## 5.3 التتبع والمراقبة

اتبع [دليل الرصد للعينة](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). تأكد من وجود مورد Application Insights والاتصال اللازمين بالفعل؛ إذا كنت تغير إعدادات البنية التحتية، استخدم `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

أرسل طلب اختبار، ثم افحص سجلات تطبيق Container App وعرض تتبع الوكيل في Foundry. تحقق من الكمون، استدعاءات الأدوات، الأخطاء، والارتباط بين الطلب والتتبع. لا تفترض اتصال القياسات فقط لأن النشر نجح.

اترك `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` معطلًا ما لم تقم بمراجعة الموافقة، التظليل، الاحتفاظ، وضوابط الوصول بشكل صريح. يمكن أن تحتوي التتبعات على معاملات أدوات حساسة أو محتوى مستند حتى ولو بدت سجلات التطبيق العادية غير ضارة.

## 5.4 تقييم الوكيل

نقطة الدخول لتقييم العينة الآن هي [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py)، وليست دليل `evals/`. من جذر العينة، استخدم بيئة بايثون تلبي متطلباتها الموثقة:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

قبل التشغيل، أكمل [متطلبات التقييم](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). التحويلات تحمل التكوين من `.azure/<environment>/.env` المختارة؛ أكد اختيار البيئة المقصودة. المدخلات المهمة تشمل:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`، باستخدام التنسيق المطلوب من العينة الحالية (النسخة المراجعة تستخدم `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`، تستخدم كنشر النموذج القاضي

تفحص الاختبارات لفهم اختيار المقيم، العتبات، الأدوار المطلوبة، وتكاليف النماذج. التشغيل المكتمل ليس بالضرورة بوابة جودة ناجحة تلقائيًا؛ تحقق من الدرجات، الحالات الفاشلة/المعطوبة، والنتائج المرتبطة في Foundry.

### امتداد تقييمات AZD منفصل

اختبار بايثون أعلاه هو **سير عمل خاص بالنموذج**. امتداد `azure.ai.evaluations` الاختياري هو سير عمل مختلف، مع تكوين `evals/azure.eval.yaml` الخاص به. يتم تثبيته بشكل منفصل، غير مضمن في حزمة `microsoft.foundry` 1.0 المتاحة عمومًا:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

لإعداد امتداد كامل، راجع [سير عمل التقييم والهجرة](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). منذ بيتا 22 لامتداد الوكلاء، لا تستخدم أوامر `azd ai agent eval` التي تمت إزالتها. تثبيت امتداد التقييم لا يحول اختبارات بايثون الخاصة بالعينة أو ينشئ تكوين تقييم تلقائيًا.

لتمرين **وكلاء مستضافين منفصل** GA، استخدم مجلدًا فارغًا خارج عينة هذا الورشة واتباع [شرح Foundry من المحلي إلى السحابة](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). يستخدم AZD 1.37.0+، حزمة `microsoft.foundry`، بايثون 3.13+، و uv الحالي. ستفحص `azure.yaml`، تختبر محليًا باستخدام Agent Inspector، تنشر المصدر لبناء Foundry عن بُعد، وتولد/تراجع مجموعة بيانات ومخطط تقييم قبل تكوين `azd ai eval init --name quality`. لا تستبدل اختبارات هذه العينة أو تفترض أن تثبيت الحزمة يغير نموذج الاستضافة الخاص بها.

## 5.5 الفِرَق الحمراء للذكاء الاصطناعي والتقييم المستمر

توفر العينة الحالية [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). أكمل متطلباتها وراجع الهدف المقصود والتكاليف قبل التشغيل:

```bash
pytest tests/test_red_teaming.py -s
```

استخدم نشر اختبار مخول وبيانات تركيبية. راجع الهجمات والنتائج المُنشأة؛ هذا الفحص لا يثبت أن التطبيق آمن أو ملتزم.

يصف [دليل الرصد](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) أيضًا التقييم المستمر المُكوَّن عند تشغيل الحاوية. يقيم تفاعلات المستخدم الحقيقية، وليس حركة المرور الاختبارية المُولدة، ودعم المقيم يختلف حسب المنطقة. عدم وجود تفاعلات يعني عدم وجود سجلات تقييم. تحقق من نسخة العينة المثبتة وتكوين المقيم بدلًا من افتراض أن كل نشر له نفس الإعدادات الافتراضية.

المصادقة منفصلة عن التقييم. اتبع إعداد الهوية/الوصول الموثق للعينة. لا يوجد “تراجع المصادقة الأساسي” موثق للاعتماد عليه لحماية نقطة نهاية عامة.

## 5.6 تمرين التصميم: تخصيص البيع بالتجزئة

!!! warning "تمرين تصميم، وليس نشرًا مكتملًا"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

اكتب خطة قصيرة تتناول:

| المنطقة | القرار والأدلة التي يجب جمعها |
|------|----------------------------------|
| مسؤوليات الوكيل | ابدأ بوكيل واحد، أو برر وكلاء منفصلين للمشتري والولاء ومنطق التوجيه |
| البيانات | حدد كتالوجًا/مجموعة مكافآت تركيبية وملكية التحديثات |
| الأدوات | نفذ المعالجات للقراءة فقط أولًا؛ حدد التفويض والتحقق لأي عمليات كتابة |
| النماذج | اختر تركيبات النموذج/النسخة/SKU المتاحة وتحقق من الحصة؛ تجنب توفير نماذج غير مستخدمة |
| الاسترجاع | حدد الفهرسة، أبعاد التضمين، الاقتباسات، وضوابط الوصول على مستوى المستند |
| التقييم | أضف حالات الإجابة المتوقعة، الأسئلة غير المدعومة، استخدام الأدوات، والسلامة مع عتبات صريحة |
| العمليات | حدد القياسات، ميزانيات الكمون/الأخطاء، حدود التكلفة، وملكية التنظيف |

حفظ `custom-agents/shopper-agent-instructions.md` لا يجعل العينة تحملها. اعثر على رمز التطبيق الذي ينشئ/يحدث الوكيل، وصل تعليماتك المراجعة هناك، وتحقق من نسخة الوكيل الناتجة قبل الاختبار. التعليمات لا يمكنها منح الوصول إلى بيانات أو أدوات لم تقم بتطبيقها.

طبق تغييرًا واحدًا في كل مرة، أعد نشر المكونات المتأثرة، وأعد تشغيل أسئلة وخط أساس التقييم. احتفظ بمراجعة عاملة للمقارنة. للإلهام المعماري، راجع [المخطط التفصيلي للبيع بالتجزئة](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md) الذي ليس أيضًا تطبيق بيع بالتجزئة كاملًا.

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