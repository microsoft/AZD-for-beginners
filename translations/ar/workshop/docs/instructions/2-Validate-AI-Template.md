# 2. التحقق من قالب

> تم التحقق مقابل `azd 1.25.6` في يونيو 2026.

!!! tip "بنهاية هذه الوحدة ستتمكن من"

    - [ ] تحليل بنية حل الذكاء الاصطناعي
    - [ ] فهم سير عمل نشر AZD
    - [ ] استخدام GitHub Copilot للحصول على مساعدة في استخدام AZD
    - [ ] **المختبر 2:** نشر والتحقق من قالب وكلاء الذكاء الاصطناعي

---


## 1. مقدمة

أداة [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) أو `azd` هي أداة سطر أوامر مفتوحة المصدر تبسط سير عمل المطور عند بناء ونشر التطبيقات إلى Azure.

تُعد [قوالب AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) مستودعات قياسية تتضمن أمثلة على كود التطبيق، وأصول _البنية التحتية كرمز_، وملفات تكوين `azd` لهندسة حل متكاملة. يصبح توفير البنية التحتية بسيطًا مثل أمر `azd provision` - بينما يتيح لك `azd up` توفير البنية التحتية **ونشر** تطبيقك دفعة واحدة!

نتيجة لذلك، يمكن أن يكون بدء عملية تطوير التطبيق الخاصة بك بسيطًا مثل العثور على _قالب المبدئ AZD_ المناسب الذي يطابق احتياجات تطبيقك والبنية التحتية - ثم تخصيص المستودع ليناسب متطلبات السيناريو الخاصة بك.

قبل أن نبدأ، دعونا نتأكد من أن لديك Azure Developer CLI مثبتًا.

1. افتح محطة VS Code واكتب هذا الأمر:

      ```bash title="" linenums="0"
      azd version
      ```

1. يجب أن ترى شيئًا مثل هذا!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**أنت الآن جاهز لاختيار ونشر قالب باستخدام azd**

---

## 2. اختيار القالب

تأتي منصة Microsoft Foundry مع [مجموعة من قوالب AZD الموصى بها](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) التي تغطي سيناريوهات حلول شائعة مثل _أتمتة سير عمل متعدد الوكلاء_ و _معالجة المحتوى متعددة النماذج_. يمكنك أيضًا اكتشاف هذه القوالب بزيارة بوابة Microsoft Foundry.

1. قم بزيارة [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. قم بتسجيل الدخول إلى بوابة Microsoft Foundry عند المطالبة - سترى شيئًا مثل هذا.

![اختر](../../../../../translated_images/ar/01-pick-template.60d2d5fff5ebc374.webp)


خيارات **Basic** هي قوالب البداية الخاصة بك:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) الذي ينشر تطبيق دردشة أساسي _مع بياناتك_ إلى Azure Container Apps. استخدم هذا لاستكشاف سيناريو دردشة ذكاء اصطناعي أساسي.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) الذي ينشر أيضًا وكيل ذكاء اصطناعي قياسي (مع Foundry Agents). استخدم هذا للاطلاع على حلول الذكاء الوكِيلية التي تتضمن أدوات ونماذج.

افتح الرابط الثاني في علامة تبويب جديدة في المتصفح (أو انقر على `Open in GitHub` للبطاقة ذات الصلة). يجب أن ترى مستودع هذا قالب AZD. خذ دقيقة لاستكشاف ملف README. تبدو بنية التطبيق هكذا:

![العمارة](../../../../../translated_images/ar/architecture.8cec470ec15c65c7.webp)

---

## 3. تفعيل القالب

لنحاول نشر هذا القالب والتأكد من صلاحيته. سنتبع الإرشادات في قسم [البدء السريع](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. اختر بيئة عمل لمستودع القالب:

      - **GitHub Codespaces**: انقر على [هذا الرابط](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) ثم أكد `Create codespace`
      - **استنساخ محلي أو حاوية تطوير**: استنسخ `Azure-Samples/get-started-with-ai-agents` وافتحه في VS Code

1. انتظر حتى تكون محطة VS Code جاهزة، ثم اكتب الأمر التالي:

   ```bash title="" linenums="0"
   azd up
   ```

أكمل خطوات سير العمل التي سيؤدي إليها هذا:

1. سيُطلب منك تسجيل الدخول إلى Azure - اتبع التعليمات للمصادقة
1. أدخل اسم بيئة فريد لك - على سبيل المثال، استخدمت `nitya-mshack-azd`
1. سيؤدي ذلك إلى إنشاء مجلد `.azure/` - سترى مجلدًا فرعيًا باسم البيئة
1. سيُطلب منك تحديد اسم الاشتراك - اختر الافتراضي
1. سيُطلب منك تحديد الموقع - استخدم `East US 2`

الآن، انتظر اكتمال التوفير. **هذا يستغرق 10-15 دقيقة**

1. عند الانتهاء، ستظهر رسالة SUCCESS في وحدة التحكم لديك مثل هذه:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. ستحتوي الآن بوابة Azure الخاصة بك على مجموعة موارد تم توفيرها بهذا الاسم البيئي:

      ![البنية التحتية](../../../../../translated_images/ar/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **أنت الآن جاهز للتحقق من البنية التحتية والتطبيق المنشور**.

---

## 4. التحقق من القالب

1. قم بزيارة صفحة مجموعات الموارد في بوابة Azure [Resource Groups](https://portal.azure.com/#browse/resourcegroups) - سجّل الدخول عند المطالبة
1. انقر على مجموعة الموارد باسم بيئتك - سترى الصفحة أعلاه

      - انقر على مورد Azure Container Apps
      - انقر على عنوان URL للتطبيق في قسم _Essentials_ (أعلى اليمين)

1. يجب أن ترى واجهة أمامية للتطبيق مستضافة مثل هذه:

   ![التطبيق](../../../../../translated_images/ar/03-test-application.471910da12c3038e.webp)

1. جرّب طرح بعض [الأسئلة النموذجية](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. اسأل: ```What is the capital of France?``` 
      1. اسأل: ```What's the best tent under $200 for two people, and what features does it include?```

1. يجب أن تحصل على إجابات مماثلة لما هو معروض أدناه. _لكن كيف يعمل هذا؟_ 

      ![التطبيق](../../../../../translated_images/ar/03-test-question.521c1e863cbaddb6.webp)

---

## 5. التحقق من الوكيل

ينشر تطبيق Azure Container App نقطة نهاية تتصل بالوكيل الذكي الموفَّر في مشروع Microsoft Foundry لهذا القالب. دعنا نلقي نظرة على ما يعنيه ذلك.

1. عد إلى صفحة _نظرة عامة_ في بوابة Azure لمجموعة الموارد الخاصة بك

1. انقر على المورد `Microsoft Foundry` في تلك القائمة

1. يجب أن ترى هذا. انقر على زر `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/ar/04-view-foundry-project.fb94ca41803f28f3.webp)

1. يجب أن ترى صفحة مشروع Foundry لتطبيق الذكاء الاصطناعي الخاص بك
   ![المشروع](../../../../../translated_images/ar/05-visit-foundry-portal.d734e98135892d7e.webp)

1. انقر على `Agents` - سترى الوكيل الافتراضي الموفر في مشروعك
   ![الوكلاء](../../../../../translated_images/ar/06-visit-agents.bccb263f77b00a09.webp)

1. حدده - وسترى تفاصيل الوكيل. لاحظ ما يلي:

      - يستخدم الوكيل File Search بشكل افتراضي (دائمًا)
      - يشير `Knowledge` الخاص بالوكيل إلى أنه تم تحميل 32 ملفًا (للبحث في الملفات)
      ![تفاصيل الوكيل](../../../../../translated_images/ar/07-view-agent-details.0e049f37f61eae62.webp)

1. ابحث عن خيار `Data+indexes` في القائمة اليسرى وانقر لعرض التفاصيل.

      - يجب أن ترى 32 ملف بيانات تم تحميلها للمعرفة.
      - ستتوافق هذه مع 12 ملفًا للعملاء و20 ملفًا للمنتجات تحت `src/files`
      ![البيانات](../../../../../translated_images/ar/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**لقد تحققت من عمل الوكيل!**

1. تستند استجابات الوكيل إلى المعرفة الموجودة في تلك الملفات.
1. يمكنك الآن طرح أسئلة متعلقة بتلك البيانات، والحصول على استجابات مؤصلة.
1. مثال: يصف `customer_info_10.json` المشتريات الثلاثة التي قامت بها "Amanda Perez"

عد إلى علامة تبويب المتصفح التي تحتوي على نقطة نهاية Container App واسأل: `What products does Amanda Perez own?`. يجب أن ترى شيئًا مثل هذا:

![البيانات](../../../../../translated_images/ar/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. ملعب الوكيل

لنطور فهمًا أكبر لإمكانات Microsoft Foundry، من خلال تشغيل الوكيل قليلًا في ملعب الوكلاء.

1. عد إلى صفحة `Agents` في Microsoft Foundry - وحدد الوكيل الافتراضي
1. انقر على خيار `Try in Playground` - ستحصل على واجهة ملعب مثل هذه
1. اطرح نفس السؤال: `What products does Amanda Perez own?`

    ![البيانات](../../../../../translated_images/ar/09-ask-in-playground.a1b93794f78fa676.webp)

ستحصل على نفس الاستجابة (أو استجابة مشابهة) - لكنك ستحصل أيضًا على معلومات إضافية يمكنك استخدامها لفهم جودة وتكلفة وأداء تطبيقك الوكيلي. على سبيل المثال:

1. لاحظ أن الاستجابة تستشهد بملفات البيانات المستخدمة "لتأصيل" الاستجابة
1. حرّك مؤشر الماوس فوق أي من هذه تسميات الملفات - هل تتطابق البيانات مع استفسارك والاستجابة المعروضة؟

سترى أيضًا صف _إحصاءات_ أسفل الاستجابة.

1. حرّك المؤشر فوق أي مقياس - على سبيل المثال، Safety. سترى شيئًا مثل هذا
1. هل يتطابق التقييم المُقيَّم مع حدسك لمستوى سلامة الاستجابة؟

      ![البيانات](../../../../../translated_images/ar/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. المراقبة المدمجة

الملاحظة (Observability) تتعلق بأدوات قياس تطبيقك لتوليد بيانات يمكن استخدامها لفهمه وتصحيحه وتحسينه. للحصول على فكرة عن هذا:

1. انقر على زر `View Run Info` - يجب أن ترى هذا العرض. هذا مثال على [تتبع الوكيل](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) قيد التنفيذ. _يمكنك أيضًا الحصول على هذا العرض بالنقر على Thread Logs في القائمة العلوية_.

   - تعرّف على خطوات التشغيل والأدوات التي استخدمها الوكيل
   - افهم إجمالي عدد الرموز (مقابل استخدام رموز الإخراج) للاستجابة
   - افهم الكمون وأين يتم قضاء الوقت في التنفيذ

      ![الوكيل](../../../../../translated_images/ar/10-view-run-info.b20ebd75fef6a1cc.webp)

1. انقر على تبويب `Metadata` لرؤية سمات إضافية للتشغيل، قد توفر سياقًا مفيدًا لتصحيح المشكلات لاحقًا.   

      ![الوكيل](../../../../../translated_images/ar/11-view-run-info-metadata.7966986122c7c2df.webp)


1. انقر على تبويب `Evaluations` لرؤية التقييمات التلقائية التي أُجريت على استجابة الوكيل. تتضمن هذه تقييمات السلامة (مثل، الإيذاء الذاتي) وتقييمات خاصة بالوكيل (مثل، حل النية، الالتزام بالمهمة).

      ![الوكيل](../../../../../translated_images/ar/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. وأخيرًا، انقر على تبويب `Monitoring` في قائمة الشريط الجانبي.

      - حدد تبويب `Resource usage` في الصفحة المعروضة - واعرض المقاييس.
      - تتبع استخدام التطبيق من حيث التكاليف (الرموز) والحمولة (الطلبات).
      - تتبع زمن استجابة التطبيق حتى البايت الأول (معالجة الإدخال) والبايت الأخير (الإخراج).

      ![الوكيل](../../../../../translated_images/ar/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. متغيرات البيئة

حتى الآن، استعرضنا النشر في المتصفح - وتحققنا من أن بنيتنا التحتية مُوفَّرة والتطبيق يعمل. ولكن للعمل مع التطبيق _كود-أولًا_، نحتاج إلى تكوين بيئة التطوير المحلية لدينا بالمتغيرات المناسبة المطلوبة للعمل مع هذه الموارد. يجعل `azd` ذلك سهلاً.

1. يستخدم Azure Developer CLI [متغيرات البيئة](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) لتخزين وإدارة إعدادات التكوين لنشرات التطبيق.

1. يتم تخزين متغيرات البيئة في `.azure/<env-name>/.env` - هذا يقصرها على بيئة `env-name` المستخدمة أثناء النشر ويساعدك على عزل البيئات بين أهداف نشر مختلفة في نفس المستودع.

1. يتم تحميل متغيرات البيئة تلقائيًا بواسطة أمر `azd` كلما نفذ أمرًا محددًا (مثل، `azd up`). لاحظ أن `azd` لا يقرأ تلقائيًا متغيرات بيئة مستوى نظام التشغيل (مثل، المعينة في الشِل) - بدلاً من ذلك استخدم `azd set env` و`azd get env` لنقل المعلومات داخل السكربتات.


لنجرّب بعض الأوامر:

1. احصل على جميع متغيرات البيئة المعينة لـ `azd` في هذه البيئة:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      سترى شيئًا مثل:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. احصل على قيمة محددة - على سبيل المثال، أريد أن أعرف إذا قمنا بتعيين القيمة `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      سترى شيئًا مثل هذا - لم يتم تعيينه افتراضيًا!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. قم بتعيين متغير بيئة جديد لـ `azd`. هنا، نقوم بتحديث اسم نموذج الوكيل. _ملاحظة: أي تغييرات تُجرى ستنعكس فورًا في ملف `.azure/<env-name>/.env`._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      الآن، يجب أن نجد أن القيمة مُعينة:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. لاحظ أن بعض الموارد دائمة (مثل، عمليات نشر النماذج) وستتطلب أكثر من مجرد `azd up` لإجبار إعادة النشر. لنحاول تفكيك النشر الأصلي وإعادة النشر مع متغيرات بيئة محدثة.

1. **تحديث** إذا قمت بنشر البنية التحتية سابقًا باستخدام قالب azd - يمكنك _تحديث_ حالة متغيرات البيئة المحلية الخاصة بك بناءً على الحالة الحالية لنشر Azure باستخدام هذا الأمر:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      هذه طريقة قوية لـ _مزامنة_ متغيرات البيئة عبر بيئتين تطوير محليتين أو أكثر (على سبيل المثال، فريق يضم عدة مطورين) - مما يسمح للبنية التحتية المنشورة بأن تكون المصدر الحقيقي لحالة متغيرات البيئة. ببساطة يقوم أعضاء الفريق بـ _تحديث_ المتغيرات للعودة إلى التزامن.

---

## 9. تهانينا 🏆

لقد أكملت للتو سير عمل شامل حيث:

- [X] اخترت قالب AZD الذي تريد استخدامه
- [X] فتحت القالب في بيئة تطوير مدعومة
- [X] نشرت القالب وتحققّت من أنه يعمل

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->