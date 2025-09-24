<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4e403f041411361140d6beb88ab2a181",
  "translation_date": "2025-09-24T12:07:29+00:00",
  "source_file": "workshop/docs/instructions/3-Deconstruct-AI-Template.md",
  "language_code": "ar"
}
-->
# 3. تفكيك القالب

!!! tip "بنهاية هذه الوحدة ستكون قادرًا على"

    - [ ] عنصر
    - [ ] عنصر
    - [ ] عنصر
    - [ ] **المختبر 3:**

---

مع قوالب AZD وأداة Azure Developer CLI (`azd`) يمكننا البدء بسرعة في رحلة تطوير الذكاء الاصطناعي باستخدام مستودعات قياسية توفر أمثلة على التعليمات البرمجية، البنية التحتية وملفات التكوين - في شكل مشروع _بداية_ جاهز للنشر.

**لكن الآن، نحتاج إلى فهم هيكل المشروع وقاعدة التعليمات البرمجية - وأن نكون قادرين على تخصيص قالب AZD - دون أي خبرة أو فهم مسبق لـ AZD!**

---

## 1. تفعيل GitHub Copilot

### 1.1 تثبيت GitHub Copilot Chat

حان الوقت لاستكشاف [GitHub Copilot مع وضع الوكيل](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). الآن، يمكننا استخدام اللغة الطبيعية لوصف مهمتنا على مستوى عالٍ، والحصول على المساعدة في التنفيذ. في هذا المختبر، سنستخدم [الخطة المجانية لـ Copilot](https://github.com/github-copilot/signup) التي تحتوي على حد شهري للإكمالات وتفاعلات الدردشة.

يمكن تثبيت الامتداد من السوق، ولكنه يجب أن يكون متاحًا بالفعل في بيئة Codespaces الخاصة بك. _انقر على `Open Chat` من القائمة المنسدلة لأيقونة Copilot - واكتب طلبًا مثل `What can you do?`_ - قد يُطلب منك تسجيل الدخول. **GitHub Copilot Chat جاهز الآن**.

### 1.2 تثبيت خوادم MCP

لكي يكون وضع الوكيل فعالًا، يحتاج إلى الوصول إلى الأدوات المناسبة لمساعدته في استرجاع المعرفة أو اتخاذ الإجراءات. هنا تأتي خوادم MCP للمساعدة. سنقوم بتكوين الخوادم التالية:

1. [خادم Azure MCP](../../../../../workshop/docs/instructions)
1. [خادم Microsoft Docs MCP](../../../../../workshop/docs/instructions)

لتفعيل هذه الخوادم:

1. قم بإنشاء ملف يسمى `.vscode/mcp.json` إذا لم يكن موجودًا
1. انسخ ما يلي إلى ذلك الملف - وابدأ تشغيل الخوادم!
   ```json title=".vscode/mcp.json"
   {
      "servers": {
         "Azure MCP Server": {
            "command": "npx",
            "args": [
            "-y",
            "@azure/mcp@latest",
            "server",
            "start"
            ]
         },
         "microsoft.docs.mcp": {
            "type": "http",
            "url": "https://learn.microsoft.com/api/mcp"
         }
      }
   }
   ```

??? warning "قد تحصل على خطأ بأن `npx` غير مثبت (انقر للتوسيع للإصلاح)"

      للإصلاح، افتح ملف `.devcontainer/devcontainer.json` وأضف هذا السطر إلى قسم الميزات. ثم أعد بناء الحاوية. يجب أن يكون لديك الآن `npx` مثبتًا.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3 اختبار GitHub Copilot Chat

**استخدم أولاً `az login` للمصادقة مع Azure من سطر أوامر VS Code.**

يجب أن تكون الآن قادرًا على استعلام حالة اشتراك Azure الخاص بك، وطرح أسئلة حول الموارد المنشورة أو التكوين. جرب هذه الطلبات:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

يمكنك أيضًا طرح أسئلة حول وثائق Azure والحصول على ردود مستندة إلى خادم Microsoft Docs MCP. جرب هذه الطلبات:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

أو يمكنك طلب مقتطفات تعليمات برمجية لإكمال مهمة. جرب هذا الطلب:

1. `Give me a Python code example that uses AAD for an interactive chat client`

في وضع `Ask`، سيقدم لك التعليمات البرمجية التي يمكنك نسخها ولصقها وتجربتها. في وضع `Agent`، قد يذهب خطوة أبعد ويقوم بإنشاء الموارد ذات الصلة لك - بما في ذلك نصوص الإعداد والوثائق - لمساعدتك في تنفيذ تلك المهمة.

**أنت الآن مجهز لبدء استكشاف مستودع القالب**

---

## 2. تفكيك الهيكلية

??? prompt "ASK: اشرح هيكلية التطبيق في docs/images/architecture.png في فقرة واحدة"

      هذا التطبيق هو تطبيق دردشة مدعوم بالذكاء الاصطناعي مبني على Azure ويظهر هيكلية حديثة تعتمد على الوكلاء. تركز الحل على تطبيق Azure Container App الذي يستضيف التعليمات البرمجية الرئيسية للتطبيق، والتي تعالج إدخال المستخدم وتولد ردودًا ذكية من خلال وكيل الذكاء الاصطناعي.

      تستفيد الهيكلية من مشروع Azure AI Foundry كأساس للقدرات الذكية، متصلة بخدمات Azure AI التي توفر نماذج اللغة الأساسية (مثل GPT-4o-mini) ووظائف الوكيل. تتدفق تفاعلات المستخدم عبر واجهة أمامية تعتمد على React إلى واجهة خلفية FastAPI تتواصل مع خدمة وكيل الذكاء الاصطناعي لتوليد ردود سياقية.

      يتضمن النظام قدرات استرجاع المعرفة من خلال البحث في الملفات أو خدمة Azure AI Search، مما يسمح للوكيل بالوصول إلى المعلومات والاستشهاد بها من الوثائق المرفوعة. لتحقيق التميز التشغيلي، تتضمن الهيكلية مراقبة شاملة من خلال Application Insights وLog Analytics Workspace لتتبع الأداء وتحسينه.

      يوفر Azure Storage تخزينًا للبيانات والملفات المرفوعة، بينما يضمن Managed Identity الوصول الآمن بين موارد Azure دون تخزين بيانات الاعتماد. تم تصميم الحل بالكامل ليكون قابلًا للتوسع والصيانة، مع تطبيق مخصص يتم توسيعه تلقائيًا بناءً على الطلب مع توفير الأمان المدمج، المراقبة، وقدرات CI/CD من خلال نظام خدمات Azure المُدارة.

![Architecture](../../../../../translated_images/architecture.48d94861e6e6cdc000edd4d7e2a5020cf2e97a97dbe353789ae9da48c946ccd0.ar.png)

---

## 3. هيكلية المستودع

!!! prompt "ASK: اشرح هيكلية مجلد القالب. ابدأ بمخطط هرمي بصري."

??? info "ANSWER: مخطط هرمي بصري"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 التكوين والإعداد
      │   ├── azure.yaml                    # تكوين Azure Developer CLI
      │   ├── docker-compose.yaml           # حاويات التطوير المحلية
      │   ├── pyproject.toml                # تكوين مشروع Python
      │   ├── requirements-dev.txt          # متطلبات التطوير
      │   └── .devcontainer/                # إعداد حاوية التطوير لـ VS Code
      │
      ├── 🏗️ البنية التحتية (infra/)
      │   ├── main.bicep                    # قالب البنية التحتية الرئيسي
      │   ├── api.bicep                     # موارد خاصة بـ API
      │   ├── main.parameters.json          # معلمات البنية التحتية
      │   └── core/                         # مكونات البنية التحتية المعيارية
      │       ├── ai/                       # تكوينات خدمات الذكاء الاصطناعي
      │       ├── host/                     # بنية الاستضافة
      │       ├── monitor/                  # المراقبة والتسجيل
      │       ├── search/                   # إعداد Azure AI Search
      │       ├── security/                 # الأمان والهوية
      │       └── storage/                  # تكوينات حساب التخزين
      │
      ├── 💻 مصدر التطبيق (src/)
      │   ├── api/                          # واجهة API الخلفية
      │   │   ├── main.py                   # نقطة دخول تطبيق FastAPI
      │   │   ├── routes.py                 # تعريفات مسارات API
      │   │   ├── search_index_manager.py   # وظيفة البحث
      │   │   ├── data/                     # معالجة بيانات API
      │   │   ├── static/                   # أصول ويب ثابتة
      │   │   └── templates/                # قوالب HTML
      │   ├── frontend/                     # واجهة أمامية React/TypeScript
      │   │   ├── package.json              # تبعيات Node.js
      │   │   ├── vite.config.ts            # تكوين بناء Vite
      │   │   └── src/                      # كود المصدر للواجهة الأمامية
      │   ├── data/                         # ملفات بيانات نموذجية
      │   │   └── embeddings.csv            # تضمينات محسوبة مسبقًا
      │   ├── files/                        # ملفات قاعدة المعرفة
      │   │   ├── customer_info_*.json      # عينات بيانات العملاء
      │   │   └── product_info_*.md         # وثائق المنتج
      │   ├── Dockerfile                    # تكوين الحاوية
      │   └── requirements.txt              # تبعيات Python
      │
      ├── 🔧 الأتمتة والنصوص البرمجية (scripts/)
      │   ├── postdeploy.sh/.ps1           # إعداد ما بعد النشر
      │   ├── setup_credential.sh/.ps1     # تكوين بيانات الاعتماد
      │   ├── validate_env_vars.sh/.ps1    # التحقق من البيئة
      │   └── resolve_model_quota.sh/.ps1  # إدارة حصة النموذج
      │
      ├── 🧪 الاختبار والتقييم
      │   ├── tests/                        # اختبارات الوحدة والتكامل
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # إطار تقييم الوكيل
      │   │   ├── evaluate.py               # مشغل التقييم
      │   │   ├── eval-queries.json         # استفسارات الاختبار
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # ملعب التطوير
      │   │   ├── 1-quickstart.py           # أمثلة البدء السريع
      │   │   └── aad-interactive-chat.py   # أمثلة المصادقة
      │   └── airedteaming/                 # تقييم أمان الذكاء الاصطناعي
      │       └── ai_redteaming.py          # اختبارات الفريق الأحمر
      │
      ├── 📚 الوثائق (docs/)
      │   ├── deployment.md                 # دليل النشر
      │   ├── local_development.md          # تعليمات الإعداد المحلي
      │   ├── troubleshooting.md            # المشكلات الشائعة وحلولها
      │   ├── azure_account_setup.md        # متطلبات Azure
      │   └── images/                       # أصول الوثائق
      │
      └── 📄 بيانات المشروع
         ├── README.md                     # نظرة عامة على المشروع
         ├── CODE_OF_CONDUCT.md           # إرشادات المجتمع
         ├── CONTRIBUTING.md              # دليل المساهمة
         ├── LICENSE                      # شروط الترخيص
         └── next-steps.md                # إرشادات ما بعد النشر
      ```

### 3.1 هيكلية التطبيق الأساسية

يتبع هذا القالب نمط **تطبيق ويب كامل** مع:

- **الواجهة الخلفية**: Python FastAPI مع تكامل Azure AI
- **الواجهة الأمامية**: TypeScript/React مع نظام بناء Vite
- **البنية التحتية**: قوالب Azure Bicep للموارد السحابية
- **الحاويات**: Docker للنشر المتسق

### 3.2 البنية التحتية ككود (bicep)

تستخدم طبقة البنية التحتية قوالب **Azure Bicep** منظمة بشكل معياري:

   - **`main.bicep`**: تنسق جميع موارد Azure
   - **وحدات `core/`**: مكونات قابلة لإعادة الاستخدام للخدمات المختلفة
      - خدمات الذكاء الاصطناعي (Azure OpenAI، AI Search)
      - استضافة الحاويات (Azure Container Apps)
      - المراقبة (Application Insights، Log Analytics)
      - الأمان (Key Vault، Managed Identity)

### 3.3 مصدر التطبيق (`src/`)

**واجهة API الخلفية (`src/api/`)**:

- واجهة REST API تعتمد على FastAPI
- تكامل خدمة وكيل Azure AI
- إدارة فهرس البحث لاسترجاع المعرفة
- قدرات رفع ومعالجة الملفات

**الواجهة الأمامية (`src/frontend/`)**:

- SPA حديثة تعتمد على React/TypeScript
- Vite للتطوير السريع والبناء الأمثل
- واجهة دردشة لتفاعلات الوكيل

**قاعدة المعرفة (`src/files/`)**:

- بيانات العملاء والمنتجات النموذجية
- توضح استرجاع المعرفة المستند إلى الملفات
- أمثلة بتنسيق JSON وMarkdown

### 3.4 DevOps والأتمتة

**النصوص البرمجية (`scripts/`)**:

- نصوص PowerShell وBash عبر الأنظمة الأساسية
- التحقق من البيئة والإعداد
- تكوين ما بعد النشر
- إدارة حصة النموذج

**تكامل Azure Developer CLI**:

- تكوين `azure.yaml` لعمليات `azd`
- توفير ونشر تلقائي
- إدارة متغيرات البيئة

### 3.5 الاختبار وضمان الجودة

**إطار التقييم (`evals/`)**:

- تقييم أداء الوكيل
- اختبار جودة الاستجابة للاستفسارات
- خط أنابيب التقييم الآلي

**أمان الذكاء الاصطناعي (`airedteaming/`)**:

- اختبارات الفريق الأحمر لأمان الذكاء الاصطناعي
- فحص الثغرات الأمنية
- ممارسات الذكاء الاصطناعي المسؤولة

---

## 4. تهانينا 🏆

لقد استخدمت بنجاح GitHub Copilot Chat مع خوادم MCP لاستكشاف المستودع.

- [X] تفعيل GitHub Copilot لـ Azure
- [X] فهم هيكلية التطبيق
- [X] استكشاف هيكلية قالب AZD

هذا يمنحك فكرة عن أصول _البنية التحتية ككود_ لهذا القالب. بعد ذلك، سننظر في ملف التكوين لـ AZD.

---

