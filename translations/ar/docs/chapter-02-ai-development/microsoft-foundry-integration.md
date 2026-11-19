# دمج Microsoft Foundry مع AZD

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - التطوير الأول للذكاء الاصطناعي
- **⬅️ الفصل السابق**: [الفصل 1: مشروعك الأول](../chapter-01-foundation/first-project.md)
- **➡️ التالي**: [وكلاء الذكاء الاصطناعي](agents.md)
- **🚀 الفصل التالي**: [الفصل 3: التكوين](../chapter-03-configuration/configuration.md)

## نظرة عامة

يوضح هذا الدليل كيفية دمج خدمات Microsoft Foundry مع Azure Developer CLI (AZD) لنشر تطبيقات الذكاء الاصطناعي بسلاسة. توفر Microsoft Foundry منصة شاملة لبناء ونشر وإدارة تطبيقات الذكاء الاصطناعي، بينما يبسط AZD عملية البنية التحتية والنشر.

## ما هو Microsoft Foundry؟

Microsoft Foundry هي منصة موحدة من مايكروسوفت لتطوير الذكاء الاصطناعي تتضمن:

- **كاتالوج النماذج**: الوصول إلى نماذج الذكاء الاصطناعي المتطورة
- **تدفق التعليمات البرمجية**: مصمم مرئي لتدفقات العمل في الذكاء الاصطناعي
- **بوابة Microsoft Foundry**: بيئة تطوير متكاملة لتطبيقات الذكاء الاصطناعي
- **خيارات النشر**: خيارات استضافة وتوسع متعددة
- **السلامة والأمان**: ميزات الذكاء الاصطناعي المسؤولة المدمجة

## AZD + Microsoft Foundry: أفضل معًا

| الميزة | Microsoft Foundry | فائدة التكامل مع AZD |
|---------|-----------------|------------------------|
| **نشر النموذج** | نشر يدوي عبر البوابة | نشر آلي وقابل للتكرار |
| **البنية التحتية** | تكوين المشروع والموارد | البدء من `azure.yaml`؛ استخراج Bicep أو Terraform عند الحاجة |
| **إدارة البيئة** | تركيز على بيئة واحدة | بيئات متعددة (التطوير/التجريب/الإنتاج) |
| **تكامل CI/CD** | خدمات النشر والتقييم | إعادة استخدام التكوين في GitHub Actions أو Azure DevOps |
| **إدارة التكاليف** | مراقبة أساسية | تحسين التكلفة حسب البيئة |

## المتطلبات الأساسية

- اشتراك Azure مع الأذونات المناسبة
- Azure Developer CLI 1.37.0 أو أحدث لتدفق Foundry GA
- الوصول إلى خدمات نماذج Microsoft Foundry
- معرفة أساسية بـ Microsoft Foundry

> **تحديث Foundry GA (2026-11-09):** وصلت حزمة الامتداد `microsoft.foundry` إلى الإصدار 1.0 وتوفر عامة في [5 نوفمبر 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). يتبع الشرح أدناه هذا الإعلان والدليل السريع المرتبط بـ Microsoft Learn. هذا مراجعة وثائقية، وليست تحققًا مباشرًا للنشر. تحتفظ الميزات الاختيارية والمعارض المستقلة بحالة الإصدار الخاصة بها.

**مخرجات التعلم:** تثبيت الحزمة GA، مراجعة `azure.yaml` لوكيل، مقارنة الردود المحلية والموزعة، وشرح التقييم وCI/CD وحدود التنظيف. للنشر خطوة بخطوة للوكيل، انتقل إلى [شرح الوكيل المستضاف](#hosted-agent-walkthrough-ga). تغطي قطع الموارد التالية أنماط تكامل أخرى.

## أنماط التكامل الأساسية

**نطاق الأمثلة:** يحتوي Bicep أدناه على قطع موارد توضيحية، وليس قالب نشر كامل. يجب أن يحدد القالب الحاوي الأسماء، `location`، الموارد المرجعية، الهويات، المخرجات، والاستضافة التطبيقية. استخدم عينة مرتبطة كنقطة بداية قابلة للتشغيل. تتطلب أمثلة Bash مصادقة Azure CLI منفصلة عن `azd auth login`.

### النمط 1: دمج نماذج Microsoft Foundry

**حالة الاستخدام**: نشر تطبيقات الدردشة باستخدام نماذج Azure OpenAI في Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

**البنية التحتية (main.bicep):**
```bicep
// Microsoft Foundry Models Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: true
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

يحتاج المتصل إلى هوية مدارة مرفقة و`Cognitive Services OpenAI User` على نطاق الحساب؛ تعطيل المفاتيح لا يمنح الوصول. تحقق من توفر المنطقة/النموذج/SKU والحصة قبل النشر.

### النمط 2: دمج البحث في الذكاء الاصطناعي + RAG

**حالة الاستخدام**: نشر تطبيقات التوليد المعزز بالاسترجاع (RAG)

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

```

لا يوجد مورد ARM لـ `Microsoft.Search/searchServices/dataConnections` لهذا التكامل. قم بتكوين فهرس البحث، مصدر البيانات، المؤشر/مجموعة المهارات أو المتجه عبر APIs الخاصة بطائرة بيانات البحث المدعومة. إذا استدعى البحث نموذج التضمين، فعّل هويته المدارة، امنح الدور المناسب للنموذج، وقم بتكوين مهارة التضمين/الموجه الخاص به. انظر [التوجيه المتكامل](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### النمط 3: دمج ذكاء الوثائق

**حالة الاستخدام**: تدفقات عمل معالجة وتحليل الوثائق

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 أنماط التكوين

### إعداد متغيرات البيئة

باستثناء إعدادات AZD الموثقة مثل `AZURE_LOCATION`، هذه هي **أسماء إدخال القالب المخصصة**. ليس لها تأثير إلا إذا استهلكها القالب/التطبيق عبر معاملات وخرائط بيئة المضيف. بالنسبة لـ `azure-search-openai-demo`، استخدم أسمائها الفعلية مثل `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` و`AZURE_SEARCH_SERVICE_SKU` بدلاً من ذلك. سعة النموذج ليست SKU الحساب.

**تكوين الإنتاج:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**تكوين التطوير:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### التكوين الآمن باستخدام Key Vault

يُفضل Entra ID مع تعطيل مصادقة المفاتيح المحلية. التالي هو فقط **بديل المصادقة بالمفتاح القديم** للتطبيقات التي تتطلب المفاتيح: يتطلب حسابًا بمصادقة المفتاح مفعّلة، وهوية التطبيق مرفقة بمضيفه، ووصول/شبكة Key Vault عاملة. لا تدمج استرجاع المفتاح مع `disableLocalAuth: true` وتتوقع أن تعمل استدعاءات المفتاح.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## سير عمل النشر

### امتدادات AZD لـ Foundry

للتدفق GA، قم بتثبيت حزمة `microsoft.foundry` بدلاً من تجميع الامتدادات الأساسية واحدًا تلو الآخر:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

تقوم الحزمة بتثبيت الوكلاء، الاتصالات، المفتش، المشاريع، الروتينات، المهارات، وصناديق الأدوات. لا تضيف مجموعة أوامر `microsoft.foundry`. يتم تثبيت التقييمات، مجموعات البيانات، الضبط الدقيق، والنماذج المخصصة بشكل منفصل عند الحاجة. انظر [مرجع تعبئة الامتدادات](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### جولة الوكيل المستضاف (GA)

يعمل **الوكيل المستضاف** على تشغيل كود الوكيل الخاص بك على حوسبة تديرها Foundry. تستخدم هذه التمرين عينة واجهة برمجة تطبيقات Python Agent Framework Responses الأساسية الأصلية، وليست القطع الكلاسيكية لوثائق وكيل الخدمة في دروس أخرى.

#### 1. التحضير والتهيئة

استخدم دليلًا فارغًا خارج هذا الفحص الخاص بالدورة. ثبت Python 3.13 أو أحدث وإصدار [uv الحالي](https://docs.astral.sh/uv/getting-started/installation/). يمكن لتثبيتات uv المستقلة استخدام `uv self update`. تحقق من [أذونات الوكيل المستضاف](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions)، توفر النماذج، والحصة في اشتراكك ومنطقتك قبل التهيئة. الموارد Azure واستدعاءات النماذج المحلية تستوجب رسومًا.

أكمل تثبيت الحزمة و`azd auth login` أعلاه. يستخدم كود العينة المحلي `DefaultAzureCredential`؛ إذا كنت تستخدم بيانات اعتماد Azure CLI، قم بتسجيل الدخول بـ `az login` باستخدام نفس الحساب والمؤجر كما في AZD. تسجيل الدخول في AZD وحده ليس تسجيل دخول Azure CLI.

شغّل هذا الأمر السطر الواحد في Bash أو PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

اختر مشروع Foundry جديد أو موجود والاشتراك والمنطقة المقصودة. لإعادة استخدام نشر نموذج، أضف `--model-deployment <existing-deployment-name>` لأمر التهيئة **قبل تشغيله**، وحدد المشروع الحالي. ابق في الدليل الذي يحتوي على `azure.yaml` الذي تم إنشاؤه للأوامر المتبقية.

#### 2. مراجعة تعريف النشر

افتح `azure.yaml` وحدد هذه الإعدادات في [العينة الأصلية](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| الإعداد | ما يجب التحقق منه |
|---------|---------------|
| `host: azure.ai.project` و`deployments` | المشروع المقصود في Foundry واسم النموذج، الإصدار، SKU النشر، والسعة |
| `host: azure.ai.agent` و`project` | الوكيل المستضاف والدليل الذي يحتوي على مصدره |
| `codeConfiguration` | وقت تشغيل Python ونقطة الدخول؛ تستخدم العينة المراجعة `python_3_13` و`main.py` |
| `uses` | اعتماد على خدمة مشروع Foundry |
| `container.resources` | تخصيص CPU والذاكرة، رغم أن الكود يُبنى عن بعد |
| `env` | تعيين نشر النموذج و`PYTHONNOUSERSITE: "1"` لتعطيل تحميل حزمة موقع المستخدم |
| `infra.provider` | `microsoft.foundry`، التي تولد البنية التحتية المطلوبة |

قم بالالتزام مع الشيفرة المصدرية لوكيل `azure.yaml` المراجعة معًا. لا تحتاج إلى بنية تحتية مكتوبة يدويًا للبدء؛ عندما تحتاج إلى ملفات تهيئة قابلة للتحرير، اتبع [استخراج البنية التحتية](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) لـ Bicep أو Terraform واستمر باستخدام `azd provision`. لا تلزم التزام بيانات الاعتماد أو حالة `.azure/` للبيئة.

#### 3. التهيئة والاختبار محليًا

```bash
azd provision
azd ai agent run
```

يمكن للتجهيز إنشاء نشرات نموذج مفقودة **حتى في مشروع معاد استخدامه**. استعرض حوارات النموذج واختر نوع نشر متاح عبر الإنترنت مثل Global Standard أو Data Zone Standard؛ تختلف الحصة والدعم الإقليمي.

تقوم الجلسة المحلية بإعداد التبعيات وفتح **مفتش الوكيل**، حيث يمكنك فحص الطلبات، الردود، ونشاط الأداة/النموذج. أبقِه يعمل وافتح نافذة طرفية ثانية في نفس دليل المشروع:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**نقطة التحقق:** تأكد من حصولك على رد ملائم ويمكنك فحص النشاط المحلي المرتبط. ما زال التنفيذ المحلي يستدعي نشر نموذج Azure الخاص بك؛ ليس اختبارًا غير متصل أو مجاني. استخدم محادثات تركيبية وتجنب كشف الأسرار أو البيانات الحساسة في إخراج المفتش.

#### 4. النشر والمقارنة

أوقف الجلسة المحلية بـ Ctrl+C عند الانتهاء. قبل الاستدعاء البعيد، قم بتكوين أو تحقق من [اتصال Application Insights ومراجعة الوصول إلى التتبع](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing) للمشروع.

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

في وضع النشر البرمجي، يرفع AZD المصدر لبناء Foundry عن بُعد؛ لا تحتاج إلى بناء حاوية محلية لهذا المسار. يوفر مخرج النشر روابط للملعب ونقطة النهاية. تحقق من رد من الوكيل المنشور وتتبع السحابة الخاص به؛ أحداث المفتش المحلي وحدها لا تثبت عمل تتبع السحابة.

للتغييرات التالية، راجع تهيئة الوكيل المستضاف المدعومة مع `azd deploy --preview`. تدفق السجلات مع `azd ai agent monitor --follow`، أو تشخيص إعدادات ومشاكل الوصول مع `azd ai agent doctor`. معاينة النشر ليست مراجعة كاملة للبنية التحتية أو الأمان.

#### 5. إضافة فحص جودة قابل للتكرار

ثبت امتداد التقييمات المنفصل، ثم أنشئ أصول اختبار مسودة:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

وصف سلوك الوكيل المقصود وحدد **مجموعة البيانات والمقيم**، ثم **تشغيل**. راجع وعدل الحالات المولدة ومقياس التقييم، بما في ذلك حالة السؤال غير المدعوم، قبل تكوين التقييم:

```bash
azd ai eval init --name quality
```

حدد مجموعة البيانات التي تمت مراجعتها والمقياس وتأكد من نشر نموذج القاضي. تفقد `evals/azure.eval.yaml` ومرجع خدمة التقييم في `azure.yaml`، ثم سجل الأصول ونفذ:

```bash
azd up
azd ai eval run start --eval quality
```

تفحص الدرجات والحالات الفاشلة أو المسببة للأخطاء؛ إكمال التقييم لا يعني تلقائيًا تجاوز الجودة. توليد وتسجيل الدرجات يتسبب أيضًا في رسوم النموذج. التزم بالتكوين غير السري، مجموعات البيانات، والمقاييس لكي يتمكن الفريق من مقارنة التغييرات. يمكن لـ `azd ai agent optimize` إعادة استخدام تقييم متوافق كنقطة أساس، ولكن راجع المرشحين قبل النشر صراحةً. انظر [بوابات الجودة والهجرة](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) للمشاريع القديمة وCI.

#### 6. إعادة استخدام سير العمل في CI/CD

بعد نجاح `azd up`، شغّل `azd pipeline config` وراجع سير عمل GitHub Actions أو Azure DevOps المولد. ثبت `microsoft.foundry` على الداعم، بالإضافة إلى `azure.ai.evaluations` إذا قمت بإجراء التقييمات. احتفظ بإعدادات التحقق، تسجيل الدخول، والبيئة المولدة؛ التثبيت وحده لا يصادق على خط الأنابيب.

استخدم بيئة AZD منفصلة لكل مرحلة، امنح هوية خط الأنابيب الأذونات المطلوبة للموارد وFoundry، واحتفظ بالاعتمادات في أسرار خط الأنابيب أو استخدم الهوية المتحدة. التزم بأصول التقييم وتحقق من أن الهوية يمكنها الوصول إلى مجموعات البيانات/المقيمين المشار إليهم. اطلع على [مثال خط الأنابيب للدورة](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) و[دليل Foundry CI/CD](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. التنظيف بشكل متعمد

بالنسبة لـ **مشروع جديد تم إنشاؤه بواسطة هذه البيئة**، راجع الموارد المدرجة بواسطة `azd down` قبل التأكيد: يحذف مجموعة الموارد وكل شيء بداخلها.

بالنسبة لـ **مشروع مُعاد استخدامه**، يترك `azd down` المشروع، الوكيل المستضاف، والموارد الأخرى مكانها. قم بإزالة الموارد غير المرغوب فيها التي تملكها فقط باستخدام [إرشادات التنظيف السريع](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources)؛ لا تحذف مجموعة موارد مشتركة لتنظيف تمرين واحد.

**فحص الإنجاز:** اشرح الإعدادات التي تتحكم في السلوك المحلي والسحابي، اعرض الردود المحلية والموزعة، راجع نتيجة تقييم، وحدد الموارد المتبقية بعد التنظيف.

### اختياري: الهيكلة باستخدام مهارة Microsoft Foundry

ثبت [مهارة Microsoft Foundry](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) لمضيف وكيل الترميز الخاص بك، ثم افتح مجلدًا فارغًا منفصلًا. اطلب منه الهيكلة الأساسية لعينة Python Agent Framework Responses API في وضع نشر الكود، شرح `azure.yaml` المولد، واقترح الاشتراك والمنطقة والمشروع ونشر النموذج. اشترط الموافقة **قبل إنشاء موارد Azure**، اطلب اختبارًا محليًا، وتوقف قبل النشر. راجع المخرجات واستمر بخطوات النشر أعلاه فقط عند الاستعداد.

بالنسبة للمشروعات القائمة، يستبدل `--template`/`-t` تهجئة `--manifest`/`-m` المهملة؛ تغيير العلامة لا ينقل الملفات التعريفية القديمة أو تكوين الوكيل المتداخل. انظر إلى [مرجع AI CLI](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### نشر أمر واحد

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### عمليات النشر الخاصة بالبيئة

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## المراقبة والرصد

### تكامل Application Insights

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
```

هذا يقوم بتوفير مورد Insights، وليس أداة تتبع بيانات القياس. بمجرد أن يرسل تطبيقك عمليات تتبع استدعاء النموذج الصادرة، شغّل هذا الاستعلام التوضيحي في سجلات Application Insights (عدّل الفلتر لأسماء التتبع الفعلية لديك):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### مراقبة التكاليف

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

استخدم مستلمًا حقيقيًا وتحقق من أذونات نطاق الفوترة. الميزانية ترسل تنبيهات؛ ليست حدًا للإنفاق.

## 🔐 ممارسات أمان أفضل

### تكوين هوية مُدارة

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### أمان الشبكة

يحتاج مقطع نقطة النهاية هذا أيضًا إلى منطقة/مجموعة DNS خاصة، روابط VNet، اتصال تطبيق VNet، وسياسة وصول عامة صريحة. إنشاء نقطة نهاية خاصة فقط لا يعني تعطيل الوصول العام.

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

## تحسين الأداء

### استراتيجيات التخزين المؤقت

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

Azure Cache for Redis Basic/Standard/Premium في طريق [التقاعد](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq)؛ استخدم Azure Managed Redis لنشريات جديدة واتبع توجيهات النموذج/المصادقة الحالية. قم بتحديد نطاق استجابات AI المؤقتة حسب التفويض، النموذج/الإرشادات، وإصدار البيانات، مع انتهاء صلاحية؛ لا تشارك أبداً استجابات خاصة باستخدام نص الاستعلام فقط.

### تكوين التحجيم التلقائي

**مورد جزئي:** ادمج هذه إعدادات المقياس/الإدخال في تطبيق حاوية كامل مع بيئة مُدارة، صورة الحاوية، وحدود الموارد. المزيد من النسخ لا يزيد حصة النموذج.

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## استكشاف مشكلات شائعة وإصلاحها

### المشكلة 1: تجاوز حصة OpenAI

**الأعراض:**
- يفشل النشر مع أخطاء الحصة
- أخطاء 429 في سجلات التطبيق

**الحلول:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

متغير السعة أعلاه ينطبق فقط على نموذج مخصص موصول لاستهلاكه. لنموذج RAG، استخدم `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. لا تغير `AZURE_LOCATION` لنقل الموارد القائمة؛ أنشئ بيئة منفصلة لمنطقة جديدة وخطط للهجرة/التنظيف.

### المشكلة 2: فشل المصادقة

**الأعراض:**
- أخطاء 401/403 عند استدعاء خدمات AI
- رسائل "الوصول مرفوض"

**الحلول:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### المشكلة 3: مشكلات نشر النموذج

**الأعراض:**
- النماذج غير متاحة في النشر
- إصدارات نموذج محددة تفشل

**الحلول:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## قوالب أمثلة

هذه بدائل، ليست أوامر متسلسلة. ابدأ كلًا منها في دليل فارغ منفصل. الوجهة `.` الصريحة تبقي التهيئة في دليلك الحالي؛ خلاف ذلك قد ينشئ AZD دليلًا فرعيًا باسم القالب بدون تغيير دليل عمل الصدفة.

### تطبيق دردشة RAG (بايثون)

**المستودع**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**الخدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**الوصف**: تطبيق دردشة RAG مرجعي لأسئلة عبر مستنداتك، مع استرجاع Azure AI Search. راجع النماذج المدعومة الحالية، الميزات الاختيارية، إرشادات التكلفة، وتقوية الإنتاج قبل الاستخدام؛ نشر عينة لا يجعل التطبيق جاهزًا للإنتاج.

**بدء سريع**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### تطبيق دردشة RAG (.NET)

**المستودع**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**الخدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**الوصف**: مكافئ .NET/C# لعينة دردشة RAG بايثون. مبني باستخدام ASP.NET Core Minimal API وواجهة Blazor WebAssembly. يشمل دردشة صوتية، دعم رؤية GPT-4o-mini، وعميل سطح مكتب/هاتف محمول هجين .NET MAUI Blazor مرافق.

**بدء سريع**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### تطبيق دردشة RAG (جافا)

**المستودع**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**الخدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**الوصف**: نسخة جافا من عينة دردشة RAG باستخدام Langchain4J للتنسيق مع AI. يدعم هندسة الخدمات المصغرة المعتمدة على الأحداث، استراتيجيات البحث المتعددة (نص، متجه، هجين)، رفع المستندات مع Azure Document Intelligence، والنشر على Azure Container Apps أو Azure Kubernetes Service.

**بدء سريع**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### مساعد التجزئة المؤسسي مع Microsoft Foundry

**المستودع**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**الخدمات**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**الوصف**: مساعد RAG للبيع بالتجزئة المتكامل من البداية للنهاية باستخدام Microsoft Foundry وPrompty. شات بوت لمتجر Contoso Outdoor يعرض الردود بناءً على كتالوج المنتجات وبيانات طلبات العملاء. يعرض كامل سير عمل GenAIOps — نموذج أولي مع Prompty، تقييم بمساعدة AI، ونشر عبر AZD إلى Container Apps.

**بدء سريع**:
```bash
azd init --template contoso-chat .
azd up
```

### تطبيق كتابة إبداعي متعدد الوكلاء

**المستودع**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**الخدمات**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**الوصف**: عينة متعدد الوكلاء توضح تنسيق وكلاء AI مع Prompty. يستخدم وكيل بحث (Bing Grounding في Azure AI Agent Service)، وكيل منتج (Azure AI Search)، وكيل كاتب، ووكيل محرر لإنتاج مقالات جيدة البحث بشكل تعاوني. يشمل CI/CD مع تقييم في GitHub Actions.

**بدء سريع**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### دردشة RAG بدون خادم (JavaScript/TypeScript)

**المستودع**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**الخدمات**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB ل NoSQL + LangChain.js

**الوصف**: دردشة RAG بدون خادم بالكامل باستخدام LangChain.js مع Azure Functions للAPI وAzure Static Web Apps للاستضافة. يستخدم Azure Cosmos DB كقاعدة متجه وقاعدة تاريخ الدردشة. يدعم التطوير المحلي مع Ollama للاختبار بدون تكلفة.

**بدء سريع**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### مسرّع الحلول دردشة مع بياناتك

**المستودع**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**الخدمات**: Microsoft Foundry + Azure Container Apps (ويب/API/الاستيعاب) + Azure AI Search مع Cosmos DB، أو PostgreSQL مع pgvector

**الوصف**: مسرّع دردشة يعتمد على المستندات مع اقتباسات. تستضيف العينة الحالية واجهة React، خلفية FastAPI، وعامل استيعاب Functions على Container Apps؛ خيارات المنسق هي Agent Framework وLangGraph. يتم اختيار خيارات قاعدة البيانات/الاسترجاع عند النشر. هو نقطة بداية، ليس نظام إنتاج جاهز؛ لا تفترض أن إصدارات App Service الأقدم أو Semantic Kernel أو Prompt Flow تمثل الافتراضي الحالي.

**بدء سريع**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### وكلاء سفر AI — تنسيق MCP متعدد الوكلاء

**المستودع**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**الخدمات**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**الوصف**: تطبيق مرجعي لتنسيق AI متعدد الوكلاء باستخدام ثلاثة أُطُر (LangChain.js, LlamaIndex.TS, وMicrosoft Agent Framework). يتضمن خوادم MCP (بروتوكول سياق النموذج) بأربع لغات منشورة كـ Container Apps بدون خادم مع مراقبة OpenTelemetry.

**بدء سريع**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **تصفح المزيد من القوالب**: زر [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) للقوالب المتوفرة حاليًا عبر اللغات والسيناريوهات. كل مثال مرتبط هو مستودع خارجي، ليس مثالًا محليًا موفّرًا من هذه الدورة؛ تحقق من متطلباته الحالية وإرشاداته الإنتاجية قبل النشر.

## الخطوات التالية

1. **جرب الأمثلة**: ابدأ بقالب مسبق البناء يتناسب مع حالتك
2. **خصص لاحتياجاتك**: عدّل البنية التحتية وكود التطبيق
3. **أضف المراقبة**: نفّذ رؤية شاملة
4. **حسّن التكاليف**: اضبط الإعدادات وفق ميزانيتك
5. **أمّن نشر التطبيق**: نفّذ نماذج أمان مؤسسية
6. **وسع للإنتاج**: أضف ميزات متعددة المناطق والتوفر العالي

## 🎯 تمارين تطبيقية

### التمرين 1: نشر تطبيق دردشة Microsoft Foundry Models (30 دقيقة)
**الهدف**: نشر واختبار تطبيق دردشة AI مرجعي

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Review the listed resources and confirm cleanup
azd down
```

**معايير النجاح:**
- [ ] يتم النشر دون أخطاء الحصة
- [ ] يمكن الوصول إلى واجهة الدردشة في المتصفح
- [ ] يمكن طرح الأسئلة والحصول على استجابات مُمَكّنة بالذكاء الاصطناعي
- [ ] تعرض Application Insights بيانات القياس
- [ ] تم تنظيف الموارد بنجاح

**التكلفة:** راجع دليل التكلفة الحالي للعينة والSKU المختارة قبل النشر. الفوترة تستمر حتى حذف الموارد؛ لا يوجد تقدير ثابت بـ 30 دقيقة لكل التكوينات.

### التمرين 2: تكوين نشر متعدد النماذج (45 دقيقة)
**الهدف**: نشر نماذج AI متعددة مع تكوينات مختلفة

**نقطة البداية:** حساب Azure OpenAI قائم ووحدة مجموعة موارد AZD يمكنها استدعاء هذا الملف. أنشئ `infra/ai-models.bicep` بالمحتوى التالي باستخدام المحرر. لا يتم نشره تلقائيًا لأنه موجود تحت `infra/`.

```bicep
param openAiAccountName string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

من وحدة مجموعة الموارد التي تملك الحساب، أضف استدعاء وحدة (عدّل اسم الرمز إلى حسابك الفعلي):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

لا تعلن عن نفس عمليات النشر في كلا الوحدتين. إذا كانت نقطة دخول AZD على مستوى الاشتراك، فقم باستدعاء هذا من وحدة فرعية على مستوى مجموعة الموارد وعدل المسار النسبي. ابنِ تلك الوحدة المحتوية باستخدام `az bicep build --file <path-to-containing-module>`، ثم:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**معايير النجاح:**
- [ ] تم نشر نماذج متعددة بنجاح
- [ ] تم تطبيق إعدادات سعة مختلفة
- [ ] النماذج متاحة عبر API
- [ ] يمكن استدعاء كلا النموذجين من التطبيق

### التمرين 3: تنفيذ مراقبة التكاليف (20 دقيقة)
**الهدف**: إعداد تنبيهات الميزانية وتتبع التكاليف

**نقطة البداية:** نمط الميزانية أعلاه ووحدة بنية تحتية على مستوى مجموعة الموارد. أضف هذا المورد باستخدام المحرر؛ مرّر `budgetStartDate` من تخطيط المعاملات (لا تكرر المعامل إذا تم إعلانه). استبدل المستلم وتأكد من امتلاكك حق كتابة الميزانية.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

المتوقع: تحتوي الاستجابة على `amount: 200`، كلا الحدّين، ومستلمك. افحص إدارة التكاليف بالبوابة للرسوم الفعلية؛ بيانات التكلفة متأخرة والتنبيه قد لا ينطلق خلال تمرين قصير.

**معايير النجاح:**
- [ ] تم إنشاء تنبيه ميزانية في Azure
- [ ] تم تكوين إشعارات البريد الإلكتروني
- [ ] يمكن عرض بيانات التكلفة في بوابة Azure
- [ ] تم ضبط حدود الميزانية بشكل مناسب

## 💡 الأسئلة الشائعة

<details>
<summary><strong>كيف أقلل تكاليف نماذج Microsoft Foundry أثناء التطوير؟</strong></summary>

1. **تحقق من التسعير**: لا يوجد تخصيص شهري مجاني عام من 50,000 رمز نموذج Azure OpenAI
2. **ضبط السعة بالشكل الصحيح**: تعني السعة `10` عادةً 10,000 TPM لهذه النماذج النصية Standard، وليس 10 TPM. تقليل حد المعدل هذا لا يخفض أسعار الرموز المفردة
3. **استخدم azd down**: احذف الموارد القابلة للإزالة عندما لا تكون في طور التطوير الفعلي (هذا ليس إلغاء التخصيص)
4. **استخدام التخزين المؤقت للردود**: نفذ ذاكرة Redis للاستعلامات المتكررة
5. **استخدم هندسة الإيعاز**: قلل استخدام الرموز باستخدام التعليمات الفعالة

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>ما الفرق بين نماذج Microsoft Foundry وواجهة برمجة تطبيقات OpenAI؟</strong></summary>

**نماذج Microsoft Foundry**:
- أمان مؤسسي والتزام
- تكامل الشبكة الخاصة
- ضمانات اتفاقية مستوى الخدمة (SLA)
- مصادقة الهوية المُدارة
- حصص أعلى متاحة

**واجهة برمجة تطبيقات OpenAI**: مزود/واجهة API منفصل له توفر النماذج والتسعير والمصادقة وخيارات الاتصال المؤسسي الخاصة به. قارن العروض الحالية بدلاً من الافتراض أنها فقط متاحة عبر الإنترنت العام أو ترسل النماذج أولًا دائمًا.

اختر بناءً على متطلبات مؤسستك؛ تنطبق أمثلة الهوية المُدارة والروابط الخاصة المحددة بـ Azure في هذه الدورة على خدمات مستضافة في Azure، وليس كل نموذج/مزود في كتالوج Foundry.
</details>

<details>
<summary><strong>كيف أتعامل مع أخطاء تجاوز حصة Microsoft Foundry Models؟</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>هل يمكنني استخدام بياناتي الخاصة مع Microsoft Foundry Models؟</strong></summary>

نعم! استخدم **Azure AI Search** لـ RAG (التوليد المعزز بالاسترجاع):

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

انظر قالب [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>كيف أقوم بتأمين نقاط نهاية نموذج الذكاء الاصطناعي؟</strong></summary>

**أفضل الممارسات**:
1. استخدم الهوية المُدارة (بدون مفاتيح API)
2. فعّل نقاط النهاية الخاصة
3. قم بتكوين مجموعات أمان الشبكة
4. نفذ تحديد المعدل
5. استخدم Azure Key Vault للأسرار

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## المجتمع والدعم

- **مايكروسوفت فاوندري ديسكورد**: [#قناة Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [المشكلات والنقاشات](https://github.com/Azure/azure-dev)
- **مايكروسوفت ليرن**: [التوثيق الرسمي](https://learn.microsoft.com/azure/ai-studio/)
- **مهارات الوكيل**: [مهارة مايكروسوفت فاوندري على skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - قم بتثبيت مهارات وكلاء Azure + Foundry في محررك باستخدام `npx skills add microsoft/github-copilot-for-azure`

---

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - التطوير المرتكز على الذكاء الاصطناعي
- **⬅️ الفصل السابق**: [الفصل 1: مشروعك الأول](../chapter-01-foundation/first-project.md)
- **➡️ التالي**: [وكلاء الذكاء الاصطناعي](agents.md)
- **🚀 الفصل التالي**: [الفصل 3: التكوين](../chapter-03-configuration/configuration.md)

**تحتاج مساعدة؟** انضم إلى مناقشات مجتمعنا أو افتح مشكلة في المستودع. مجتمع Azure AI + AZD هنا لمساعدتك على النجاح!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->