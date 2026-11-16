# هيكلية متعددة الوكلاء للبيع بالتجزئة

**مثال على هندسة متقدمة — ليست تطبيقًا متعدد الوكلاء يعمل.**

[الصفحة الرئيسية للدورة](../../README.md) ·
[الفصل 5](../../docs/chapter-05-multi-agent/README.md) ·
[مخطط الهندسة](../retail-scenario.md)

## ما يتم نشره هنا

يحتوي هذا الدليل على قالب ARM، والمعلمات، وسكربت نشر Bash.
لا يوجد **أي مصدر لتطبيق `azure.yaml` أو لتطبيق البيع بالتجزئة**.

| المورد | الحالة الفعلية بعد التهيئة |
|---|---|
| حساب Azure OpenAI الأساسي | نشر `gpt-4.1-chat` باستخدام نسخة `gpt-4.1` `2025-04-14`, `GlobalStandard` |
| حساب OpenAI ثانوي (اختياري) | `gpt-4.1-mini-inventory`، نموذج `gpt-4.1-mini` نسخة `2025-04-14`، `GlobalStandard` |
| حساب التضمين (اختياري) | نسخة `text-embedding-ada-002` `2`، `Standard`؛ لا يوجد خط أنابيب للفهرسة |
| حساب المقيم OpenAI | `gpt-4.1-grader`، النموذج `gpt-4.1` نسخة `2025-04-14`، `GlobalStandard`؛ لا يوجد مقيم |
| البحث بالذكاء الاصطناعي | خدمة فارغة؛ لا يوجد فهرس أو مستندات |
| التخزين | حاويات كتل `documents` و `uploads` فارغة |
| Cosmos DB | حساب بدون خادم، قاعدة بيانات `chathistory`، حاوية `conversations` مقسمة حسب `/userId`، وقت حياة العنصر 30 يومًا |
| تطبيقات الحاويات | كل من الموجه والواجهة الأمامية يعملان بـ `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` على المنفذ 80 |
| Key Vault (اختياري) | خزنة فارغة مفعلة بنظام RBAC؛ **لا أسرار أو تعيينات أدوار** |
| Application Insights / Log Analytics (اختياري) | تجميع سجلات الموارد والبيئة؛ لا توجد أدوات خاصة بالتطبيق، أو تنبيهات، أو لوحات تحكم |
| Document Intelligence | حساب S0؛ لا يوجد تدفق عمل لمعالجة المستندات |

تم إيقاف Bing Search v7 القديم في 11 أغسطس 2025 و**لم يتم توفيره**.
لم يتم تنفيذ أي تكامل لاستبدال تأصيل الويب.

**غير مشمول:** وكلاء العملاء/المخزون، API الموجه `/chat`، واجهة محادثة الواجهة الأمامية،
مخطط البحث أو سكربتات الإدخال، سجل حاويات Azure، النقاط النهائية الخاصة،
الهويات المدارة، تعيينات RBAC، التحويل التلقائي، Front Door، ماسح الفريق الأحمر،
CLI التقييمي، المصادقة، أو CI/CD.

تؤكد رسالة نجاح ARM فقط توفير المورد. لا تصادق على
وظائف التطبيق، الأمان، التوفر، أو الجاهزية للإنتاج.

## المتطلبات والتكاليف

- Bash (Git Bash/WSL على Windows) و
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- اشتراك بصلاحيات لإنشاء جميع الموارد المدرجة.
- تحقق من توفر **كل نموذج/نسخة/SKU في كل منطقة مختارة** و 
  الحصة الخاصة باشتراكك. القيم الافتراضية أمثلة وليست ضمانات.
  راجع [توفر النماذج](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- اختر مجموعة موارد مخصصة يمكنك حذفها بعد الاختبار.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

المواقع الافتراضية: الرئيسي `eastus2`، الثانوي `westus2`، التضمينات `francecentral`؛
الضابط الافتراضي هو المنطقة الرئيسية ما لم يتم تزويد `graderLocation`.
`--no-multi-region` يتخطى الحسابات الثانوية وحسابات التضمين؛ لكنه لا يتخطى
حساب الضابط.

يتم فرض رسوم على البحث أثناء توفيره حتى وإن كان فارغًا. الحد الأدنى من نسخ الحاويات،
الزيادة في التخزين، طلبات/تخزين Cosmos DB، رموز النموذج، مكالمات Document Intelligence،
وابتلاع/تخزين السجلات يمكن أن تضيف تكاليف. لا توجد **إجمالي شهري ثابت أو مضمون**.
قدّر الـ SKUs الدقيقة في
[آلة حاسبة تسعير أزور](https://azure.microsoft.com/pricing/calculator/) و
تكوين ميزانية قبل النشر.

### أوضاع النشر

هذه الإعدادات هي أحجام الموارد، **وليست شهادات إنتاج أو اتفاقية مستوى الخدمة**:

| الوضع | وحدات سعة الدردشة / الصغيرة / التضمين / المقيم | نسخ جهاز التوجيه | نسخ الواجهة الأمامية | طبقة البحث | التخزين |
|---|---|---|---|---|---|
| الحد الأدنى | 10 / 10 / 20 / 5 | 0–3 | 1–2 | أساسي، نسخة واحدة | Standard_LRS |
| قياسي | 20 / 15 / 30 / 15 | 1–3 | 1–2 | قياسي، نسخة واحدة | Standard_ZRS |
| بريميوم | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2، نسختان | Standard_GRS |

وحدات سعة النموذج مخصصة لنموذج/رمز المنتج؛ لا تجمعها كضمان TPM عالمي.
بريميوم لا يفعل التطبيقات الحاوية المتكررة عبر المناطق: ذلك يتطلب
تصميم شبكة إضافي. بحث الأساسي يدعم البحث المتجه، وفقاً
لحدود الخدمة؛ ولكنه ليس غير متوافق مع المتجهات بطبيعته.

## 🚀 النشر السريع

راجع `azuredeploy.json` و `azuredeploy.parameters.json` أولاً. الأوامر
أدناه **تنشئ موارد أزور قابلة للفوترة**؛ فهي ليست تحققات غير متصلة.

من جذر المستودع:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

يستخدم البرنامج النصي مسارات نسبية إلى دليله الخاص، يتحقق من تسجيل الدخول/الأدوات/الوسائط،
ينشئ مجموعة الموارد إذا لم تكن موجودة، يتحقق من النشر، يوفر الموارد، وي
عرض المخرجات غير السرية. لا يلزم أو يتم تنفيذ سحب `jq` البيانات، أو
استرجاع الأسرار، أو إعداد التطبيق بعد النشر.

قيم سطر الأوامر الافتراضية للبرنامج النصي تتجاوز القيم المقابلة في
ملف المعلمات. حرر ملف المعلمات من أجل إعدادات مثل المناطق الثانوية/الثالثية؛
استخدم النشر المباشر عبر CLI إذا كنت بحاجة إلى تجاوزات معلمات عشوائية:

```bash
az group create --name retail-learning-rg --location eastus2
az deployment group create \
  --resource-group retail-learning-rg \
  --name retail-learning \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --parameters projectName=retail environmentName=dev \
    deploymentMode=minimal enableMultiRegion=false
```

قد يستغرق التزويد 15–45 دقيقة أو أكثر، وقد يفشل بسبب حصص إقليمية أو
قيود دورة حياة النموذج. لا تحاول إعادة المحاولة بشكل أعمى: اقرأ عملية الفشل أولاً.

## خيارات التكوين

| المعامل | الافتراضي في القالب | المعنى |
|---|---|---|
| `projectName` | مطلوب (`retail` في ملف المعلمات) | 3–10 أحرف صغيرة/أرقام |
| `location` | موقع مجموعة الموارد | المنطقة الرئيسية (`eastus2` في ملف المعلمات) |
| `secondaryLocation` | `westus2` | منطقة حساب النموذج الصغير |
| `tertiaryLocation` | `francecentral` | منطقة حساب التضمينات |
| `graderLocation` | المنطقة الرئيسية | منطقة حساب المقيم المستقل |
| `environmentName` | `dev` | `dev`، `staging`، أو `prod`؛ الاسم فقط، وليس تبديل تعزيز الأمان |
| `deploymentMode` | `standard` | اختيار الوحدة النمطية/السعة |
| `enableMultiRegion` | `true` | إضافة الحسابات الثانوية وحسابات التضمينات |
| `enableMonitoring` | `true` | إضافة Insights/مساحة العمل وجمع سجلات البيئة |
| `enableSecurity` | `true` | إنشاء صندوق محصن ممكن بإمكانيات RBAC فقط |

تم إزالة المعامل المضلل `openAiApiVersion`: إصدار API لطبقة البيانات
لا يتحكم في إصدارات موارد ARM أو إصدارات النماذج. أزواج اسم/إصدار النموذج
موجودة في `variables.modelDeployments`؛ تحقق منها مع SKU النشر.

## تحقق من التزويد

استخدم اسم النشر من مخرجات البرنامج النصي أو `az deployment group list`.
للنشر المباشر أعلاه:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

المتوقع: حالة النشر `Succeeded`. لفشل، افحص تفاصيل خطأ العملية.
قائمة الموارد وحدها ليست فحصاً موثوقاً لحالة التزويد.

اختبر العنصر النائب **root**، وليس نقطة نهاية الوكيل غير الموجودة:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

المتوقع: صفحة مرحباً HTTP 200، **ليست استجابة دردشة**. خطأ HTTP
لا يُعتبر تحققاً ناجحاً.

لاختبار استدلال النموذج الرئيسي الفعلي (قابل للفوترة):

```bash
OPENAI_ENDPOINT=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.openAiEndpointPrimary.value -o tsv)
OPENAI_NAME=$(az cognitiveservices account list -g "$RG" \
  --query "[?kind=='OpenAI' && contains(name, '-openai-primary-')].name | [0]" -o tsv)
OPENAI_KEY=$(az cognitiveservices account keys list -g "$RG" -n "$OPENAI_NAME" \
  --query key1 -o tsv)
curl --fail-with-body \
  "${OPENAI_ENDPOINT%/}/openai/deployments/gpt-4.1-chat/chat/completions?api-version=2024-10-21" \
  -H "Content-Type: application/json" -H "api-key: $OPENAI_KEY" \
  -d '{"messages":[{"role":"user","content":"Say hello"}],"max_tokens":20}'
unset OPENAI_KEY
```

المتوقع: JSON مع `choices` و `usage`. اسم النشر هو
`gpt-4.1-chat`، وليس اسم النموذج الأساسي `gpt-4.1`.

## 🔧 بعد النشر: الخطوات التالية

هذا هو **قائمة تطوير خلفية**، وليس تمرينًا منتهيًا:

1. تنفيذ وكلاء العملاء/المخزون المصادق عليهم وعقد جهاز التوجيه.
2. تنفيذ الواجهة الأمامية والتحقق من تكوينها.
3. إنشاء وفهرسة بحث مع بعد/ملف تعريف يتطابق مع نموذج
   التضمين الخاص بك، والتعامل مع أخطاء الوثائق والتحديثات.
4. إنشاء سجل وتكوين هوية السحب/الأذونات.
5. بناء ودفع الصور الحقيقية. تغيير منافذ وعيّنات التطبيق الحاوي إلى
   مطابقة تلك الصور قبل الاختبار؛ المنفذ 80 هنا مخصص للعناصر النائبة.
6. تكوين الأسرار أو الهويات المُدارة وأدوار طبقة البيانات المخصصة. لا
   تشير إلى أسماء أسرار وهمية: هذا القالب لا ينشئ أي أسرار تطبيق.
7. ترصين التطبيقات، تكوين التنبيهات، اختبار الفشل/الاسترداد، وتقييم
   النتائج مع الحقيقة الأرضية الممثلة والمراجعة البشرية.

راجع [مخطط الهندسة المعمارية](../retail-scenario.md) لحدود التصميم.

## استكشاف الأخطاء وحدود الأمان

- **النموذج غير متوفر:** تحقق من النموذج/الإصدار/رمز التخزين، المنطقة، وحصة الاشتراك؛
  لا يقوم البرنامج النصي بفحص أدلة النماذج مسبقًا.
- **المراقبة معطلة:** وجهة سجل البيئة هي `none`، وليس
  تكوين Log Analytics فارغ وغير صالح.
- **نماذج عناصر نائبة فقط:** `/chat`، تقييم الوكيل، واستيعاب الملفات غير موجودة.
- **الشبكة/الهوية:** نقاط النهاية العامة والمصادقة المحلية مفعلة.
  تشغيل RBAC على Key Vault لا ينشئ تعيينات أدوار أو هويات تلقائيًا.
- **الإنتاج:** أضف المصادقة، الهويات المحددة النطاق، إدارة الأسرار،
  الشبكات الخاصة حسب الحاجة، تصميم التوافر، واختبارات التشغيل.
  حسابات النموذج متعددة المناطق وحدها لا توفر التحويل التلقائي.

## التنظيف

لا يوجد مشروع AZD هنا؛ `azd down` ليست أمر التنظيف.
بعد التحقق من أن المجموعة تحتوي فقط على موارد التعلم الخاصة بك:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

المتوقع بعد الانتهاء من الحذف: `false`. قد تحتفظ موارد Key Vault وCognitive Services
المحذوفة برقم تعريف الاسم؛ يتطلب الحذف النهائي أذونات مناسبة.
تحقق من إدارة التكلفة للرسوم المؤجلة على الاستخدام.

[الإبلاغ عن مشكلة](https://github.com/microsoft/AZD-for-beginners/issues) ·
[بحث Azure AI](https://learn.microsoft.com/azure/search/) ·
[تطبيقات الحاوية](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->