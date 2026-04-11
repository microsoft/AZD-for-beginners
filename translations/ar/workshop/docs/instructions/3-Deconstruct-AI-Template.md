# 3. Deconstruct a Template

!!! tip "بنهاية هذه الوحدة ستكون قادراً على"

    - [ ] تنشيط GitHub Copilot مع خوادم MCP لمساعدة Azure
    - [ ] فهم بنية مجلدات قالب AZD ومكوناته
    - [ ] استكشاف أنماط تنظيم البنية التحتية ككود (Bicep)
    - [ ] **المختبر 3:** استخدام GitHub Copilot لاستكشاف وفهم بنية المستودع 

---


مع قوالب AZD وواجهة سطر أوامر Azure Developer CLI (`azd`) يمكننا بدء رحلة تطوير الذكاء الاصطناعي بسرعة باستخدام مستودعات موحدة توفر أمثلة شيفرة وبنية تحتية وملفات تكوين - على شكل مشروع _بادئ_ جاهز للنشر.

**لكن الآن، نحتاج إلى فهم بنية المشروع وقاعدة الشيفرة - وأن نكون قادرين على تخصيص قالب AZD - دون أي خبرة أو معرفة سابقة بـ AZD!**

---

## 1. Activate GitHub Copilot

### 1.1 Install GitHub Copilot Chat

حان الوقت لاستكشاف [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). الآن، يمكننا استخدام اللغة الطبيعية لوصف مهمتنا على مستوى عالٍ والحصول على مساعدة في التنفيذ. في هذا المختبر، سنستخدم خطة [Copilot Free plan](https://github.com/github-copilot/signup) والتي لها حد شهري للاكتمالات وتفاعلات الدردشة.

يمكن تثبيت الامتداد من السوق، وغالبًا ما يكون متاحًا بالفعل في Codespaces أو بيئات حاويات التطوير. _انقر على `Open Chat` من قائمة أيقونة Copilot - واكتب موجهًا مثل `What can you do?`_ - قد يُطلب منك تسجيل الدخول. **دردشة GitHub Copilot جاهزة**.

### 1.2. Install MCP Servers

لكي يكون وضع الوكيل فعالًا، يحتاج الوصول إلى الأدوات الصحيحة لمساعدته في استرجاع المعرفة أو اتخاذ الإجراءات. هنا حيث يمكن أن تساعد خوادم MCP. سنقوم بتكوين الخوادم التالية:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

لتنشيط هذه:

1. أنشئ ملفًا باسم `.vscode/mcp.json` إذا لم يكن موجودًا
1. انسخ ما يلي إلى ذلك الملف - وابدأ الخوادم!
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

??? warning "قد تحصل على خطأ مفاده أن `npx` غير مثبت (انقر للتوسيع للحصول على الإصلاح)"

      لإصلاح ذلك، افتح ملف `.devcontainer/devcontainer.json` وأضف هذا السطر إلى قسم الميزات. ثم أعد بناء الحاوية. يجب أن يكون لديك الآن `npx` مثبتًا.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Test GitHub Copilot Chat

**استخدم أولاً `azd auth login` للمصادقة مع Azure من سطر أوامر VS Code. استخدم `az login` أيضًا فقط إذا كنت تخطط لتشغيل أوامر Azure CLI مباشرة.**

يجب أن تكون قادرًا الآن على استعلام حالة اشتراك Azure الخاص بك، وطرح أسئلة حول الموارد المنشورة أو التكوين. جرّب هذه المطالبات:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

يمكنك أيضًا طرح أسئلة حول وثائق Azure والحصول على ردود مدعومة بخادم Microsoft Docs MCP. جرّب هذه المطالبات:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

أو يمكنك طلب مقتطفات شيفرة لإكمال مهمة. جرب هذا المطلب.

1. `Give me a Python code example that uses AAD for an interactive chat client`

في وضع "Ask"، سيقدم هذا شيفرة يمكنك نسخها ولصقها وتجربتها. في وضع "Agent"، قد يتقدم خطوة إضافية وينشئ الموارد ذات الصلة لك - بما في ذلك نصوص الإعداد والوثائق - لمساعدتك على تنفيذ تلك المهمة.

**أنت الآن مجهز للبدء في استكشاف مستودع القالب**

---

## 2. Deconstruct Architecture

??? prompt "اسأل: اشرح بنية التطبيق في docs/images/architecture.png في فقرة واحدة"

      هذا التطبيق هو تطبيق دردشة معزز بالذكاء الاصطناعي مبني على Azure ويعرض بنية حديثة قائمة على الوكلاء. تتمحور الحلول حول Azure Container App الذي يستضيف الشيفرة الأساسية للتطبيق، والتي تعالج مدخلات المستخدم وتولد استجابات ذكية من خلال وكيل الذكاء الاصطناعي.
      
      تستفيد البنية من مشروع Microsoft Foundry كأساس لقدرات الذكاء الاصطناعي، وتتصل بخدمات Azure AI التي توفر نماذج اللغة الأساسية (مثل gpt-4.1-mini) ووظائف الوكيل. تمر تفاعلات المستخدم عبر واجهة أمامية مبنية بـ React إلى خلفية FastAPI التي تتواصل مع خدمة وكيل الذكاء الاصطناعي لتوليد استجابات سياقية.
      
      يتضمن النظام قدرات استرجاع المعرفة من خلال البحث في الملفات أو خدمة Azure AI Search، مما يسمح للوكيل بالوصول إلى المعلومات المرفوعة والاستشهاد بها. من أجل التميز التشغيلي، تتضمن البنية مراقبة شاملة عبر Application Insights وLog Analytics Workspace للتتبع والتسجيل وتحسين الأداء.
      
      يوفر Azure Storage تخزينًا للكائنات لبيانات التطبيق ورفع الملفات، بينما تضمن Managed Identity وصولًا آمنًا بين موارد Azure دون تخزين بيانات الاعتماد. تم تصميم الحل بأكمله من أجل القابلية للتوسع وسهولة الصيانة، مع تحجيم التطبيق المحوَّب تلقائيًا بناءً على الطلب مع توفير أمان ومراقبة وقدرات CI/CD مدمجة من خلال نظام خدمات Azure المدار.

![بنية التطبيق](../../../../../translated_images/ar/architecture.48d94861e6e6cdc0.webp)

---

## 3. Repository Structure

!!! prompt "اسأل: اشرح هيكل مجلد القالب. ابدأ بمخطط هرمي بصري."

??? info "الإجابة: مخطط هرمي بصري"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # Azure Developer CLI configuration
      │   ├── docker-compose.yaml           # Local development containers
      │   ├── pyproject.toml                # Python project configuration
      │   ├── requirements-dev.txt          # Development dependencies
      │   └── .devcontainer/                # VS Code dev container setup
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # Main infrastructure template
      │   ├── api.bicep                     # API-specific resources
      │   ├── main.parameters.json          # Infrastructure parameters
      │   └── core/                         # Modular infrastructure components
      │       ├── ai/                       # AI service configurations
      │       ├── host/                     # Hosting infrastructure
      │       ├── monitor/                  # Monitoring and logging
      │       ├── search/                   # Azure AI Search setup
      │       ├── security/                 # Security and identity
      │       └── storage/                  # Storage account configs
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # FastAPI application entry
      │   │   ├── routes.py                 # API route definitions
      │   │   ├── search_index_manager.py   # Search functionality
      │   │   ├── data/                     # API data handling
      │   │   ├── static/                   # Static web assets
      │   │   └── templates/                # HTML templates
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # Node.js dependencies
      │   │   ├── vite.config.ts            # Vite build configuration
      │   │   └── src/                      # Frontend source code
      │   ├── data/                         # Sample data files
      │   │   └── embeddings.csv            # Pre-computed embeddings
      │   ├── files/                        # Knowledge base files
      │   │   ├── customer_info_*.json      # Customer data samples
      │   │   └── product_info_*.md         # Product documentation
      │   ├── Dockerfile                    # Container configuration
      │   └── requirements.txt              # Python dependencies
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Post-deployment setup
      │   ├── setup_credential.sh/.ps1     # Credential configuration
      │   ├── validate_env_vars.sh/.ps1    # Environment validation
      │   └── resolve_model_quota.sh/.ps1  # Model quota management
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # Unit and integration tests
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agent evaluation framework
      │   │   ├── evaluate.py               # Evaluation runner
      │   │   ├── eval-queries.json         # Test queries
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Development playground
      │   │   ├── 1-quickstart.py           # Getting started examples
      │   │   └── aad-interactive-chat.py   # Authentication examples
      │   └── airedteaming/                 # AI safety evaluation
      │       └── ai_redteaming.py          # Red team testing
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # Deployment guide
      │   ├── local_development.md          # Local setup instructions
      │   ├── troubleshooting.md            # Common issues & fixes
      │   ├── azure_account_setup.md        # Azure prerequisites
      │   └── images/                       # Documentation assets
      │
      └── 📄 Project Metadata
         ├── README.md                     # Project overview
         ├── CODE_OF_CONDUCT.md           # Community guidelines
         ├── CONTRIBUTING.md              # Contribution guide
         ├── LICENSE                      # License terms
         └── next-steps.md                # Post-deployment guidance
      ```

### 3.1. Core App Architecture

يتبع هذا القالب نمط **تطبيق ويب متكامل (Full-Stack)** مع:

- **Backend**: Python FastAPI مع تكامل Azure AI
- **Frontend**: TypeScript/React مع نظام البناء Vite
- **Infrastructure**: قوالب Azure Bicep لموارد السحابة
- **Containerization**: Docker لنشر متسق

### 3.2 Infra As Code (bicep)

تستخدم طبقة البنية التحتية قوالب **Azure Bicep** منظمة بشكل وحدات قابلة لإعادة الاستخدام:

   - **`main.bicep`**: ينسق جميع موارد Azure
   - **`core/` modules**: مكونات قابلة لإعادة الاستخدام للخدمات المختلفة
      - خدمات AI (نماذج Microsoft Foundry، AI Search)
      - استضافة الحاويات (Azure Container Apps)
      - المراقبة (Application Insights، Log Analytics)
      - الأمان (Key Vault، Managed Identity)

### 3.3 Application Source (`src/`)

**Backend API (`src/api/`)**:

- واجهة REST مبنية على FastAPI
- تكامل وكلاء Foundry
- إدارة فهرس البحث لاسترجاع المعرفة
- قدرات رفع الملفات ومعالجتها

**Frontend (`src/frontend/`)**:

- تطبيق أحادي الصفحة حديث مبني بـ React/TypeScript
- Vite للتطوير السريع وبناءات محسّنة
- واجهة دردشة لتفاعلات الوكيل

**Knowledge Base (`src/files/`)**:

- بيانات عينة للعملاء والمنتجات
- يوضح استرجاع المعرفة المعتمد على الملفات
- أمثلة بصيغتي JSON وMarkdown


### 3.4 DevOps & Automation

**Scripts (`scripts/`)**:

- سكربتات PowerShell وBash متعددة المنصات
- التحقق من البيئة والإعداد
- إعداد ما بعد النشر
- إدارة حصص النماذج

**Azure Developer CLI Integration**:

- تكوين `azure.yaml` لتدفقات عمل `azd`
- توفير ونشر آلي
- إدارة متغيرات البيئة

### 3.5 Testing & Quality Assurance

**Evaluation Framework (`evals/`)**:

- تقييم أداء الوكلاء
- اختبار جودة إجابات الاستعلامات
- خط أنابيب تقييم آلي

**AI Safety (`airedteaming/`)**:

- اختبارات الفريق الأحمر لسلامة الذكاء الاصطناعي
- فحص الثغرات الأمنية
- ممارسات الذكاء الاصطناعي المسؤولة

---

## 4. Congratulations 🏆

لقد استخدمت بنجاح دردشة GitHub Copilot مع خوادم MCP لاستكشاف المستودع.

- [X] تم تفعيل GitHub Copilot لـ Azure
- [X] فهمت بنية التطبيق
- [X] استكشفت هيكل قالب AZD

هذا يمنحك فكرة عن أصول _البنية التحتية ككود_ الخاصة بهذا القالب. بعد ذلك، سننظر في ملف التكوين لـ AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**إخلاء المسؤولية**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى إلى الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. ينبغي اعتبار المستند الأصلي بلغته الأصلية المصدر الموثوق. للمعلومات الحرجة، يوصى بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة ناتجة عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->