# 3. একটি টেমপ্লেট বিশ্লেষণ

!!! tip "BY THE END OF THIS MODULE YOU WILL BE ABLE TO"

    - [ ] Azure সহায়তার জন্য MCP সার্ভার সহ GitHub Copilot সক্রিয় করুন
    - [ ] AZD টেমপ্লেট ফোল্ডার কাঠামো এবং উপাদানগুলো বুঝুন
    - [ ] Infrastructure-as-code (Bicep) সংগঠন প্যাটার্ন অন্বেষণ করুন
    - [ ] **ল্যাব 3:** রেপোজিটরি স্থাপত্য অন্বেষণ ও বোঝার জন্য GitHub Copilot ব্যবহার করুন

---


AZD টেমপ্লেট এবং Azure Developer CLI (`azd`) ব্যবহার করে আমরা স্ট্যান্ডার্ডাইজড রেপোজিটরি থেকে দ্রুত আমাদের AI ডেভেলপমেন্ট যাত্রা শুরু করতে পারি — উদাহরণ কোড, অবকাঠামো এবং কনফিগারেশন ফাইল সহ একটি প্রস্তুত-ডিপ্লয়ের _starter_ প্রজেক্ট আকারে।

**কিন্তু এখন, আমাদের প্রকল্পের কাঠামো এবং কোডবেসটি বুঝতে হবে — এবং AZD টেমপ্লেট কাস্টমাইজ করতে সক্ষম হতে হবে — AZD সম্পর্কে কোনো পূর্ব অভিজ্ঞতা বা জ্ঞান ছাড়াই!**

---

## 1. GitHub Copilot সক্রিয় করা

### 1.1 GitHub Copilot Chat ইনস্টল করুন

এখন [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) অনুসন্ধান করার সময়। এখন আমরা উচ্চ স্তরেরভাবে আমাদের কাজ বর্ণনা করতে প্রাকৃতিক ভাষা ব্যবহার করতে পারি, এবং তার বাস্তবায়নে সহায়তা পেতে পারি। এই ল্যাবটির জন্য, আমরা [Copilot Free plan](https://github.com/github-copilot/signup) ব্যবহার করব যার মাসিক সীমা আছে কমপ্লিশন এবং চ্যাট ইন্টারঅ্যাকশনের জন্য।

এক্সটেনশনটি মার্কেটপ্লেস থেকে ইনস্টল করা যাবে, তবে এটি ইতিমধ্যেই আপনার Codespaces পরিবেশে উপলব্ধ থাকা উচিত। _Copilot আইকন ড্রপ-ডাউন থেকে `Open Chat` ক্লিক করুন - এবং `What can you do?` মত একটি প্রম্পট টাইপ করুন_ - হয়তো আপনাকে লগইন করতে বলা হবে। **GitHub Copilot Chat প্রস্তুত।**

### 1.2. MCP Servers ইনস্টল করুন

এজেন্ট মোড কার্যকর করার জন্য, এটি সঠিক টুলগুলোর অ্যাক্সেস চাই যাতে এটি জ্ঞান পুনরুদ্ধার বা ক্রিয়া নিতে পারে। এখানে MCP সার্ভারগুলো সাহায্য করতে পারে। আমরা নিম্নলিখিত সার্ভার কনফিগার করব:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

এগুলো সক্রিয় করতে:

1. `.vscode/mcp.json` নামে একটি ফাইল তৈরি করুন যদি তা না থাকে
1. নিম্নলিখিত কপি করে সেই ফাইলে পেস্ট করুন - এবং সার্ভারগুলো চালু করুন!
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

??? warning "আপনি একটি ত্রুটি পেতে পারেন যে `npx` ইনস্টল করা নেই (fix দেখার জন্য ক্লিক করে সম্প্রসারণ করুন)"

      সমস্যাটি সমাধান করতে, এই `.devcontainer/devcontainer.json` ফাইলটি খুলুন এবং features সেকশনে এই লাইনটি যোগ করুন। এরপর কনটেইনারটি রিইনবিল্ড করুন। এখন আপনার কাছে `npx` ইনস্টল থাকা উচিত।

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. GitHub Copilot Chat পরীক্ষা করুন

**প্রথমে VS Code কমান্ড লাইনে Azure-এ প্রমাণীকরণের জন্য `az login` ব্যবহার করুন।**

এখন আপনি আপনার Azure সাবস্ক্রিপশন স্ট্যাটাস সম্পর্কে জিজ্ঞাসা করতে এবং মোতাবেক ডিপ্লয় করা রিসোর্স বা কনফিগারেশন সম্পর্কে প্রশ্ন করতে সক্ষম হওয়া উচিত। এই প্রম্পটগুলো চেষ্টা করুন:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

আপনি Azure ডকুমেন্টেশন সম্পর্কে প্রশ্নও করতে পারেন এবং Microsoft Docs MCP সার্ভার-এ গ্রাউন্ডেড উত্তর পেতে পারেন। এই প্রম্পটগুলো চেষ্টা করুন:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

অথবা আপনি কোনো কাজ সম্পন্ন করার জন্য কোড স্নিপেট চাইতে পারেন। এই প্রম্পটটি চেষ্টা করুন।

1. `Give me a Python code example that uses AAD for an interactive chat client`

`Ask` মোডে, এটি এমন কোড সরবরাহ করবে যা আপনি কপি-পেস্ট করে চেষ্টা করতে পারবেন। `Agent` মোডে, এটি এক ধাপ এগিয়ে প্রাসঙ্গিক রিসোর্সগুলি তৈরি করতে পারে — সেটআপ স্ক্রিপ্ট এবং ডকুমেন্টেশন সহ — যাতে আপনি ঐ কাজটি সম্পাদন করতে পারেন।

**এখন আপনি টেমপ্লেট রেপোজিটরি অন্বেষণ শুরু করার জন্য সজ্জিত।**

---

## 2. স্থাপত্য বিশ্লেষণ

??? prompt "ASK: docs/images/architecture.png-এ অ্যাপ্লিকেশন স্থাপত্য 1 অনুচ্ছেদে ব্যাখ্যা করুন"

      এই অ্যাপ্লিকেশনটি Azure-এ নির্মিত একটি AI-চালিত চ্যাট অ্যাপ্লিকেশন যা আধুনিক এজেন্ট-ভিত্তিক স্থাপত্য প্রদর্শন করে। সমাধানটি একটি Azure Container App-এর চারপাশে কেন্দ্রীভূত যা মূল অ্যাপ্লিকেশন কোড হোস্ট করে, ব্যবহারকারীর ইনপুট প্রক্রিয়াকরণ করে এবং একটি AI এজেন্টের মাধ্যমে বুদ্ধিমত্তাসম্পন্ন প্রতিক্রিয়া তৈরি করে। 
      
      স্থাপত্যটি Microsoft Foundry Project-কে AI সক্ষমতার ভিত্তি হিসেবে ব্যবহার করে, Azure AI Services-এ সংযুক্ত করে যা নীচে থাকা ভাষা মডেলগুলো (যেমন gpt-4.1-mini) এবং এজেন্ট কার্যকারিতা প্রদান করে। ব্যবহারকারীর ইন্টারঅ্যাকশন একটি React-ভিত্তিক ফ্রন্টএন্ড থেকে FastAPI ব্যাকএন্ডে প্রবাহিত হয়, যা প্রসঙ্গভিত্তিক প্রতিক্রিয়া জেনারেট করার জন্য AI এজেন্ট সার্ভিসের সঙ্গে যোগাযোগ করে। 
      
      সিস্টেমটি জ্ঞান পুনরুদ্ধারের ক্ষমতা অন্তর্ভুক্ত করে, যা ফাইল সার্চ বা Azure AI Search সার্ভিসের মাধ্যমে করা যেতে পারে, এজেন্টকে আপলোড করা ডকুমেন্ট থেকে তথ্য অ্যাক্সেস এবং উদ্ধৃতি করার সুযোগ দেয়। অপারেশনাল এক্সেলেন্সের জন্য, স্থাপত্যটি ট্রেসিং, লগিং এবং পারফরম্যান্স অপ্টিমাইজেশনের জন্য Application Insights এবং Log Analytics Workspace-এর মাধ্যমে ব্যাপক মনিটরিং অন্তর্ভুক্ত করে। 
      
      Azure Storage অ্যাপ্লিকেশন ডেটা এবং ফাইল আপলোডের জন্য ব্লব স্টোরেজ প্রদান করে, যখন Managed Identity Azure রিসোর্সগুলির মধ্যে পাসওয়ার্ড সংরক্ষণ ছাড়াই নিরাপদ অ্যাক্সেস নিশ্চিত করে। সমগ্র সমাধানটি স্কেলযোগ্যতা এবং রক্ষণাবেক্ষণযোগ্যতার জন্য ডিজাইন করা হয়েছে, কনটেইনারাইজড অ্যাপ্লিকেশনটি চাহিদা অনুযায়ী স্বয়ংক্রিয়ভাবে স্কেল করে এবং Azure-এর ম্যানেজড সার্ভিসেস ইকোসিস্টেমের মাধ্যমে অন্তর্নির্মিত সিকিউরিটি, মনিটরিং এবং CI/CD সক্ষমতা প্রদান করে।

![স্থাপত্য](../../../../../translated_images/bn/architecture.48d94861e6e6cdc0.webp)

---

## 3. রেপোজিটরি কাঠামো

!!! prompt "ASK: টেমপ্লেট ফোল্ডার কাঠামো ব্যাখ্যা করুন। একটি ভিজ্যুয়াল হায়ারার্কিকাল ডায়াগ্রাম দিয়ে শুরু করুন।"

??? info "ANSWER: Visual Hierarchical Diagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # Azure Developer CLI কনফিগারেশন
      │   ├── docker-compose.yaml           # লোকাল ডেভেলপমেন্ট কনটেইনারগুলি
      │   ├── pyproject.toml                # Python প্রকল্প কনফিগারেশন
      │   ├── requirements-dev.txt          # ডেভেলপমেন্ট নির্ভরশীলতাগুলি
      │   └── .devcontainer/                # VS Code dev container সেটআপ
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # প্রধান অবকাঠামো টেমপ্লেট
      │   ├── api.bicep                     # API-নির্দিষ্ট রিসোর্সসমূহ
      │   ├── main.parameters.json          # অবকাঠামো প্যারামিটারসমূহ
      │   └── core/                         # মডিউলার অবকাঠামো উপাদান
      │       ├── ai/                       # AI সার্ভিস কনফিগারেশনসমূহ
      │       ├── host/                     # হোস্টিং অবকাঠামো
      │       ├── monitor/                  # মনিটরিং এবং লগিং
      │       ├── search/                   # Azure AI Search সেটআপ
      │       ├── security/                 # নিরাপত্তা ও পরিচয়
      │       └── storage/                  # স্টোরেজ অ্যাকাউন্ট কনফিগার
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # FastAPI অ্যাপ্লিকেশন এন্ট্রি
      │   │   ├── routes.py                 # API রুট সংজ্ঞা
      │   │   ├── search_index_manager.py   # সার্চ কার্যকারিতা
      │   │   ├── data/                     # API ডেটা হ্যান্ডলিং
      │   │   ├── static/                   # স্ট্যাটিক ওয়েব অ্যাসেট
      │   │   └── templates/                # HTML টেমপ্লেট
      │   ├── frontend/                     # React/TypeScript ফ্রন্টএন্ড
      │   │   ├── package.json              # Node.js নির্ভরশীলতা
      │   │   ├── vite.config.ts            # Vite বিল্ড কনফিগারেশন
      │   │   └── src/                      # ফ্রন্টএন্ড সোর্স কোড
      │   ├── data/                         # নমুনা ডেটা ফাইলসমূহ
      │   │   └── embeddings.csv            # পূর্ব-গণনা করা এমবেডিংস
      │   ├── files/                        # জ্ঞানভিত্তিক ফাইল
      │   │   ├── customer_info_*.json      # কাস্টমার ডেটা নমুনা
      │   │   └── product_info_*.md         # পণ্য ডকুমেন্টেশন
      │   ├── Dockerfile                    # কনটেইনার কনফিগারেশন
      │   └── requirements.txt              # Python নির্ভরশীলতা
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # পোস্ট-ডিপ্লয়মেন্ট সেটআপ
      │   ├── setup_credential.sh/.ps1     # ক্রেডেনশিয়াল কনফিগারেশন
      │   ├── validate_env_vars.sh/.ps1    # পরিবেশ যাচাই
      │   └── resolve_model_quota.sh/.ps1  # মডেল কোটা ব্যবস্থাপনা
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # ইউনিট এবং ইন্টিগ্রেশন টেস্ট
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # এজেন্ট মূল্যায়ন ফ্রেমওয়ার্ক
      │   │   ├── evaluate.py               # মূল্যায়ন রানার
      │   │   ├── eval-queries.json         # টেস্ট কুয়েরি
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # ডেভেলপমেন্ট প্লেগ্রাউন্ড
      │   │   ├── 1-quickstart.py           # শুরু করার উদাহরণ
      │   │   └── aad-interactive-chat.py   # অথেনটিকেশন উদাহরণ
      │   └── airedteaming/                 # AI সেফটি মূল্যায়ন
      │       └── ai_redteaming.py          # রেড টিম টেস্টিং
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # ডিপ্লয়মেন্ট গাইড
      │   ├── local_development.md          # লোকাল সেটআপ নির্দেশনা
      │   ├── troubleshooting.md            # সাধারণ সমস্যা ও সমাধান
      │   ├── azure_account_setup.md        # Azure পূর্বশর্ত
      │   └── images/                       # ডকুমেন্টেশন অ্যাসেট
      │
      └── 📄 Project Metadata
         ├── README.md                     # প্রকল্প পরিচিতি
         ├── CODE_OF_CONDUCT.md           # কমিউনিটি নির্দেশিকা
         ├── CONTRIBUTING.md              # অবদান নির্দেশিকা
         ├── LICENSE                      # লাইসেন্স শর্তাবলী
         └── next-steps.md                # পোস্ট-ডিপ্লয়মেন্ট নির্দেশিকা
      ```

### 3.1. মূল অ্যাপ স্থাপত্য

এই টেমপ্লেটটি একটি **ফুল-স্ট্যাক ওয়েব অ্যাপ্লিকেশন** প্যাটার্ন অনুসরণ করে:

- **Backend**: Azure AI ইন্টিগ্রেশন সহ Python FastAPI
- **Frontend**: TypeScript/React এবং Vite বিল্ড সিস্টেম
- **Infrastructure**: ক্লাউড রিসোর্সের জন্য Azure Bicep টেমপ্লেট
- **Containerization**: স্থিতিশীল ডিপ্লয়মেন্টের জন্য Docker

### 3.2 Infra As Code (bicep)

ইনফ্রাস্ট্রাকচার লেয়ারটি মডুলারভাবে সংগঠিত **Azure Bicep** টেমপ্লেট ব্যবহার করে:

   - **`main.bicep`**: সমস্ত Azure রিসোর্স অর্গানাইজ করে
   - **`core/` মডিউলসমূহ**: বিভিন্ন সার্ভিসের জন্য পুনঃব্যবহারযোগ্য কম্পোনেন্ট
      - AI সার্ভিসসমূহ (Microsoft Foundry Models, AI Search)
      - কনটেইনার হোস্টিং (Azure Container Apps)
      - মনিটরিং (Application Insights, Log Analytics)
      - সিকিউরিটি (Key Vault, Managed Identity)

### 3.3 Application Source (`src/`)

**Backend API (`src/api/`)**:

- FastAPI-ভিত্তিক REST API
- Foundry Agents ইন্টিগ্রেশন
- জ্ঞান পুনরুদ্ধারের জন্য সার্চ ইনডেক্স ম্যানেজমেন্ট
- ফাইল আপলোড এবং প্রক্রিয়াকরণ ক্ষমতা

**Frontend (`src/frontend/`)**:

- আধুনিক React/TypeScript SPA
- দ্রুত ডেভেলপমেন্ট এবং অপ্টিমাইজড বিল্ডের জন্য Vite
- এজেন্ট ইন্টারঅ্যাকশনের জন্য চ্যাট ইন্টারফেস

**Knowledge Base (`src/files/`)**:

- নমুনা কাস্টমার এবং পণ্য ডেটা
- ফাইল-ভিত্তিক জ্ঞান পুনরুদ্ধারের ডেমো
- JSON এবং Markdown ফরম্যাট উদাহরণ

### 3.4 DevOps & Automation

**Scripts (`scripts/`)**:

- ক্রস-প্ল্যাটফর্ম PowerShell এবং Bash স্ক্রিপ্ট
- পরিবেশ যাচাই এবং সেটআপ
- পোস্ট-ডিপ্লয়মেন্ট কনফিগারেশন
- মডেল কোটা ব্যবস্থাপনা

**Azure Developer CLI ইন্টিগ্রেশন**:

- `azure.yaml` কনফিগারেশন `azd` ওয়ার্কফ্লোর জন্য
- স্বয়ংক্রিয় provisioning এবং ডিপ্লয়মেন্ট
- পরিবেশ ভেরিয়েবল ব্যবস্থাপনা

### 3.5 Testing & Quality Assurance

**Evaluation Framework (`evals/`)**:

- এজেন্ট পারফরম্যান্স মূল্যায়ন
- কুয়েরি-প্রতিউত্তর মান পরীক্ষাসমূহ
- স্বয়ংক্রিয় মূল্যায়ন পাইপলাইন

**AI Safety (`airedteaming/`)**:

- AI সেফটির জন্য রেড টিম টেস্টিং
- সিকিউরিটি ভলনারেবিলিটি স্ক্যান
- দায়িত্বশীল AI অনুশীলন

---

## 4. অভিনন্দন 🏆

আপনি সফলভাবে GitHub Copilot Chat MCP সার্ভার সহ ব্যবহার করেছেন, এবং রেপোজিটরি অন্বেষণ করেছেন।

- [X] Azure-র জন্য GitHub Copilot সক্রিয় করেছেন
- [X] অ্যাপ্লিকেশন স্থাপত্যটি বুঝে নিয়েছেন
- [X] AZD টেমপ্লেট কাঠামো অন্বেষণ করেছেন

এটি আপনাকে এই টেমপ্লেটের _infrastructure as code_ সম্পদের একটি ধারণা দেয়। পরবর্তীতে, আমরা AZD-এর কনফিগারেশন ফাইলটি দেখব।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকৃতি:
এই নথিটি AI অনুবাদ সেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। যদিও আমরা সঠিক অনুবাদের জন্য সর্বোচ্চ চেষ্টা করি, তবুও অনুগ্রহ করে জানুন যে স্বয়ংক্রিয় অনুবাদে ভুল বা অসংগতি থাকতে পারে। মূল নথিটিকেই তার নিজ ভাষায় কর্তৃত্বপ্রাপ্ত উৎস হিসেবে গণ্য করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদটি অনুশংসনীয়। এই অনুবাদ ব্যবহারের ফলে সৃষ্ট যেকোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->