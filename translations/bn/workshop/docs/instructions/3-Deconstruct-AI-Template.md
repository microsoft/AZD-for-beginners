# 3. একটি টেমপ্লেট বিশ্লেষণ করুন

!!! tip "এই মডিউলের শেষ পর্যন্ত আপনি সক্ষম হবেন"

    - [ ] Azure সহায়তার জন্য MCP সার্ভার সহ GitHub Copilot সক্রিয় করুন
    - [ ] AZD টেমপ্লেট ফোল্ডার স্ট্রাকচার এবং উপাদানগুলো বুঝুন
    - [ ] ইনফ্রাস্ট্রাকচার-এজ-কোড (Bicep) সংগঠন প্যাটার্নগুলো অন্বেষণ করুন
    - [ ] **ল্যাব ৩:** GitHub Copilot ব্যবহার করে রেপোজিটরি আর্কিটেকচার অন্বেষণ ও বুঝুন 

---


AZD টেমপ্লেট এবং Azure Developer CLI (`azd`) ব্যবহার করে আমরা স্ট্যান্ডার্ডাইজড রেপোজিটরি দিয়ে দ্রুত আমাদের AI ডেভেলপমেন্ট যাত্রা শুরু করতে পারি, যা নমুনা কোড, ইনফ্রাস্ট্রাকচার এবং কনফিগারেশন ফাইল সরবরাহ করে — একটি রেডি-টু-ডিপ্লয় _স্টার্টার_ প্রজেক্ট হিসেবে।

**কিন্তু এখন, আমাদের প্রকল্পের স্ট্রাকচার এবং কোডবেস বুঝতে হবে — এবং AZD টেমপ্লেট কাস্টমাইজ করতে সক্ষম হতে হবে — AZD সম্পর্কে পূর্ববর্তী কোনো অভিজ্ঞতা বা জ্ঞানের দরকার নেই!**

---

## 1. GitHub Copilot সক্রিয় করা

### 1.1 GitHub Copilot Chat ইনস্টল করুন

এখন [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) অন্বেষণ করার সময়। এখন আমরা প্রাকৃতিক ভাষায় উচ্চ স্তরে আমাদের কাজ বর্ণনা করে বাস্তবায়নে সহায়তা পেতে পারি। এই ল্যাবের জন্য, আমরা [Copilot Free plan](https://github.com/github-copilot/signup) ব্যবহার করব যার মাসিক সীমা রয়েছে কমপ্লিশন এবং চ্যাট ইন্টারঅ্যাকশনের জন্য।

এক্সটেনশনটি মার্কেটপ্লেস থেকে ইনস্টল করা যেতে পারে, কিন্তু এটি আপনার Codespaces পরিবেশে ইতিমধ্যেই পাওয়া থাকা উচিত। _Copilot আইকন ড্রপডাউন থেকে `Open Chat` ক্লিক করুন - এবং এই ধরনের একটি প্রম্পট টাইপ করুন `What can you do?`_ - আপনাকে লগইন করতে বলা হতে পারে। **GitHub Copilot Chat প্রস্তুত আছে।**

### 1.2 MCP সার্ভার ইনস্টল করুন

Agent মোড কার্যকর হওয়ার জন্য, এটি সঠিক টুলগুলোর অ্যাক্সেস প্রয়োজন যাতে এটি জ্ঞান পুনরুদ্ধার করতে বা অ্যাকশন নিতে পারে। এইক্ষেত্রে MCP সার্ভারগুলো সহায়তা করতে পারে। আমরা নিম্নলিখিত সার্ভারগুলো কনফিগার করব:

1. [Azure MCP সার্ভার](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP সার্ভার](../../../../../workshop/docs/instructions)

এইগুলি সক্রিয় করতে:

1. যদি `.vscode/mcp.json` ফাইলটি না থাকে তবে একটি ফাইল তৈরি করুন
1. নিচের বিষয়টি ওই ফাইলে কপি করুন - এবং সার্ভারগুলো চালু করুন!
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

??? warning "আপনি একটি ত্রুটি পেতে পারেন যে `npx` ইনস্টল নেই (সমাধানের জন্য প্রসারিত করতে ক্লিক করুন)"

      এটি ঠিক করতে, `.devcontainer/devcontainer.json` ফাইলটি খুলুন এবং features সেকশনে এই লাইনটি যোগ করুন। তারপর কনটেইনারটি পুনর্নির্মাণ করুন। এখন আপনার কাছে `npx` ইনস্টল হওয়া উচিত।

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```


---

### 1.3 GitHub Copilot Chat পরীক্ষা করুন

**প্রথমে VS Code কমান্ড লাইনে `az login` ব্যবহার করে Azure-এ প্রমাণীকরণ করুন।**

আপনি এখন আপনার Azure সাবস্ক্রিপশনের স্ট্যাটাস কুয়েরি করতে এবং ডিপ্লয় করা রিসোর্স বা কনফিগারেশন সম্পর্কে প্রশ্ন করতে পারবেন। এই প্রম্পটগুলো ব্যবহার করে দেখুন:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

আপনি Azure ডকুমেন্টেশন সম্পর্কে প্রশ্নও করতে পারেন এবং Microsoft Docs MCP সার্ভার থেকে নির্ভরযোগ্য উত্তর পেতে পারেন। এই প্রম্পটগুলো চেষ্টা করুন:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

অথবা আপনি কোনো টাস্ক সম্পন্ন করার জন্য কোড স্নিপেট চাইতে পারেন। এই প্রম্পটটি চেষ্টা করুন।

1. `Give me a Python code example that uses AAD for an interactive chat client`

`Ask` মোডে, এটি এমন কোড দেবে যা আপনি কপি-পেস্ট করে চেষ্টা করতে পারবেন। `Agent` মোডে, এটি আরও এক ধাপ এগিয়ে আপনার জন্য প্রাসঙ্গিক রিসোর্স তৈরি করতে পারে — সেটআপ স্ক্রিপ্ট এবং ডকুমেন্টেশন সহ — যাতে আপনি সেই টাস্ক বাস্তবায়ন করতে পারেন।

**আপনি এখন টেমপ্লেট রেপোজিটরি অন্বেষণ শুরু করার জন্য প্রস্তুত**

---

## 2. আর্কিটেকচার বিশ্লেষণ

??? prompt "ASK: docs/images/architecture.png ফাইলের অ্যাপ্লিকেশন আर्कিটেকচার ১টি অনুচ্ছেদে ব্যাখ্যা করুন"

      এই অ্যাপ্লিকেশনটি Azure-এ নির্মিত একটি AI-চালিত চ্যাট অ্যাপ যা আধুনিক এজেন্ট-ভিত্তিক আর্কিটেকচার প্রদর্শন করে। সমাধানটির কেন্দ্রবিন্দু হলো একটি Azure Container App যা মূল অ্যাপ্লিকেশন কোড হোস্ট করে, যা ব্যবহারকারীর ইনপুট প্রসেস করে এবং AI এজেন্টের মাধ্যমে বুদ্ধিমান প্রতিক্রিয়া তৈরি করে। 
      
      আর্কিটেকচারটি Microsoft Foundry Project-কে AI ক্ষমতার ভিত্তি হিসেবে ব্যবহার করে, এবং Azure AI Services-এর সাথে সংযুক্ত থাকে যা অন্তর্নিহিত ভাষার মডেল (যেমন GPT-4o-mini) এবং এজেন্ট কার্যকারিতা প্রদান করে। ব্যবহারকারীর ইন্টারঅ্যাকশনগুলো React-ভিত্তিক frontend থেকে FastAPI backend-এ যায়, যা প্রাসঙ্গিক প্রতিক্রিয়া তৈরির জন্য AI এজেন্ট সার্ভিসের সাথে যোগাযোগ করে। 
      
      সিস্টেমটি ফাইল সার্চ অথবা Azure AI Search সার্ভিসের মাধ্যমে জ্ঞান পুনরুদ্ধার সক্ষমতা অন্তর্ভুক্ত করে, যার ফলে এজেন্ট আপলোড করা ডকুমেন্ট থেকে তথ্য অ্যাক্সেস এবং উদ্ধৃত করতে পারে। অপারেশনাল উৎকর্ষতার জন্য, আর্কিটেকচারে Application Insights এবং Log Analytics Workspace-র মাধ্যমে ব্যাপক মনিটরিং অন্তর্ভুক্ত আছে ট্রেসিং, লগিং, এবং কর্মক্ষমতা অপ্টিমাইজেশনের উদ্দেশ্যে। 
      
      Azure Storage অ্যাপ্লিকেশন ডেটা এবং ফাইল আপলোডের জন্য ব্লব স্টোরেজ প্রদান করে, আর Managed Identity Azure রিসোর্সগুলোর মধ্যে নিরাপদ এক্সেস নিশ্চিত করে কোনো ক্রেডেনশিয়াল সংরক্ষণের প্রয়োজন ছাড়া। সম্পূর্ণ সমাধানটি স্কেলেবিলিটি এবং মেইনটেনিবিলিটির জন্য ডিজাইন করা হয়েছে, যেখানে কনটেইনারাইজড অ্যাপ চাহিদা অনুযায়ী স্বয়ংক্রিয়ভাবে স্কেল করে এবং Azure-এর ম্যানেজড সার্ভিস ইকোসিস্টেমের মাধ্যমে বিল্ট-ইন সিকিউরিটি, মনিটরিং এবং CI/CD সক্ষমতা প্রদান করে।

![আর্কিটেকচার](../../../../../translated_images/bn/architecture.48d94861e6e6cdc0.webp)

---

## 3. রেপোজিটরি স্ট্রাকচার

!!! prompt "ASK: টেমপ্লেট ফোল্ডার স্ট্রাকচার ব্যাখ্যা করুন। একটি ভিজ্যুয়াল হায়ারার্কিক্যাল ডায়াগ্রাম দিয়ে শুরু করুন।"

??? info "ANSWER: ভিজ্যুয়াল হায়ারার্কিক্যাল ডায়াগ্রাম"

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

### 3.1 মূল অ্যাপ আর্কিটেকচার

এই টেমপ্লেটটি নিম্নলিখিত **ফুল-স্ট্যাক ওয়েব অ্যাপ্লিকেশন** প্যাটার্ন অনুসরণ করে:

- **ব্যাকএন্ড**: Python FastAPI সহ Azure AI ইন্টিগ্রেশন
- **ফ্রন্টএন্ড**: TypeScript/React ও Vite বিল্ড সিস্টেম
- **ইনফ্রাস্ট্রাকচার**: ক্লাউড রিসোর্সগুলোর জন্য Azure Bicep টেমপ্লেট
- **কনটেইনারাইজেশন**: ধারাবাহিক ডিপ্লয়মেন্টের জন্য Docker

### 3.2 ইনফ্রা অ্যাজ-কোড (Bicep)

ইনফ্রাস্ট্রাকচার লেয়ারটি মডুলারভাবে সংগঠিত **Azure Bicep** টেমপ্লেট ব্যবহার করে:

   - **`main.bicep`**: সমস্ত Azure রিসোর্স অর্কেস্ট্রেট করে
   - **`core/` modules**: বিভিন্ন সার্ভিসের জন্য পুনঃব্যবহারযোগ্য কম্পোনেন্ট
      - AI সার্ভিসেস (Azure OpenAI, AI Search)
      - কনটেইনার হোস্টিং (Azure Container Apps)
      - মনিটরিং (Application Insights, Log Analytics)
      - সিকিউরিটি (Key Vault, Managed Identity)

### 3.3 অ্যাপ্লিকেশন সোর্স (`src/`)

**ব্যাকএন্ড API (`src/api/`)**:

- FastAPI-ভিত্তিক REST API
- Foundry Agents ইন্টিগ্রেশন
- জ্ঞান পুনরুদ্ধারের জন্য সার্চ ইনডেক্স ম্যানেজমেন্ট
- ফাইল আপলোড এবং প্রসেসিং সক্ষমতা

**ফ্রন্টএন্ড (`src/frontend/`)**:

- আধুনিক React/TypeScript SPA
- দ্রুত ডেভেলপমেন্ট এবং অপ্টিমাইজড বিল্ডের জন্য Vite
- এজেন্ট ইন্টারঅ্যাকশনের জন্য চ্যাট ইন্টারফেস

**নলেজ বেস (`src/files/`)**:

- নমুনা কাস্টমার ও প্রোডাক্ট ডেটা
- ফাইল-ভিত্তিক জ্ঞান পুনরুদ্ধার প্রদর্শন করে
- JSON এবং Markdown ফরম্যাট উদাহরণ


### 3.4 ডেভঅপস ও অটোমেশন

**স্ক্রিপ্টস (`scripts/`)**:

- ক্রস-প্ল্যাটফর্ম PowerShell এবং Bash স্ক্রিপ্ট
- পরিবেশ যাচাই ও সেটআপ
- পোস্ট-ডিপ্লয়মেন্ট কনফিগারেশন
- মডেল কোটা ম্যানেজমেন্ট

**Azure Developer CLI ইন্টিগ্রেশন**:

- `azure.yaml` ওয়ার্কফ্লোর জন্য `azd` কনফিগারেশন
- স্বয়ংক্রিয় প্রোভিশনিং এবং ডিপ্লয়মেন্ট
- এনভায়রনমেন্ট ভ্যারিয়েবল ম্যানেজমেন্ট

### 3.5 টেস্টিং ও কোয়ালিটি অ্যাসিউরেন্স

**ইভ্যালুয়েশন ফ্রেমওয়ার্ক (`evals/`)**:

- এজেন্ট পারফরম্যান্স ইভ্যালুয়েশন
- কোয়েরি-রেসপন্স মান পরিক্ষা
- স্বয়ংক্রিয় মূল্যায়ন পাইপলাইন

**এআই সেফটি (`airedteaming/`)**:

- এআই সেফটির জন্য রেড টীম টেস্টিং
- সিকিউরিটি ভলনারেবিলিটি স্ক্যানিং
- দায়িত্বশীল AI অনুশীলন

---

## 4. অভিনন্দন 🏆

আপনি সফলভাবে MCP সার্ভার নিয়ে GitHub Copilot Chat ব্যবহার করে রেপোজিটরি অন্বেষণ করেছেন।

- [X] Azure-এর জন্য GitHub Copilot সক্রিয় করেছেন
- [X] অ্যাপ্লিকেশন আর্কিটেকচার বুঝেছেন
- [X] AZD টেমপ্লেট স্ট্রাকচার অন্বেষণ করেছেন

এটি আপনাকে এই টেমপ্লেটের _infrastructure as code_ অ্যাসেটগুলোর ধারণা দেয়। পরবর্তী, আমরা AZD-এর কনফিগারেশন ফাইলটি দেখব।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
দায়-অস্বীকৃতি:
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা সঠিকতার জন্য যত্নশীল হলেও, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিকেই কর্তৃত্বপূর্ণ সূত্র হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের ক্ষেত্রে পেশাদার মানব অনুবাদ গ্রহণ করার পরামর্শ দেয়া হয়। এই অনুবাদ ব্যবহারের ফলে হওয়া কোনও ভুলবোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->