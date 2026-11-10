# 4. تكوين قالب

!!! tip "بنهاية هذا الوحدة ستتمكن من"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. ابدأ بالقالب الفعلي

افتح [`azure.yaml` في بدء العمل مع وكلاء الذكاء الاصطناعي](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) في المستودع الذي قمت بتهيئته. يمكن أن يتغير القالب الأصلي بشكل مستقل عن هذا الورشة. المقتطف التالي **تم التحقق منه** في 4 نوفمبر 2026؛ وهو ليس بديلاً عن الملف الكامل:

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` يحدد مشروع AZD؛ `metadata.template` يسجل نسخة القالب.
- `requiredVersions.azd` هو الحد الأدنى للقالب، وليس توصية بالبقاء على واجهة سطر أوامر قديمة. استخدم إصدار AZD الحالي والمدعوم.
- `services` يحدد أهداف نشر التطبيق. هذا القالب ينشر API بايثون والواجهة الأمامية كخدمة تطبيقات حاويات واحدة.
- `project` هو نسبي إلى `azure.yaml`.
- `remoteBuild` يطلب بناء حاوية عن بعد. هويتك لا تزال بحاجة إلى الأذونات المطلوبة من Azure.

ملفات Bicep الخاصة بالقالب تحت `infra/`، وليس قائمة `services` فقط، تعلن عن الموارد مثل Microsoft Foundry، نشر النماذج، التخزين، وخيار AI Search الاختياري.

## 2. فهم الخطافات الحياتية

تفقد قسم `hooks` والبرمجيات النصية المشار إليها قبل تشغيل القالب. النسخة المُراجعة تحتوي على:

| الخطاف | الغرض | السلوك المهم |
|------|---------|--------------------|
| `preup` | التحقق من مدخلات بيئة القالب قبل سير عمل `up` | يمكن للبرمجيات النصية الخاصة بالمنصة إيقاف سير العمل عند الفشل |
| `postdeploy` | تشغيل إعدادات خاصة بالقالب بعد نشر التطبيق | تفقد `continueOnError` ومخرجات البرمجيات النصية؛ نجاح النشر لا يثبت نجاح كل مهمة إعداد |

هذه النسخة **لا** تحتوي على الخطاف الأقدم `postprovision` / `write_env` الموضح في مواد الورش السابقة. لا تنسخ مراجع الخطاف إلى برمجيات نصية لم تعد موجودة.

مفاتيح الخطاف تختار أحداث دورة الحياة؛ `posix` و `windows` تختاران تنفيذات المنصة. `shell`، `run`، `interactive`، و `continueOnError` تتحكم في التنفيذ. هذه برمجيات نصية قابلة للتنفيذ بصلاحياتك، لذا راجعها كما تفعل مع كود التطبيق.

راجع [توثيق خطافات AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) للدورة الكاملة.

## 3. تتبع مدخلات البيئة إلى البنية التحتية

نفذ هذه الأوامر من المستودع النموذجي المُهيأ:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

تفقد `infra/main.parameters.json` لترى متغيرات البيئة التي يستخدمها القالب فعليًا. تعيين اسم عشوائي عبر `azd env set` لا يغير مورد Azure تلقائيًا.

الإعدادات الافتراضية التي تمت مراجعتها تشمل:

| المدخل | الافتراضي / الغرض |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`؛ وحدات الحصة تعتمد على النموذج ونوع النشر |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`؛ اتركه معطلًا ما لم يتم مراجعة التعامل مع البيانات |

هذه المدخلات خاصة بالنموذج، وليست إعدادات AZD العالمية. تحقق من [توثيق دعم النموذج والمنطقة](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) وحصة اشتراكك قبل اختيار نموذج أو SKU أو سعة أو موقع. لا تفسر كل وحدة سعة على أنها 1000 رمز في الدقيقة.

لاختيار نموذج محادثة مختلف، قم بتحديث **الاسم، النسخة، الصيغة، SKU، والسعة معًا** وفقًا لـ [دليل تخصيص العينة](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). تغيير الاسم فقط قد يترك نسخة أو نوع نشر غير متوافق.

## 4. المختبر: تمكين البحث الاختياري والتتبع

!!! warning "هذه الإعدادات يمكن أن تضيف موارد قابلة للفوترة"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

تغييرات البنية التحتية تحتاج إلى توفير؛ `azd deploy` وحده ينشر خدمات التطبيق فقط. للحصول على فهرسة البحث وخيارات الاسترجاع المدعومة، اتبع [دليل AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). للمراقبة، اتبع [دليل القابلية للملاحظة](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

لا تمكّن التقاط محتوى المطالبات/الاستجابات على بيانات العملاء الحقيقية بدون الحصول على الموافقة المطلوبة، ضوابط الوصول، سياسة الاحتفاظ، وإخفاء الهوية.

## 5. الموارد الموجودة وCI/CD

لإعادة استخدام مشروع Foundry، اتبع تعليمات [المورد الموجود](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) في العينة. تعيين `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` يغير مسار النشر؛ في هذا السيناريو، القالب لا ينشئ Application Insights أو AI Search لك. تحقق صراحة من التبعيات، تعيينات الدور، ونشر النماذج.

قسم `pipeline.variables` يتحكم في القيم الممررة إلى خط الأنابيب المُنشأ؛ هو ليس مخزن أسرار ولا ينشئ موارد Azure. يفضل هوية مُدارة في التطبيق وOIDC لـ CI/CD. ملفات بيئة AZD هي نصوص عادية ولا يجب الالتزام بها.

يدعم AZD استيراد ملف dotenv موثوق ومُعد محليًا:

```bash
azd env set --file .env
```

راجع هذا الملف قبل استيراده، ولا تطبع ملفات البيئة التي تحتوي على أسرار في الطرفيات المشتركة أو سجلات CI.

## 6. تحقق من فهمك

- أي خدمة `azure.yaml` تنشر التطبيق؟
- أي معلمة بنية تحتية تستهلك كل قيمة قمت بتغييرها؟
- أي تغييرات تتطلب توفيرًا بدلاً من النشر فقط؟
- هل دعم الإقليم والاشتراك المختار النموذج والحصة؟
- هل نجحت كل خطافات الإعداد، وهل يمكنك التحقق من سلوك التطبيق المنشور؟

تابع إلى [تخصيص قالب](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->