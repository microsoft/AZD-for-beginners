# পরিবর্তনলগ - AZD For Beginners

## পরিচিতি

এই পরিবর্তনলগটি AZD For Beginners রিপোজিটরিতে সমস্ত উল্লেখযোগ্য পরিবর্তন, আপডেট এবং উন্নতির দলিল করে। আমরা সেমান্টিক ভার্সনিং নীতিমালা অনুসরণ করি এবং ব্যবহারকারীদের সংস্করণগুলোর মধ্যে কী পরিবর্তন হয়েছে তা বুঝতে সাহায্য করার জন্য এই লগটি বজায় রাখি।

## শেখার লক্ষ্য

এই পরিবর্তনলগ পর্যালোচনা করে, আপনি:
- নতুন বৈশিষ্ট্য এবং বিষয়বস্তুর সংযোজন সম্পর্কে অবহিত থাকবেন
- বিদ্যমান ডকুমেন্টেশনে করা উন্নতিগুলি বুঝতে পারবেন
- সঠিকতা নিশ্চিত করার জন্য বাগ ফিক্স এবং সংশোধন ট্র্যাক করতে পারবেন
- সময়ের সাথে শেখার সামগ্রীর বিবর্তন অনুসরণ করতে পারবেন

## শেখার ফলাফল

পরিবর্তনলগ এন্ট্রি পর্যালোচনা করার পরে, আপনি সক্ষম হবেন:
- শেখার জন্য উপলব্ধ নতুন বিষয়বস্তু এবং সম্পদগুলি সনাক্ত করতে
- কোন কোন বিভাগগুলো আপডেট বা উন্নত করা হয়েছে তা বুঝতে
- সবচেয়ে সাম্প্রতিক উপকরণগুলোর ভিত্তিতে আপনার শেখার পথ পরিকল্পনা করতে
- ভবিষ্যৎ উন্নতির জন্য প্রতিক্রিয়া এবং পরামর্শ প্রদান করতে

## সংস্করণ ইতিহাস

### [v3.18.0] - 2026-03-16

#### AZD AI CLI কমান্ড, বিষয়বস্তু যাচাই এবং টেমপ্লেট সম্প্রসারণ
**এই সংস্করণটি সমস্ত AI-সম্পর্কিত অধ্যায় জুড়ে `azd ai`, `azd extension`, এবং `azd mcp` কমান্ড কভারেজ যোগ করে, agents.md-এ ভাঙা লিঙ্ক এবং অবাঞ্ছিত কোড ঠিক করে, চিট শিট আপডেট করে, এবং Example Templates সেকশনকে যাচাইকৃত বর্ণনা এবং নতুন Azure AI AZD টেমপ্লেট সহ পুনর্গঠন করে।**

#### যোগ করা হয়েছে
- **🤖 AZD AI CLI কভারেজ** 7টি ফাইলে জুড়েছে (পূর্বে শুধুমাত্র Chapter 8-এ ছিল):
  - `docs/chapter-01-foundation/azd-basics.md` — নতুন "Extensions and AI Commands" বিভাগ যা `azd extension`, `azd ai agent init`, এবং `azd mcp` পরিচয় করায়
  - `docs/chapter-02-ai-development/agents.md` — বিকল্প 4: `azd ai agent init` সহ তুলনা টেবিল (টেমপ্লেট বনাম ম্যানিফেস্ট পদ্ধতি)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" এবং "Agent-First Deployment" উপশিরোনামগুলো
  - `docs/chapter-05-multi-agent/README.md` — Quick Start এখন উভয় টেমপ্লেট এবং ম্যানিফেস্ট-ভিত্তিক ডিপ্লয়মেন্ট পথ দেখায়
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy অংশে এখন `azd ai agent init` বিকল্প অন্তর্ভুক্ত
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" উপশিরোনাম
  - `resources/cheat-sheet.md` — নতুন "AI & Extensions Commands" সেকশন যার মধ্যে `azd extension`, `azd ai agent init`, `azd mcp`, এবং `azd infra generate` রয়েছে
- **📦 নতুন AZD AI উদাহরণ টেমপ্লেট** `microsoft-foundry-integration.md`-এ:
  - **azure-search-openai-demo-csharp** — .NET RAG চ্যাট Blazor WebAssembly, Semantic Kernel, এবং ভয়েস চ্যাট সমর্থনসহ
  - **azure-search-openai-demo-java** — Langchain4J ব্যবহার করে Java RAG চ্যাট, ACA/AKS ডিপ্লয়মেন্ট বিকল্পসহ
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding, এবং Prompty ব্যবহার করে মাল্টি-এজেন্ট ক্রিয়েটিভ রাইটিং অ্যাপ
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB ব্যবহার করে সার্ভারলেস RAG, Ollama লোকাল ডেভ সমর্থন সহ
  - **chat-with-your-data-solution-accelerator** — অ্যাডমিন পোর্টাল, Teams ইন্টিগ্রেশন, এবং PostgreSQL/Cosmos DB অপশনসহ এন্টারপ্রাইজ RAG ত্বরান্বিতকারী
  - **azure-ai-travel-agents** — .NET, Python, Java, এবং TypeScript সার্ভারসহ মাল্টি-এজেন্ট MCP অর্কেস্ট্রেশন রেফারেন্স অ্যাপ
  - **azd-ai-starter** — ন্যূনতম Azure AI অবকাঠামো Bicep স্টার্টার টেমপ্লেট
  - **🔗 Awesome AZD AI Gallery লিঙ্ক** — [awesome-azd AI গ্যালারি](https://azure.github.io/awesome-azd/?tags=ai)-র রেফারেন্স (80+ টেমপ্লেট)

#### ঠিক করা হয়েছে
- **🔗 agents.md নেভিগেশন**: পূর্ববর্তী/পরবর্তী লিঙ্কগুলো এখন Chapter 2 README পাঠের ক্রমের সাথে মেলে (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md ভাঙা লিঙ্ক**: `production-ai-practices.md` ঠিক করা হয়েছে `../chapter-08-production/production-ai-practices.md`-এ (3টি স্থান)
- **📦 agents.md অবাঞ্ছিত কোড**: `opencensus` প্রতিস্থাপিত হয়েছে `azure-monitor-opentelemetry` + OpenTelemetry SDK দিয়ে
- **🐛 agents.md অবৈধ API**: `max_tokens` `create_agent()` থেকে সরিয়ে `create_run()`-এ `max_completion_tokens` হিসেবে স্থানান্তর করা হয়েছে
- **🔢 agents.md টোকেন গণনা**: আনুমানিক `len//4` সূত্রটি `tiktoken.encoding_for_model()` দিয়ে প্রতিস্থাপিত করা হয়েছে
- **azure-search-openai-demo**: সার্ভিসগুলো "Cognitive Search + App Service" থেকে "Azure AI Search + Azure Container Apps" হিসেবে সংশোধন করা হয়েছে (ডিফল্ট হোস্ট Oct 2024-এ পরিবর্তিত)
- **contoso-chat**: বিবরণ আপডেট করে Azure AI Foundry + Prompty উল্লেখ করা হয়েছে, যাতে রিপোয়ের প্রকৃত শিরোনাম এবং টেক স্ট্যাক মেলে

#### অপসারণ করা হয়েছে
- **ai-document-processing**: কাজ না করা টেমপ্লেট রেফারেন্স অপসারণ করা হয়েছে (রিপোটি AZD টেমপ্লেট হিসেবে সবার জন্য প্রকাশ্য নয়)

#### উন্নত করা হয়েছে
- **📝 agents.md অনুশীলনসমূহ**: অনুশীলন 1 এখন প্রত্যাশিত আউটপুট এবং `azd monitor` ধাপ দেখায়; অনুশীলন 2-এ পূর্ণ `FunctionTool` রেজিস্ট্রেশন কোড যোগ করা হয়েছে; অনুশীলন 3 অস্পষ্ট নির্দেশনা বদলে নির্দিষ্ট `prepdocs.py` কমান্ড যুক্ত করা হয়েছে
- **📚 agents.md সম্পদসমূহ**: ডকুমেন্টেশনের লিঙ্কগুলো আপডেট করে বর্তমানে Azure AI Agent Service ডকস এবং কুইকস্টার্টে নির্দেশ করা হয়েছে
- **📋 agents.md Next Steps টেবিল**: সম্পূর্ণ অধ্যায় কভার করার জন্য AI Workshop Lab লিঙ্ক যোগ করা হয়েছে

#### আপডেট হওয়া ফাইলসমূহ
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### কোর্স নেভিগেশন উন্নয়ন
**এই সংস্করণটি README.md অধ্যায় নেভিগেশনটি উন্নত টেবিল ফরম্যাট দিয়ে উন্নত করে।**

#### পরিবর্তিত
- **কোর্স ম্যাপ টেবিল**: সরাসরি লেসনের লিঙ্ক, সময়কাল অনুমান এবং জটিলতা রেটিং সহ অনির্ণীত করা হয়েছে
- **ফোল্ডার ক্লিনআপ**: পুনরাবৃত্ত পুরোনো ফোল্ডারগুলি সরানো হয়েছে (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **লিঙ্ক যাচাইকরণ**: Course Map টেবিলের 21+ داخلی লিঙ্ক সব যাচাই করা হয়েছে

### [v3.16.0] - 2026-02-05

#### পণ্যের নাম আপডেট
**এই সংস্করণটি পণ্যের রেফারেন্সগুলোকে বর্তমান Microsoft ব্র্যান্ডিং অনুযায়ী আপডেট করে।**

#### পরিবর্তিত
- **Microsoft Foundry → Microsoft Foundry**: সকল রেফারেন্স অন-ট্রান্সলেশন ফাইলগুলিতে আপডেট করা হয়েছে
- **Azure AI Agent Service → Foundry Agents**: ব্র্যান্ডিং প্রতিফলিত করতে সার্ভিস নাম আপডেট করা হয়েছে

#### আপডেট হওয়া ফাইলসমূহ
- `README.md` - প্রধান কোর্স ল্যান্ডিং পেজ
- `changelog.md` - সংস্করণ ইতিহাস
- `course-outline.md` - কোর্স কাঠামো
- `docs/chapter-02-ai-development/agents.md` - AI এজেন্ট গাইড
- `examples/README.md` - উদাহরণ ডকুমেন্টেশন
- `workshop/README.md` - ওয়ার্কশপ ল্যান্ডিং পেজ
- `workshop/docs/index.md` - ওয়ার্কশপ ইনডেক্স
- `workshop/docs/instructions/*.md` - সমস্ত ওয়ার্কশপ নির্দেশিকা ফাইল

---

### [v3.15.0] - 2026-02-05

#### প্রধান রিপোজিটরি পুনর্গঠন: অধ্যায়-ভিত্তিক ফোল্ডার নাম
**এই সংস্করণটি নেভিগেশন স্পষ্ট করার জন্য ডকুমেন্টেশনকে নিবেদিত অধ্যায় ফোল্ডারে পুনর্গঠন করে।**

#### ফোল্ডার নামকরণ
পুরোনো ফোল্ডারগুলো অধ্যায়-নম্বার্ড ফোল্ডার দ্বারা প্রতিস্থাপিত হয়েছে:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- নতুন যোগ করা: `docs/chapter-05-multi-agent/`

#### ফাইল স্থানান্তর
| ফাইল | থেকে | এ |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### যোগ করা হয়েছে
- **📚 অধ্যায় README ফাইলসমূহ**: প্রতিটি অধ্যায় ফোল্ডারে README.md তৈরি করা হয়েছে যার মধ্যে রয়েছে:
  - শেখার উদ্দেশ্য এবং সময়কাল
  - লেসন টেবিল বিবরণ সহ
  - Quick start কমান্ডসমূহ
  - অন্যান্য অধ্যায়ে নেভিগেশন

#### পরিবর্তিত
- **🔗 সমস্ত ইন্টারনাল লিঙ্ক আপডেট**: 78+ পথ সমস্ত ডকুমেন্টেশন ফাইলে আপডেট করা হয়েছে
- **🗺️ প্রধান README.md**: নতুন অধ্যায় কাঠামো সহ Course Map আপডেট করা হয়েছে
- **📝 examples/README.md**: অধ্যায় ফোল্ডারগুলোর ক্রস-রেফারেন্স আপডেট করা হয়েছে

#### অপসারণ করা হয়েছে
- পুরোনো ফোল্ডার কাঠামো (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### রিপোজিটরি পুনর্গঠন: অধ্যায় নেভিগেশন
**এই সংস্করণটি অধ্যায় নেভিগেশন README ফাইল যোগ করে (v3.15.0 দ্বারা পরে প্রতিস্থাপিত)।**

---

### [v3.13.0] - 2026-02-05

#### নতুন AI এজেন্ট গাইড
**এই সংস্করণটি Azure Developer CLI ব্যবহার করে AI এজেন্ট ডিপ্লয়মেন্টের জন্য একটি ব্যাপক গাইড যোগ করে।**

#### যোগ করা হয়েছে
- **🤖 docs/microsoft-foundry/agents.md**: সম্পূর্ণ গাইড যা নিচের বিষয়গুলি কভার করে:
  - AI এজেন্ট কি এবং সেগুলো চ্যাটবট থেকে কীভাবে আলাদা
  - তিনটি কুইক-স্টার্ট এজেন্ট টেমপ্লেট (Foundry Agents, Prompty, RAG)
  - এজেন্ট আর্কিটেকচার প্যাটার্ন (সিঙ্গল এজেন্ট, RAG, মাল্টি-এজেন্ট)
  - টুল কনফিগারেশন এবং কাস্টমাইজেশন
  - মনিটরিং এবং মেট্রিক্স ট্র্যাকিং
  - খরচ বিবেচ্য বিষয় এবং অপ্টিমাইজেশন
  - সাধারণ ট্রাবলশুটিং পরিস্থিতি
  - তিনটি হ্যান্ডস-অন অনুশীলন ও সফলতার মানদণ্ড

#### বিষয়বস্তুর গঠন
- **পরিচিতি**: নবশিক্ষার্থীদের জন্য এজেন্ট ধারণা
- **কুইক স্টার্ট**: `azd init --template get-started-with-ai-agents` দিয়ে এজেন্ট ডিপ্লয় করুন
- **আর্কিটেকচার প্যাটার্ন**: এজেন্ট প্যাটার্নগুলোর ভিজ্যুয়াল ডায়াগ্রাম
- **কনফিগারেশন**: টুল সেটআপ এবং পরিবেশ পরিবর্তনশীল
- **মনিটরিং**: Application Insights একীভূতকরণ
- **অনুশীলনসমূহ**: প্রগতিশীল হ্যান্ডস-অন শেখা (প্রতি অনুশীলন 20-45 মিনিট)

---

### [v3.12.0] - 2026-02-05

#### DevContainer এনভায়রনমেন্ট আপডেট
**এই সংস্করণটি AZD শেখার অভিজ্ঞতার জন্য উন্নত টুল এবং উন্নত ডিফল্ট সহ ডেভেলপমেন্ট কন্টেইনার কনফিগারেশন আপডেট করে।**

#### পরিবর্তিত
- **🐳 বেস ইমেজ**: `python:3.12-bullseye` থেকে `python:3.12-bookworm`-এ আপডেট করা হয়েছে (সর্বশেষ Debian স্থিতিশীল)
- **📛 কন্টেইনার নাম**: স্পষ্টতার জন্য "Python 3" থেকে "AZD for Beginners" এ নাম পরিবর্তন করা হয়েছে

#### যোগ করা হয়েছে
- **🔧 নতুন ডেভ কন্টেইনার ফিচার**:
  - `azure-cli` (Bicep সমর্থন সক্রিয়)
  - `node:20` (AZD টেমপ্লেটগুলির জন্য LTS সংস্করণ)
  - `github-cli` টেমপ্লেট ব্যবস্থাপনার জন্য
  - `docker-in-docker` কন্টেইনার অ্যাপ ডিপ্লয়মেন্টের জন্য

- **🔌 পোর্ট ফরওয়ার্ডিং**: সাধারণ ডেভেলপমেন্টের জন্য পূর্ব-কনফিগারকৃত পোর্ট:
  - 8000 (MkDocs প্রিভিউ)
  - 3000 (ওয়েব অ্যাপ)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 নতুন VS Code এক্সটেনশান**:
  - `ms-python.vscode-pylance` - উন্নত Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions সমর্থন
  - `ms-azuretools.vscode-docker` - Docker সমর্থন
  - `ms-azuretools.vscode-bicep` - Bicep ভাষার সমর্থন
  - `ms-azure-devtools.azure-resource-groups` - Azure রিসোর্স ব্যবস্থাপনা
  - `yzhang.markdown-all-in-one` - Markdown সম্পাদনা
  - `DavidAnson.vscode-markdownlint` - Markdown লিন্টিং
  - `bierner.markdown-mermaid` - Mermaid ডায়াগ্রাম সমর্থন
  - `redhat.vscode-yaml` - YAML সমর্থন (azure.yaml-এর জন্য)
  - `eamodio.gitlens` - Git ভিজ্যুয়ালাইজেশন
  - `mhutchie.git-graph` - Git ইতিহাস

- **⚙️ VS Code সেটিংস**: Python ইন্টারপ্রেটার, সেভ করলে ফরম্যাট, এবং whitespace ট্রিমিং-এর জন্য ডিফল্ট সেটিংস যোগ করা হয়েছে

- **📦 requirements-dev.txt আপডেট করা হয়েছে**:
  - MkDocs minify প্লাগইন যোগ করা হয়েছে
  - pre-commit কোড কোয়ালিটির জন্য যোগ করা হয়েছে
  - Azure SDK প্যাকেজগুলি যোগ করা হয়েছে (azure-identity, azure-mgmt-resource)

#### ঠিক করা হয়েছে
- **পোস্ট-ক্রিয়েট কমান্ড**: এখন কনটেইনার শুরুতে AZD এবং Azure CLI ইনস্টলেশন যাচাই করে

---

### [v3.11.0] - 2026-02-05

#### নবাগতদের জন্য README পুনর্গঠন
**এই সংস্করণটি README.md কে নবাগতদের জন্য আরো সহজলভ্য করে তুলেছে এবং AI ডেভেলপারদের জন্য গুরুত্বপূর্ণ রিসোর্স যোগ করেছে।**

#### যোগ করা হয়েছে
- **🆚 Azure CLI বনাম AZD তুলনা**: প্রতিটি টুল কবে ব্যবহার করবেন তা বাস্তব উদাহরণসহ সুস্পষ্ট ব্যাখ্যা
- **🌟 অসাধারণ AZD লিংকসমূহ**: কমিউনিটি টেমপ্লেট গ্যালারি এবং কনট্রিবিউশন রিসোর্সের সরাসরি লিংক:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ডিপ্লয়-প্রস্তুত টেমপ্লেট
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - কমিউনিটি অবদানের জন্য
- **🎯 দ্রুত শুরু করুণ গাইড**: সরলীকৃত 3-ধাপ শুরু অংশ (ইনস্টল → লগইন → ডিপ্লয়)
- **📊 অভিজ্ঞতা-ভিত্তিক নেভিগেশন টেবিল**: ডেভেলপার অভিজ্ঞতার ভিত্তিতে কোথা থেকে শুরু করবেন সে সম্পর্কে স্পষ্ট নির্দেশনা

#### পরিবর্তিত
- **README স্ট্রাকচার**: প্রগ্রেসিভ ডিসক্লোজারের জন্য পুনর্বিন্যস্ত - প্রথমে মূল তথ্য
- **পরিচিতি সেকশন**: সম্পূর্ণ নবাগতদের জন্য "The Magic of `azd up`" বোঝাতে পুনরায় লেখা হয়েছে
- **ডুপ্লিকেট কন্টেন্ট সরানো হয়েছে**: ডুপ্লিকেট ট্রাবলশুটিং সেকশন মুছে ফেলা হয়েছে
- **ট্রাবলশুটিং কমান্ড**: বৈধ `azd monitor --logs` ব্যবহার করতে `azd logs` রেফারেন্সটি সংশোধন করা হয়েছে

#### ঠিক করা হয়েছে
- **🔐 প্রমাণীকরণ কমান্ড**: `azd auth login` এবং `azd auth logout` cheat-sheet.md এ যোগ করা হয়েছে
- **অবৈধ কমান্ড রেফারেন্স**: README ট্রাবলশুটিং অংশ থেকে বাকি `azd logs` সরিয়ে ফেলা হয়েছে

#### নোট
- **স্কোপ**: পরিবর্তনগুলি main README.md এবং resources/cheat-sheet.md এ প্রয়োগ করা হয়েছে
- **লক্ষ্য শ্রোতা**: উন্নতিগুলি বিশেষত AZD-এ নতুন ডেভেলপারদের উদ্দেশ্যে

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI কমান্ড সঠিকতা আপডেট
**এই সংস্করণটি ডকুমেন্টেশনের মধ্যে থাকা অস্থিতিশীল AZD কমান্ডগুলিকে ঠিক করে, নিশ্চিত করে যে সব কোড উদাহরণ বৈধ Azure Developer CLI সিনট্যাক্স ব্যবহার করছে।**

#### ঠিক করা হয়েছে
- **🔧 অস্থিতিশীল AZD কমান্ডগুলি সরানো হয়েছে**: অবৈধ কমান্ডগুলির ব্যাপক অডিট এবং সংশোধন:
  - `azd logs` (অস্তিত্ব নেই) → `azd monitor --logs` অথবা Azure CLI বিকল্প দ্বারা প্রতিস্থাপিত
  - `azd service` সাবকমান্ডসমূহ (অস্তিত্ব নেই) → `azd show` এবং Azure CLI দিয়ে প্রতিস্থাপিত
  - `azd infra import/export/validate` (অস্তিত্ব নেই) → সরানো হয়েছে বা বৈধ বিকল্প দিয়ে প্রতিস্থাপিত
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` ফ্ল্যাগসমূহ (অস্তিত্ব নেই) → সরানো হয়েছে
  - `azd provision --what-if/--rollback` ফ্ল্যাগসমূহ (অস্তিত্ব নেই) → `--preview` ব্যবহার করে আপডেট করা হয়েছে
  - `azd config validate` (অস্তিত্ব নেই) → `azd config list` দিয়ে প্রতিস্থাপিত
  - `azd info`, `azd history`, `azd metrics` (অস্তিত্ব নেই) → সরানো হয়েছে

- **📚 কমান্ড সংশোধনসহ ফাইলগুলো আপডেট হয়েছে**:
  - `resources/cheat-sheet.md`: কমান্ড রেফারেন্সের বড় পরিবর্তন
  - `docs/deployment/deployment-guide.md`: রোলব্যাক এবং ডিপ্লয়মেন্ট কৌশল সঠিক করা হয়েছে
  - `docs/troubleshooting/debugging.md`: লগ বিশ্লেষণ অংশগুলো সংশোধন করা হয়েছে
  - `docs/troubleshooting/common-issues.md`: ট্রাবলশুটিং কমান্ড আপডেট করা হয়েছে
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD ডিবাগিং সেকশন ঠিক করা হয়েছে
  - `docs/getting-started/azd-basics.md`: মনিটরিং কমান্ড সঠিক করা হয়েছে
  - `docs/getting-started/first-project.md`: মনিটরিং এবং ডিবাগিং উদাহরণ আপডেট করা হয়েছে
  - `docs/getting-started/installation.md`: হেল্প এবং ভার্সন উদাহরণ ঠিক করা হয়েছে
  - `docs/pre-deployment/application-insights.md`: লগ দেখার কমান্ড সঠিক করা হয়েছে
  - `docs/pre-deployment/coordination-patterns.md`: এজেন্ট ডিবাগিং কমান্ড সঠিক করা হয়েছে

#### পরিবর্তিত
- **রোলব্যাক কৌশল**: AZD-এর নিজস্ব রোলব্যাক নেই; Git-ভিত্তিক রোলব্যাক ব্যবহারের জন্য ডকুমেন্টেশন আপডেট করা হয়েছে
- **লগ দেখা**: `azd logs` রেফারেন্সগুলো `azd monitor --logs`, `azd monitor --live`, এবং Azure CLI কমান্ডগুলোর সাথে প্রতিস্থাপিত করা হয়েছে
- **পারফরম্যান্স সেকশন**: অস্থিতিশীল parallel/incremental ডিপ্লয়মেন্ট ফ্ল্যাগগুলো সরানো হয়েছে এবং বৈধ বিকল্প প্রদান করা হয়েছে

#### প্রযুক্তিগত বিবরণ
- **বৈধ AZD কমান্ডসমূহ**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **বৈধ azd monitor ফ্ল্যাগসমূহ**: `--live`, `--logs`, `--overview`
- **সরানো হয়েছে এমন ফিচারসমূহ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### নোট
- **ভেরিফিকেশন**: কমান্ডগুলি Azure Developer CLI v1.23.x এর সাথে যাচাই করা হয়েছে

---

### [v3.9.0] - 2026-02-05

#### ওয়ার্কশপ সম্পন্নকরণ ও ডকুমেন্টেশন কোয়ালিটি আপডেট
**এই সংস্করণটি ইন্টারেক্টিভ ওয়ার্কশপ মডিউলগুলি সম্পন্ন করে, সব ভাঙা ডকুমেন্টেশন লিঙ্ক ঠিক করে, এবং Microsoft AZD ব্যবহারকারী AI ডেভেলপারদের জন্য সামগ্রিক কনটেন্ট কোয়ালিটি উন্নত করেছে।**

#### যোগ করা হয়েছে
- **📝 CONTRIBUTING.md**: নতুন কন্ট্রিবিউশন নির্দেশিকা ডকুমেন্ট যার মধ্যে:
  - সমস্যা রিপোর্ট করা এবং পরিবর্তনের প্রস্তাব করার জন্য স্পষ্ট নির্দেশনা
  - নতুন কনটেন্টের জন্য ডকুমেন্টেশন মানদণ্ড
  - কোড উদাহরণ নির্দেশিকা এবং কমিট মেসেজ নিয়মাবলী
  - কমিউনিটি এনগেজমেন্ট তথ্য

#### সম্পন্ন
- **🎯 ওয়ার্কশপ মডিউল 7 (Wrap-up)**: নিম্নোক্ত সহ সম্পূর্ণ wrap-up মডিউল সম্পন্ন:
  - ওয়ার্কশপ অর্জনগুলোর বিস্তৃত সংক্ষিপ্তসার
  - AZD, টেমপ্লেট, এবং Microsoft Foundry কভার করে প্রধান ধারণাসমূহ
  - শিখন যাত্রা চালিয়ে যাওয়ার সুপারিশ
  - কঠিনতার রেটিং সহ ওয়ার্কশপ চ্যালেঞ্জ এক্সারসাইজ
  - কমিউনিটি ফিডব্যাক ও সহায়তা লিংক

- **📚 ওয়ার্কশপ মডিউল 3 (Deconstruct)**: নিম্নোক্ত বিষয়গুলোর সাথে শেখার উদ্দেশ্য আপডেট করা হয়েছে:
  - GitHub Copilot MCP সার্ভারগুলির সাথে সক্রিয়করণ নির্দেশিকা
  - AZD টেমপ্লেট ফোল্ডার স্ট্রাকচার বোঝা
  - Infrastructure-as-code (Bicep) সংস্থাপন প্যাটার্ন
  - হ্যান্ডস-অন ল্যাব নির্দেশনা

- **🔧 ওয়ার্কশপ মডিউল 6 (Teardown)**: সম্পন্ন হয়েছে:
  - রিসোর্স ক্লিনআপ এবং কস্ট ম্যানেজমেন্ট উদ্দেশ্য
  - `azd down` নিরাপদভাবে ইনফ্রাস্ট্রাকচার ডেপ্রোভিশন করার জন্য ব্যবহার
  - সফট-ডিলিটেড কগনিটিভ সার্ভিসেস রিকভারি নির্দেশিকা
  - GitHub Copilot এবং Azure Portal এর জন্য বোনাস এক্সপ্লোরেশন প্রম্পট

#### ঠিক করা হয়েছে
- **🔗 ভাঙা লিঙ্ক ফিক্স**: 15+ ভাঙা অভ্যন্তরীণ ডকুমেন্টেশন লিঙ্ক সমাধান করা হয়েছে:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md এ পাথ ঠিক করা হয়েছে
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md এবং production-ai-practices.md পাথ সঠিক করা হয়েছে
  - `docs/getting-started/first-project.md`: অস্তিত্বহীন cicd-integration.md কে deployment-guide.md দ্বারা প্রতিস্থাপিত করা হয়েছে
  - `examples/retail-scenario.md`: FAQ এবং ট্রাবলশুটিং গাইড পাথ ঠিক করা হয়েছে
  - `examples/container-app/microservices/README.md`: কোর্স হোম এবং ডিপ্লয়মেন্ট গাইড পাথ সঠিক করা হয়েছে
  - `resources/faq.md` এবং `resources/glossary.md`: AI অধ্যায় রেফারেন্স আপডেট করা হয়েছে
  - `course-outline.md`: ইনস্ট্রাক্টর গাইড এবং AI ওয়ার্কশপ ল্যাব রেফারেন্স ঠিক করা হয়েছে

- **📅 ওয়ার্কশপ স্ট্যাটাস ব্যানার**: "Under Construction" থেকে সক্রিয় ওয়ার্কশপ স্ট্যাটাসে আপডেট করা হয়েছে (ফেব্রুয়ারি 2026)
- **🔗 ওয়ার্কশপ নেভিগেশন**: workshop README.md-এ lab-1-azd-basics ফোল্ডারটি নির্দেশ করে থাকা ভাঙা নেভিগেশন লিঙ্ক সমাধান করা হয়েছে

#### পরিবর্তিত
- **ওয়ার্কশপ উপস্থাপনা**: "under construction" সতর্কতা সরানো হয়েছে, ওয়ার্কশপ এখন সম্পন্ন এবং ব্যবহারের জন্য প্রস্তুত
- **নেভিগেশন কনসিসটেন্সি**: নিশ্চিত করা হয়েছে যে সব ওয়ার্কশপ মডিউলে সঠিক ইন্টার-মডিউল নেভিগেশন আছে
- **শিখন পথ রেফারেন্স**: chapter ক্রস-রেফারেন্সগুলো সঠিক microsoft-foundry পাথ ব্যবহার করতে আপডেট করা হয়েছে

#### যাচাই করা হয়েছে
- ✅ সব ইংরেজি মার্কডাউন ফাইলগুলিতে বৈধ অভ্যন্তরীণ লিঙ্ক আছে
- ✅ ওয়ার্কশপ মডিউল 0-7 সম্পূর্ণ এবং শেখার উদ্দেশ্যসহ
- ✅ অধ্যায় ও মডিউলগুলোর মধ্যে নেভিগেশন সঠিকভাবে কাজ করে
- ✅ কনটেন্ট AI ডেভেলপারদের জন্য উপযুক্ত
- ✅ নবাগতদের জন্য সহজবোধ্য ভাষা এবং গঠন বজায় আছে
- ✅ CONTRIBUTING.md কমিউনিটি কনট্রিবিউটরদের জন্য স্পষ্ট নির্দেশনা প্রদান করে

#### প্রযুক্তিগত বাস্তবায়ন
- **লিংক ভ্যালিডেশন**: একটি অটোমেটেড PowerShell স্ক্রিপ্ট সব .md অভ্যন্তরীণ লিঙ্ক যাচাই করেছে
- **কনটেন্ট অডিট**: ওয়ার্কশপ সম্পূর্ণতা এবং নবাগত উপযোগিতার ম্যানুয়াল রিভিউ করা হয়েছে
- **নেভিগেশন সিস্টেম**: ধারাবাহিক অধ্যায় এবং মডিউল নেভিগেশন প্যাটার্ন প্রয়োগ করা হয়েছে

#### নোট
- **স্কোপ**: পরিবর্তনগুলি শুধুমাত্র ইংরেজি ডকুমেন্টেশনে প্রয়োগ করা হয়েছে
- **অনুবাদসমূহ**: অনুবাদ ফোল্ডারগুলো এই সংস্করণে আপডেট করা হয়নি (অটোমেটেড অনুবাদ পরে সিঙ্ক হবে)
- **ওয়ার্কশপ সময়কাল**: সম্পূর্ণ ওয়ার্কশপ এখন 3-4 ঘন্টার হ্যান্ডস-অন শেখার প্রদান করে

---

### [v3.8.0] - 2025-11-19

#### উন্নত ডকুমেন্টেশন: মনিটরিং, সিকিউরিটি, এবং মাল্টি-এজেন্ট প্যাটার্ন
**এই সংস্করণটি Application Insights ইন্টিগ্রেশন, প্রমাণীকরণ প্যাটার্ন এবং প্রোডাকশনের জন্য মাল্টি-এজেন্ট কোঅর্ডিনেশন সম্পর্কে বিস্তৃত A-গ্রেড লেসন যোগ করে।**

#### যোগ করা হয়েছে
- **📊 Application Insights Integration Lesson**: `docs/pre-deployment/application-insights.md`-এ:
  - স্বয়ংক্রিয় প্রোভিশনিং সহ AZD-কেন্দ্রিক ডিপ্লয়মেন্ট
  - Application Insights + Log Analytics-এর জন্য সম্পূর্ণ Bicep টেমপ্লেট
  - কাস্টম টেলিমেট্রি সহ কার্যকর Python অ্যাপ্লিকেশন (1,200+ লাইন)
  - AI/LLM মনিটরিং প্যাটার্ন (Microsoft Foundry Models টোকেন/কস্ট ট্র্যাকিং)
  - 6 টি Mermaid ডায়াগ্রাম (আর্কিটেকচার, ডিস্ট্রিবিউটেড ট্রেসিং, টেলিমেট্রি ফ্লো)
  - 3 টি হ্যান্ডস-অন এক্সারসাইজ (অ্যালার্ট, ড্যাশবোর্ড, AI মনিটরিং)
  - Kusto কুয়েরি উদাহরণ এবং কস্ট অপ্টিমাইজেশন কৌশল
  - লাইভ মেট্রিক্স স্ট্রিমিং এবং রিয়েল-টাইম ডিবাগিং
  - প্রোডাকশন-রেডি প্যাটার্ন সহ 40-50 মিনিট শেখার সময়

- **🔐 Authentication & Security Patterns Lesson**: `docs/getting-started/authsecurity.md`-এ:
  - 3টি প্রমাণীকরণ প্যাটার্ন (connection strings, Key Vault, managed identity)
  - নিরাপদ ডিপ্লয়মেন্টের জন্য সম্পূর্ণ Bicep ইনফ্রাস্ট্রাকচার টেমপ্লেট
  - Azure SDK ইন্টিগ্রেশনসহ Node.js অ্যাপ্লিকেশন কোড
  - 3টি পূর্ণাঙ্গ এক্সারসাইজ (managed identity সক্রিয় করা, user-assigned identity, Key Vault রোটেশন)
  - সিকিউরিটি বেস্ট প্র্যাকটিস এবং RBAC কনফিগারেশন
  - ট্রাবলশুটিং গাইড এবং খরচ বিশ্লেষণ
  - প্রোডাকশন-রেডি পাসওয়ার্ডলেস প্রমাণীকরণ প্যাটার্ন

- **🤖 Multi-Agent Coordination Patterns Lesson**: `docs/pre-deployment/coordination-patterns.md`-এ:
  - 5টি কোঅর্ডিনেশন প্যাটার্ন (sequential, parallel, hierarchical, event-driven, consensus)
  - সম্পূর্ণ অর্কেস্ট্রেটর সার্ভিস ইমপ্লিমেন্টেশন (Python/Flask, 1,500+ লাইন)
  - 3টি বিশেষায়িত এজেন্ট ইমপ্লিমেন্টেশন (Research, Writer, Editor)
  - মেসেজ কিউয়েরিংয়ের জন্য Service Bus ইন্টিগ্রেশন
  - ডিস্ট্রিবিউটেড সিস্টেমের জন্য Cosmos DB স্টেট ম্যানেজমেন্ট
  - এজেন্ট ইন্টারঅ্যাকশন দেখাতে 6 টি Mermaid ডায়াগ্রাম
  - 3 টি উন্নত এক্সারসাইজ (টাইমআউট হ্যান্ডলিং, রেট্রাই লজিক, সার্কিট ব্রেকার)
  - অপ্টিমাইজেশন কৌশলসহ কস্ট ব্রেকডাউন ($240-565/month)
  - মনিটরিং-এর জন্য Application Insights ইন্টিগ্রেশন

#### উন্নত
- **প্রি-ডিপ্লয়মেন্ট অধ্যায়**: এখন বিস্তৃত মনিটরিং এবং কোঅর্ডিনেশন প্যাটার্ন অন্তর্ভুক্ত
- **গেটিং স্টার্টেড অধ্যায়**: প্রফেশনাল প্রমাণীকরণ প্যাটার্ন সহ উন্নত
- **প্রোডাকশন রেডিনেস**: সিকিউরিটি থেকে অবজার্ভেবিলিটি পর্যন্ত সম্পূর্ণ কভারেজ
- **কোর্স আউটলাইন**: নতুন লেসনগুলোকে Chapters 3 এবং 6-এ রেফারেন্স করার জন্য আপডেট করা হয়েছে

#### পরিবর্তিত
- **শিখন প্রগ্রেশন**: সিকিউরিটি এবং মনিটরিংকে পুরো কোর্স জুড়ে ভালভাবে একত্রীকৃত করা হয়েছে
- **ডকুমেন্টেশন কোয়ালিটি**: নতুন লেসনগুলোর মধ্যে ধারাবাহিক A-গ্রেড মানদণ্ড (95-97%) বজায় রাখা হয়েছে
- **প্রোডাকশন প্যাটার্ন**: এন্টারপ্রাইজ ডিপ্লয়মেন্টের জন্য সম্পূর্ণ end-to-end কভারেজ

#### উন্নত
- **Developer Experience**: ডেভেলপমেন্ট থেকে প্রোডাকশনে মনিটরিং পর্যন্ত স্পষ্ট পথ
- **Security Standards**: প্রমাণিত প্যাটার্নসমূহ অথেন্টিকেশন এবং সিক্রেটস ম্যানেজমেন্টের জন্য
- **Observability**: AZD সহ সম্পূর্ণ Application Insights ইন্টেগ্রেশন
- **AI Workloads**: Microsoft Foundry Models এবং মাল্টি-এজেন্ট সিস্টেমগুলির জন্য বিশেষায়িত মনিটরিং

#### Validated
- ✅ All lessons include complete working code (not snippets)
- ✅ Mermaid diagrams for visual learning (19 total across 3 lessons)
- ✅ Hands-on exercises with verification steps (9 total)
- ✅ Production-ready Bicep templates deployable via `azd up`
- ✅ Cost analysis and optimization strategies
- ✅ Troubleshooting guides and best practices
- ✅ Knowledge checkpoints with verification commands

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - ব্যাপক মনিটরিং গাইড
- **docs/getting-started/authsecurity.md**: - পেশাদার সিকিউরিটি প্যাটার্নসমূহ
- **docs/pre-deployment/coordination-patterns.md**: - উন্নত মাল্টি-এজেন্ট আর্কিটেকচার
- **Overall New Content**: - সঙ্গতিপূর্ণ উচ্চ-মানের মানদণ্ড

#### Technical Implementation
- **Application Insights**: Log Analytics + custom telemetry + distributed tracing
- **Authentication**: Managed Identity + Key Vault + RBAC patterns
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Cost Management**: Sampling strategies, retention policies, budget controls

### [v3.7.0] - 2025-11-19

#### Documentation Quality Improvements and New Microsoft Foundry Models Example
**এই সংস্করণটি রেপোজিটরির জুড়ে ডকুমেন্টেশন গুণগত মান উন্নত করে এবং gpt-4.1 চ্যাট ইন্টারফেস সহ একটি সম্পূর্ণ Microsoft Foundry Models ডেপ্লয়মেন্ট উদাহরণ যোগ করে।**

#### Added
- **🤖 Microsoft Foundry Models Chat Example**: Complete gpt-4.1 deployment with working implementation in `examples/azure-openai-chat/`:
  - Complete Microsoft Foundry Models infrastructure (gpt-4.1 model deployment)
  - Python command-line chat interface with conversation history
  - Key Vault integration for secure API key storage
  - Token usage tracking and cost estimation
  - Rate limiting and error handling
  - Comprehensive README with 35-45 minute deployment guide
  - 11 production-ready files (Bicep templates, Python app, configuration)
- **📚 Documentation Exercises**: কনফিগারেশন গাইডে অনুশীলনভিত্তিক এক্সারসাইজ যোগ করা হয়েছে:
  - Exercise 1: Multi-environment configuration (15 minutes)
  - Exercise 2: Secret management practice (10 minutes)
  - পরিষ্কার সফলতার ক্রাইটেরিয়া এবং যাচাই করার ধাপসমূহ
- **✅ Deployment Verification**: ডেপ্লয়মেন্ট গাইডে যাচাই বিভাগ যোগ করা হয়েছে:
  - হেলথ চেক পদ্ধতিসমূহ
  - সফলতার ক্রাইটেরিয়া চেকলিস্ট
  - সমস্ত ডেপ্লয়মেন্ট কমান্ডের প্রত্যাশিত আউটপুট
  - দ্রুত ট্রাবলশুটিং রেফারেন্স

#### Enhanced
- **examples/README.md**: A-grade মানের জন্য আপডেট করা হয়েছে (93%):
  - azure-openai-chat সমস্ত প্রাসঙ্গিক সেকশনে যোগ করা হয়েছে
  - লোকাল উদাহরণ সংখ্যা 3 থেকে 4 এ আপডেট করা হয়েছে
  - AI Application Examples টেবিলে যোগ করা হয়েছে
  - Intermediate Users এর জন্য Quick Start এ ইন্টিগ্রেট করা হয়েছে
  - Microsoft Foundry Templates সেকশনে যোগ করা হয়েছে
  - Comparison Matrix এবং প্রযুক্তি খোঁজার সেকশন আপডেট করা হয়েছে
- **Documentation Quality**: B+ (87%) → A- (92%) ডকস ফোল্ডারে উন্নত হয়েছে:
  - ক্রিটিক্যাল কমান্ড উদাহরণগুলিতে প্রত্যাশিত আউটপুট যোগ করা হয়েছে
  - কনফিগারেশন পরিবর্তনের জন্য যাচাই ধাপসমূহ অন্তর্ভুক্ত করা হয়েছে
  - ব্যবহারিক অনুশীলনের মাধ্যমে হ্যান্ডস-অন লার্নিং উন্নত করা হয়েছে

#### Changed
- **Learning Progression**: Intermediate শিক্ষার্থীদের জন্য AI উদাহরণগুলোর ভালো ইন্টিগ্রেশন
- **Documentation Structure**: স্পষ্ট ফলাফলসহ আরও কার্যকরী অনুশীলনসমূহ
- **Verification Process**: মূল ওয়ার্কফ্লোতে স্পষ্ট সফলতার ক্রাইটেরিয়া যোগ করা হয়েছে

#### Improved
- **Developer Experience**: Microsoft Foundry Models ডেপ্লয়মেন্ট এখন 35-45 মিনিটে সম্পন্ন (জটিল বিকল্পগুলোর ক্ষেত্রে 60-90 মিনিটের বদলে)
- **Cost Transparency**: Microsoft Foundry Models উদাহরণের জন্য পরিষ্কার খরচ অনুমান ($50-200/month)
- **Learning Path**: AI ডেভেলপারদের জন্য azure-openai-chat সহ স্পষ্ট এন্ট্রি পয়েন্ট
- **Documentation Standards**: প্রত্যাশিত আউটপুট এবং যাচাই ধাপসমূহে ধারাবাহিকতা

#### Validated
- ✅ Microsoft Foundry Models example fully functional with `azd up`
- ✅ All 11 implementation files syntactically correct
- ✅ README instructions match actual deployment experience
- ✅ Documentation links updated across 8+ locations
- ✅ Examples index accurately reflects 4 local examples
- ✅ No duplicate external links in tables
- ✅ All navigation references correct

#### Technical Implementation
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps pattern
- **Security**: Managed Identity ready, secrets in Key Vault
- **Monitoring**: Application Insights integration
- **Cost Management**: Token tracking and usage optimization
- **Deployment**: Single `azd up` command for complete setup

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**এই সংস্করণটি Azure Developer CLI (AZD) ব্যবহার করে কনটেইনার অ্যাপ্লিকেশন ডেপ্লয়মেন্টের ব্যাপক, প্রোডাকশন-রেডি উদাহরণ পরিচয় করায়, পূর্ণ ডকুমেন্টেশন এবং লার্নিং পাথে ইন্টিগ্রেশনের সাথে।**

#### Added
- **🚀 Container App Examples**: New local examples in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): কনটেইনারাইজড ডেপ্লয়মেন্টের সম্পূর্ণ ওভারভিউ, কুইক স্টার্ট, প্রোডাকশন, এবং উন্নত প্যাটার্নসমূহ
  - [Simple Flask API](../../examples/container-app/simple-flask-api): শুরু করার জন্য উপযোগী REST API যার মধ্যে scale-to-zero, health probes, monitoring, এবং troubleshooting রয়েছে
  - [Microservices Architecture](../../examples/container-app/microservices): প্রোডাকশন-রেডি মাল্টি-সার্ভিস ডেপ্লয়মেন্ট (API Gateway, Product, Order, User, Notification), অ্যাসিঙ্ক মেসেজিং, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Best Practices**: সিকিউরিটি, মনিটরিং, কস্ট অপটিমাইজেশন, এবং containerized ওয়ার্কলোডের জন্য CI/CD গাইডেন্স
- **Code Samples**: সম্পূর্ণ `azure.yaml`, Bicep টেমপ্লেট, এবং মাল্টি-ল্যাঙ্গুয়েজ সার্ভিস ইমপ্লিমেন্টেশনসমূহ (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: এন্ড-টু-এন্ড টেস্ট সিচুয়েশন, মনিটরিং কমান্ড, ট্রাবলশুটিং নির্দেশিকা

#### Changed
- **README.md**: "Local Examples - Container Applications" এর অধীনে নতুন container app উদাহরণগুলিকে হাইলাইট এবং লিঙ্ক করার জন্য আপডেট করা হয়েছে
- **examples/README.md**: container app উদাহরণগুলিকে হাইলাইট করতে আপডেট করা হয়েছে, comparison matrix এ এন্ট্রি যোগ করা হয়েছে, এবং প্রযুক্তি/আর্কিটেকচার রেফারেন্স আপডেট করা হয়েছে
- **Course Outline & Study Guide**: প্রাসঙ্গিক অধ্যায়ে নতুন container app উদাহরণ এবং ডেপ্লয়মেন্ট প্যাটার্নগুলোকে রেফারেন্স করার জন্য আপডেট করা হয়েছে

#### Validated
- ✅ All new examples deployable with `azd up` and follow best practices
- ✅ Documentation cross-links and navigation updated
- ✅ Examples cover beginner to advanced scenarios, including production microservices

#### Notes
- **Scope**: English documentation and examples only
- **Next Steps**: ভবিষ্যত রিলিজে অতিরিক্ত উন্নত container প্যাটার্ন এবং CI/CD অটোমেশন যোগ করা হবে

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**এই সংস্করণটি "Microsoft Foundry" পণ্যের নামের ব্যাপক রেব্র্যান্ডিং বাস্তবায়ন করে ইংরেজি ডকুমেন্টেশনে, Microsoft-এর অফিসিয়াল রেব্র্যান্ডিং প্রতিফলিত করে।**

#### Changed
- **🔄 Product Name Update**: "Microsoft Foundry" থেকে "Microsoft Foundry" এ সম্পূর্ণ রেব্র্যান্ডিং
  - `docs/` ফোল্ডারের ইংরেজি ডকুমেন্টেশনে সমস্ত রেফারেন্স আপডেট করা হয়েছে
  - ফোল্ডার পুনরায় নামকরণ: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - ফাইলের নাম পরিবর্তন: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - মোট: 7 ডকুমেন্টেশন ফাইলে 23 কনটেন্ট রেফারেন্স আপডেট করা হয়েছে

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` কে `docs/microsoft-foundry/` এ নামকরণ করা হয়েছে
  - নতুন ফোল্ডার স্ট্রাকচার প্রতিফলিত করতে সমস্ত ক্রস-রেফারেন্স আপডেট করা হয়েছে
  - নেভিগেশন লিঙ্ক ভ্যালিডেট করা হয়েছে সমস্ত ডকুমেন্টেশনে

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - সকল ইন্টারনাল লিঙ্ক নতুন ফাইলনেম রেফারেন্স করার জন্য আপডেট করা হয়েছে

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigation link আপডেট
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 product name রেফারেন্স আপডেট
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - আগেই Microsoft Foundry ব্যবহার করা হয়েছে (পূর্ববর্তী আপডেট থেকে)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 রেফারেন্স আপডেট (ওভারভিউ, কমিউনিটি ফিডব্যাক, ডকুমেন্টেশন)
  - `docs/getting-started/azd-basics.md` - 4 ক্রস-রেফারেন্স লিঙ্ক আপডেট
  - `docs/getting-started/first-project.md` - 2 চ্যাপ্টার নেভিগেশন লিঙ্ক আপডেট
  - `docs/getting-started/installation.md` - 2 নেক্সট চ্যাপ্টার লিঙ্ক আপডেট
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 রেফারেন্স আপডেট (নেভিগেশন, Discord কমিউনিটি)
  - `docs/troubleshooting/common-issues.md` - 1 নেভিগেশন লিঙ্ক আপডেট
  - `docs/troubleshooting/debugging.md` - 1 নেভিগেশন লিঙ্ক আপডেট

- **Course Structure Files** (2 files):
  - `README.md` - 17 রেফারেন্স আপডেট (কোর্স ওভারভিউ, চ্যাপ্টার শিরোনাম, টেমপ্লেট সেকশন, কমিউনিটি ইনসাইট)
  - `course-outline.md` - 14 রেফারেন্স আপডেট (ওভারভিউ, লার্নিং অবজেকটিভ, চ্যাপ্টার রিসোর্স)

#### Validated
- ✅ Zero remaining "ai-foundry" folder path references in English docs
- ✅ Zero remaining "Microsoft Foundry" product name references in English docs
- ✅ All navigation links functional with new folder structure
- ✅ File and folder renames completed successfully
- ✅ Cross-references between chapters validated

#### Notes
- **Scope**: পরিবর্তনসমূহ শুধুমাত্র `docs/` ফোল্ডারের ইংরেজি ডকুমেন্টেশনে প্রযোজ্য
- **Translations**: অনুবাদ ফোল্ডারগুলো (`translations/`) এই সংস্করণে আপডেট করা হয়নি
- **Workshop**: ওয়ার্কশপ উপকরণ (`workshop/`) এই সংস্করণে আপডেট করা হয়নি
- **Examples**: উদাহরণ ফাইলগুলো এখনও লেগেসি নাম ব্যবহার করতে পারে (ভবিষ্যত আপডেটে ঠিক করা হবে)
- **External Links**: এক্সটার্নাল URL এবং GitHub রিপোজিটরি রেফারেন্স অপরিবর্তিত রয়েছে

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**এই সংস্করণটি নতুন Azure Developer CLI প্রিভিউ ফিচারের ব্যাপক সাপোর্ট পরিচয় করায় এবং ওয়ার্কশপ ব্যবহারকারীর অভিজ্ঞতা উন্নত করে।**

#### Added
- **🧪 azd provision --preview Feature Documentation**: নতুন ইনফ্রাস্ট্রাকচার প্রিভিউ ক্ষমতার ব্যাপক কভারেজ
  - কমান্ড রেফারেন্স এবং চিটশিটে ব্যবহার উদাহরণ
  - প্রোভিশনিং গাইডে বিস্তারিত ইন্টিগ্রেশন, ব্যবহার কেস এবং সুবিধাসমূহ
  - নিরাপদ ডেপ্লয়মেন্ট যাচাইয়ের জন্য প্রি-ফ্লাইট চেক ইন্টিগ্রেশন
  - সেফটি-ফার্স্ট ডেপ্লয়মেন্ট প্র্যাকটিস নিয়ে গেটিং স্টার্টেড গাইড আপডেট
- **🚧 Workshop Status Banner**: ওয়ার্কশপ ডেভেলপমেন্ট স্ট্যাটাস নির্দেশ করার জন্য পেশাদার HTML ব্যানার
  - গ্রেডিয়েন্ট ডিজাইন এবং কনস্ট্রাকশন ইনডিকেটরসমূহ স্পষ্ট ব্যবহারকারীর যোগাযোগের জন্য
  - সর্বশেষ আপডেট টাইমস্ট্যাম্প স্বচ্ছতার জন্য
  - সব ডিভাইস টাইপের জন্য মোবাইল-রেসপন্সিভ ডিজাইন

#### Enhanced
- **Infrastructure Safety**: প্রিভিউ ফাংশনালিটি ডেপ্লয়মেন্ট ডকুমেন্টেশনের জুড়ে ইন্টিগ্রেট করা হয়েছে
- **Pre-deployment Validation**: অটোমেটেড স্ক্রিপ্টগুলো এখন ইনফ্রাস্ট্রাকচার প্রিভিউ টেস্টিং অন্তর্ভুক্ত করে
- **Developer Workflow**: বেস্ট প্র্যাকটিস হিসেবে প্রিভিউ অন্তর্ভুক্ত করার জন্য কমান্ড সিকোয়েন্স আপডেট করা হয়েছে
- **Workshop Experience**: কনটেন্ট ডেভেলপমেন্ট স্ট্যাটাস সম্পর্কে ব্যবহারকারীদের জন্য পরিষ্কার প্রত্যাশা নির্ধারণ

#### Changed
- **Deployment Best Practices**: প্রিভিউ-ফার্স্ট ওয়ার্কফ্লো এখন সুপারিশকৃত পদ্ধতি
- **Documentation Flow**: ইনফ্রাস্ট্রাকচার ভ্যালিডেশন লার্নিং প্রসেসে আগেভাগে চলে এসেছে
- **Workshop Presentation**: পেশাদার স্ট্যাটাস কমিউনিকেশন সহ স্পষ্ট ডেভেলপমেন্ট টাইমলাইন

#### Improved
- **Safety-First Approach**: ডেপ্লয়মেন্টের আগে ইনফ্রাস্ট্রাকচার পরিবর্তনগুলো যাচাই করা যায়
- **Team Collaboration**: রিভিউ এবং অনুমোদনের জন্য প্রিভিউ ফলাফল শেয়ার করা যায়
- **Cost Awareness**: প্রোভিশনিংয়ের আগে রিসোর্স খরচের ভালো বোঝাপড়া
- **Risk Mitigation**: অগ্রিম ভ্যালিডেশনের মাধ্যমে ডেপ্লয়মেন্ট ত্রুটি হ্রাস

#### Technical Implementation
- **Multi-document Integration**: প্রিভিউ ফিচার 4টি কী ফাইলে ডকুমেন্ট করা হয়েছে
- **Command Patterns**: ডকুমেন্টেশনে সঙ্গতিপূর্ণ সিনট্যাক্স এবং উদাহরণ
- **Best Practice Integration**: ভ্যালিডেশন ওয়ার্কফ্লো এবং স্ক্রিপ্টে প্রিভিউ অন্তর্ভুক্ত
- **Visual Indicators**: নতুন ফিচার আয়ত্বের জন্য স্পষ্ট NEW মার্কিং

#### Workshop Infrastructure
- **Status Communication**: গ্রেডিয়েন্ট স্টাইলিংসহ পেশাদার HTML ব্যানার
- **User Experience**: স্পষ্ট ডেভেলপমেন্ট স্ট্যাটাস বিভ্রান্তি প্রতিরোধ করে
- **Professional Presentation**: রেপোজিটরির বিশ্বাসযোগ্যতা বজায় রেখে প্রত্যাশা নির্ধারণ করে
- **Timeline Transparency**: accountability এর জন্য October 2025 সর্বশেষ আপডেট টাইমস্ট্যাম্প

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**এই সংস্করণটি ব্রাউজার-ভিত্তিক ইন্টারঅ্যাকটিভ গাইড এবং স্ট্রাকচারড লার্নিং পাথসহ ব্যাপক ওয়ার্কশপ উপকরণ যোগ করে।**

#### Added
- **🎥 Interactive Workshop Guide**: ব্রাউজার-ভিত্তিক ওয়ার্কশপ অভিজ্ঞতা MkDocs প্রিভিউ সক্ষমতা সহ
- **📝 Structured Workshop Instructions**: আবিষ্কার থেকে কাস্টমাইজেশন পর্যন্ত 7-ধাপ নির্দেশিত শেখার পথ
  - 0-Introduction: ওয়ার্কশপ ওভারভিউ এবং সেটআপ
  - 1-Select-AI-Template: টেমপ্লেট আবিষ্কার এবং নির্বাচন প্রক্রিয়া
  - 2-Validate-AI-Template: ডিপ্লয়মেন্ট এবং ভ্যালিডেশন পদ্ধতি
  - 3-Deconstruct-AI-Template: টেমপ্লেট আর্কিটেকচার বুঝা
  - 4-Configure-AI-Template: কনফিগারেশন এবং কাস্টমাইজেশন
  - 5-Customize-AI-Template: উন্নত পরিবর্তন এবং পুনরাবৃত্তি
  - 6-Teardown-Infrastructure: ক্লিনআপ এবং রিসোর্স ম্যানেজমেন্ট
  - 7-Wrap-up: সারসংক্ষেপ এবং পরবর্তী ধাপ
- **🛠️ Workshop Tooling**: উন্নত শেখার অভিজ্ঞতার জন্য Material থিম সহ MkDocs কনফিগারেশন
- **🎯 Hands-On Learning Path**: 3-ধাপ পদ্ধতি (আবিষ্কার → ডিপ্লয়মেন্ট → কাস্টমাইজেশন)
- **📱 GitHub Codespaces Integration**: নির্বিঘ্ন উন্নয়ন পরিবেশ সেটআপ

#### Enhanced
- **AI Workshop Lab**: বিস্তৃত 2-3 ঘন্টার কাঠামোবদ্ধ শেখার অভিজ্ঞতা সহ প্রসারিত
- **Workshop Documentation**: নেভিগেশন এবং ভিজ্যুয়াল সহ পেশাদার উপস্থাপনা
- **Learning Progression**: টেমপ্লেট নির্বাচনের থেকে প্রোডাকশন ডিপ্লয়মেন্ট পর্যন্ত স্পষ্ট ধাপ-ধাপে নির্দেশিকা
- **Developer Experience**: সহজতর উন্নয়ন ওয়ার্কফ্লো জন্য ইন্টিগ্রেটেড টুলিং

#### Improved
- **Accessibility**: সার্চ, কপি কার্যকারিতা, এবং থিম টগল সহ ব্রাউজার-ভিত্তিক ইন্টারফেস
- **Self-Paced Learning**: বিভিন্ন শেখার গতি মেনে চলার জন্য নমনীয় ওয়ার্কশপ কাঠামো
- **Practical Application**: বাস্তব-জগতের AI টেমপ্লেট ডিপ্লয়মেন্ট দৃশ্যপট
- **Community Integration**: ওয়ার্কশপ সমর্থন এবং সহযোগিতার জন্য Discord ইন্টিগ্রেশন

#### Workshop Features
- **Built-in Search**: দ্রুত কিওয়ার্ড এবং লেসন খোঁজ
- **Copy Code Blocks**: সকল কোড উদাহরণের জন্য hover-to-copy কার্যকারিতা
- **Theme Toggle**: বিভিন্ন পছন্দের জন্য ডার্ক/লাইট মোড সাপোর্ট
- **Visual Assets**: উন্নত বোঝাপড়ার জন্য স্ক্রিনশট এবং ডায়াগ্রাম
- **Help Integration**: কমিউনিটি সমর্থনের জন্য সরাসরি Discord অ্যাক্সেস

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**এই সংস্করণটি সম্পূর্ণ রিপোজিটরির জুড়ে উন্নত নেভিগেশন সহ একটি ব্যাপক অধ্যায়-ভিত্তিক শেখার কাঠামো পরিচয় করায়।**

#### Added
- **📚 Chapter-Based Learning System**: সম্পূর্ণ কোর্সটি 8টি প্রগ্রেসিভ লার্নিং অধ্যায়ে পুনর্গঠিত
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: সমস্ত ডকুমেন্টেশনে সুষম নেভিগেশন হেডার এবং ফুটার
- **🎯 Progress Tracking**: কোর্স সম্পন্ন করার চেকলিস্ট এবং শেখার যাচাইকরণ সিস্টেম
- **🗺️ Learning Path Guidance**: বিভিন্ন অভিজ্ঞতা স্তর এবং লক্ষ্যগুলির জন্য স্পষ্ট এন্ট্রি পয়েন্ট
- **🔗 Cross-Reference Navigation**: সম্পর্কিত অধ্যায় এবং প্রয়োজনীয়তাগুলির স্পষ্ট লিঙ্ক

#### Enhanced
- **README Structure**: অধ্যায়-ভিত্তিক সংগঠনের সঙ্গে কাঠামোবদ্ধ লার্নিং প্ল্যাটফর্মে রূপান্তরিত
- **Documentation Navigation**: প্রতিটি পৃষ্ঠায় এখন অধ্যায় প্রসঙ্গ এবং অগ্রগতি নির্দেশিকা অন্তর্ভুক্ত
- **Template Organization**: উদাহরণ এবং টেমপ্লেটগুলি উপযুক্ত অধ্যায়ে মানচিত্র করা হয়েছে
- **Resource Integration**: বিন্দু-শিট, FAQ, এবং স্টাডি গাইডগুলি প্রাসঙ্গিক অধ্যায়গুলির সাথে সংযুক্ত
- **Workshop Integration**: হ্যান্ডস-অনের ল্যাবগুলি একাধিক অধ্যায় শেখার উদ্দেশ্যগুলির সাথে মানচিত্রকৃত

#### Changed
- **Learning Progression**: লিনিয়ার ডকুমেন্টেশন থেকে নমনীয় অধ্যায়-ভিত্তিক শেখার দিকে পরিবর্তিত
- **Configuration Placement**: উন্নত শেখার প্রবাহের জন্য কনফিগারেশন গাইডকে Chapter 3 এ পুনর্বিন্যস্ত
- **AI Content Integration**: শেখার যাত্রার জুড়ে AI-নির্দিষ্ট বিষয়বস্তুর উন্নত ইনটিগ্রেশন
- **Production Content**: এন্টারপ্রাইজ শিক্ষার্থীদের জন্য উন্নত প্যাটার্নগুলি Chapter 8 এ কনসোলিডেট করা হয়েছে

#### Improved
- **User Experience**: পরিষ্কার নেভিগেশন ব্রেডক্রাম্ব এবং অধ্যায় অগ্রগতি সূচক
- **Accessibility**: কোর্স ট্রাভার্সালের জন্য সুশৃঙ্খল নেভিগেশন প্যাটার্ন
- **Professional Presentation**: একাডেমিক এবং কর্পোরেট প্রশিক্ষণের উপযোগী ইউনিভার্সিটি-স্টাইল কোর্স স্ট্রাকচার
- **Learning Efficiency**: উন্নত সংগঠনের মাধ্যমে প্রাসঙ্গিক বিষয়বস্তু খুঁজে পেতে সময় কমানো

#### Technical Implementation
- **Navigation Headers**: 40+ ডকুমেন্টেশন ফাইল জুড়ে স্ট্যান্ডার্ডাইজড অধ্যায় নেভিগেশন
- **Footer Navigation**: ধারাবাহিক অগ্রগতি নির্দেশনা এবং অধ্যায় সম্পন্নতা সূচক
- **Cross-Linking**: সম্পর্কিত ধারণাগুলি সংযুক্ত করার জন্য ব্যাপক অভ্যন্তরীণ লিংকিং সিস্টেম
- **Chapter Mapping**: টেমপ্লেট এবং উদাহরণগুলি শেখার উদ্দেশ্যগুলির সাথে স্পষ্টভাবে সংযুক্ত

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: 8-অধ্যায় সিস্টেমের সাথে সারিবদ্ধ করে স্টাডি গাইড পুনর্গঠন
- **🎯 Chapter-Based Assessment**: প্রতিটি অধ্যায়ে নির্দিষ্ট শেখার লক্ষ্য এবং ব্যবহারিক অনুশীলন অন্তর্ভুক্ত
- **📋 Progress Tracking**: পরিমাপযোগ্য ফলাফল এবং সম্পন্নতার চেকলিস্ট সহ সাপ্তাহিক শেখার সূচি
- **❓ Assessment Questions**: প্রতিটি অধ্যায়ের জন্য জ্ঞান যাচাইকরণ প্রশ্নসমূহ পেশাদার ফলাফলের সাথে
- **🛠️ Practical Exercises**: বাস্তব ডিপ্লয়মেন্ট দৃশ্যপট এবং ট্রাবলশুটিংসহ হ্যান্ডস-অন কার্যকলাপ
- **📊 Skill Progression**: মৌলিক ধারণা থেকে এন্টারপ্রাইজ প্যাটার্ন পর্যন্ত স্পষ্ট অগ্রগতি ও ক্যারিয়ার উন্নয়ন ফোকাস
- **🎓 Certification Framework**: পেশাদার উন্নয়ন ফলাফল এবং কমিউনিটি স্বীকৃতি সিস্টেম
- **⏱️ Timeline Management**: মাইলস্টোন যাচাইকরণের সঙ্গে কাঠামোবদ্ধ 10-সপ্তাহের শেখার পরিকল্পনা

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**এই সংস্করণটি মাল্টি-এজেন্ট রিটেইল সলিউশনকে আরও উন্নত করে উন্নত এজেন্ট নামকরণ এবং উন্নত ডকুমেন্টেশন নিয়ে এসেছে।**

#### Changed
- **Multi-Agent Terminology**: পরিষ্কার বোঝার জন্য রিটেইল মাল্টি-এজেন্ট সলিউশনে "Cora agent" কে সারায় "Customer agent" দিয়ে প্রতিস্থাপন করা হয়েছে
- **Agent Architecture**: একরূপ "Customer agent" নাম ব্যবহারের জন্য সমস্ত ডকুমেন্টেশন, ARM টেমপ্লেট, এবং কোড উদাহরণ আপডেট করা হয়েছে
- **Configuration Examples**: আপডেট করা নামকরণ কনভেনশন সহ আধুনিক এজেন্ট কনফিগারেশন প্যাটার্ন
- **Documentation Consistency**: সমস্ত রেফারেন্সে পেশাদার, বর্ণনামূলক এজেন্ট নাম ব্যবহারের নিশ্চয়তা

#### Enhanced
- **ARM Template Package**: Customer agent রেফারেন্স সহ retail-multiagent-arm-template আপডেট করা হয়েছে
- **Architecture Diagrams**: আপডেটেড এজেন্ট নামকরণ সহ Mermaid ডায়াগ্রাম রিফ্রেশ করা হয়েছে
- **Code Examples**: Python ক্লাস এবং ইমপ্লিমেন্টেশন উদাহরণগুলি এখন CustomerAgent নাম ব্যবহার করে
- **Environment Variables**: সমস্ত ডিপ্লয়মেন্ট স্ক্রিপ্টে CUSTOMER_AGENT_NAME কনভেনশন ব্যবহার করার জন্য আপডেট করা হয়েছে

#### Improved
- **Developer Experience**: ডকুমেন্টেশনে এজেন্টের ভূমিকা এবং দায়িত্ব স্পষ্টভাবে প্রদর্শিত
- **Production Readiness**: এন্টারপ্রাইজ নামকরণ কনভেনশনের সাথে ভাল সামঞ্জস্য
- **Learning Materials**: শিক্ষামূলক উদ্দেশ্যে আরও স্বজ্ঞাত এজেন্ট নামকরণ
- **Template Usability**: এজেন্ট ফাংশন এবং ডিপ্লয়মেন্ট প্যাটার্নের সহজবোধ্য বোঝা

#### Technical Details
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**এই সংস্করণটি রিপোজিটরিটিকে Microsoft Foundry ইন্টিগ্রেশনসহ একটি বিস্তৃত AI-কেন্দ্রিক শেখার রিসোর্সে রূপান্তর করে।**

#### Added
- **🤖 AI-First Learning Path**: AI ডেভেলপার এবং ইঞ্জিনিয়ারদের অগ্রাধিকার দিয়ে সম্পূর্ণ পুনর্গঠন
- **Microsoft Foundry Integration Guide**: AZD কে Microsoft Foundry সার্ভিসের সাথে সংযুক্ত করার জন্য ব্যাপক ডকুমেন্টেশন
- **AI Model Deployment Patterns**: মডেল নির্বাচন, কনফিগারেশন, এবং প্রোডাকশন ডিপ্লয়মেন্ট স্ট্র্যাটেজিস কভার করে বিস্তারিত গাইড
- **AI Workshop Lab**: AI অ্যাপ্লিকেশনকে AZD-ডিপ্লয়েবল সলিউশনে রূপান্তরের জন্য 2-3 ঘন্টার হ্যান্ডস-অন ওয়ার্কশপ
- **Production AI Best Practices**: AI ওয়ার্কলোড স্কেলিং, মনিটরিং, এবং সিকিউর করার জন্য এন্টারপ্রাইজ-রেডি প্যাটার্ন
- **AI-Specific Troubleshooting Guide**: Microsoft Foundry Models, Cognitive Services, এবং AI ডিপ্লয়মেন্ট সমস্যা সমাধানের ব্যাপক ট্রাবলশুটিং
- **AI Template Gallery**: জটিলতা রেটিং সহ Microsoft Foundry টেমপ্লেটের নির্বাচিত সংগ্রহ
- **Workshop Materials**: হ্যান্ডস-অনের ল্যাব এবং রেফারেন্স উপকরণ সহ সম্পূর্ণ ওয়ার্কশপ স্ট্রাকচার

#### Enhanced
- **README Structure**: Microsoft Foundry Discord থেকে 45% কমিউনিটি ইন্টারেস্ট ডেটার সাথে AI-ডেভেলপার ফোকাসড
- **Learning Paths**: ছাত্র ও DevOps ইঞ্জিনিয়ারদের জন্য প্রচলিত পথের পাশাপাশি নিবেদিত AI ডেভেলপার জার্নি
- **Template Recommendations**: azure-search-openai-demo, contoso-chat, এবং openai-chat-app-quickstart সহ নির্বাচিত AI টেমপ্লেট
- **Community Integration**: AI-নির্দিষ্ট চ্যানেল এবং আলোচনা সহ উন্নত Discord কমিউনিটি সমর্থন

#### Security & Production Focus
- **Managed Identity Patterns**: AI-নির্দিষ্ট authentication এবং নিরাপত্তা কনফিগারেশন
- **Cost Optimization**: টোকেন ব্যবহার ট্র্যাকিং এবং AI ওয়ার্কলোডের জন্য বাজেট নিয়ন্ত্রণ
- **Multi-Region Deployment**: গ্লোবাল AI অ্যাপ্লিকেশন ডিপ্লয়মেন্টের জন্য কৌশল
- **Performance Monitoring**: AI-নির্দিষ্ট মেট্রিক্স এবং Application Insights ইন্টিগ্রেশন

#### Documentation Quality
- **Linear Course Structure**: বেসিক থেকে উন্নত AI ডিপ্লয়মেন্ট প্যাটার্ন পর্যন্ত যৌক্তিক অগ্রগতি
- **Validated URLs**: সমস্ত বাইরের রিপোজিটরি লিংক যাচাইকৃত এবং অ্যাক্সেসযোগ্য
- **Complete Reference**: সমস্ত অভ্যন্তরীণ ডকুমেন্টেশন লিংক যাচাইকৃত এবং কার্যকর
- **Production Ready**: বাস্তব-জগতের উদাহরণ সহ এন্টারপ্রাইজ ডিপ্লয়মেন্ট প্যাটার্ন

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**এই সংস্করণটি রিপোজিটরির স্ট্রাকচার এবং বিষয়বস্তুর উপস্থাপনায় একটি উল্লেখযোগ্য ওভারহাল উপস্থাপন করে।**

#### Added
- **Structured Learning Framework**: সমস্ত ডকুমেন্টেশন পৃষ্ঠায় এখন Introduction, Learning Goals, এবং Learning Outcomes সেকশন রয়েছে
- **Navigation System**: গাইডেড লার্নিং অগ্রগতির জন্য সমস্ত ডকুমেন্টেশনে Previous/Next লেসন লিঙ্ক যোগ করা হয়েছে
- **Study Guide**: শেখার উদ্দেশ্য, অনুশীলন, এবং মূল্যায়ন উপকরণ সহ বিস্তৃত study-guide.md
- **Professional Presentation**: উন্নত এক্সেসিবিলিটির জন্য সমস্ত ইমোজি আইকন সরানো হয়েছে
- **Enhanced Content Structure**: শেখার উপকরণগুলোর সংগঠন এবং প্রবাহ উন্নত করা হয়েছে

#### Changed
- **Documentation Format**: সুষম শেখা-ফোকাসড স্ট্রাকচারে সমস্ত ডকুমেন্টেশন স্ট্যান্ডার্ডাইজড
- **Navigation Flow**: সমস্ত শেখার উপকরণ জুড়ে যৌক্তিক অগ্রগতি বাস্তবায়িত
- **Content Presentation**: পরিষ্কার, পেশাদার বিন্যাসের পক্ষে সাজসজ্জা উপাদান সরানো হয়েছে
- **Link Structure**: নতুন নেভিগেশন সিস্টেম সমর্থন করার জন্য সমস্ত অভ্যন্তরীণ লিংক আপডেট করা হয়েছে

#### Improved
- **Accessibility**: স্ক্রিন রিডারের অনুকূলতার জন্য ইমোজি নির্ভরতা সরানো হয়েছে
- **Professional Appearance**: এন্টারপ্রাইজ শেখার উপযোগী পরিষ্কার, একাডেমিক-শৈলীর উপস্থাপনা
- **Learning Experience**: প্রতিটি লেসনের জন্য স্পষ্ট উদ্দেশ্য এবং ফলাফলের সঙ্গে কাঠামোবদ্ধ পদ্ধতি
- **Content Organization**: সম্পর্কিত বিষয়গুলির মধ্যে ভাল যৌক্তিক প্রবাহ এবং সংযোগ

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Complete getting-started guide series
  - Comprehensive deployment and provisioning documentation
  - Detailed troubleshooting resources and debugging guides
  - Pre-deployment validation tools and procedures

- **Getting Started Module**
  - AZD Basics: Core concepts and terminology
  - Installation Guide: Platform-specific setup instructions
  - Configuration Guide: Environment setup and authentication
  - First Project Tutorial: Step-by-step hands-on learning

- **Deployment and Provisioning Module**
  - Deployment Guide: Complete workflow documentation
  - Provisioning Guide: Infrastructure as Code with Bicep
  - Best practices for production deployments
  - Multi-service architecture patterns

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure resource availability validation
  - SKU Selection: Comprehensive service tier guidance
  - Pre-flight Checks: Automated validation scripts (PowerShell and Bash)
  - Cost estimation and budget planning tools

- **Troubleshooting Module**
  - Common Issues: Frequently encountered problems and solutions
  - Debugging Guide: Systematic troubleshooting methodologies
  - Advanced diagnostic techniques and tools
  - Performance monitoring and optimization

- **Resources and References**
  - Command Cheat Sheet: Quick reference for essential commands
  - Glossary: Comprehensive terminology and acronym definitions
  - FAQ: Detailed answers to common questions
  - External resource links and community connections

- **Examples and Templates**
  - Simple Web Application example
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture examples
  - Serverless function implementations

#### Features
- **Multi-Platform Support**: Windows, macOS, এবং Linux এর জন্য ইনস্টলেশন ও কনফিগারেশন গাইড
- **Multiple Skill Levels**: ছাত্র থেকে পেশাদার ডেভেলপার পর্যন্ত পরিকল্পিত বিষয়বস্তু
- **Practical Focus**: হ্যান্ডস-অন উদাহরণ এবং বাস্তব-জগতের দৃশ্যপট
- **Comprehensive Coverage**: মৌলিক ধারণা থেকে উন্নত এন্টারপ্রাইজ প্যাটার্ন পর্যন্ত বিস্তৃত কভারেজ
- **Security-First Approach**: নিরাপত্তার সেরা অনুশীলন সমগ্রকালে ইন্টিগ্রেটেড
- **Cost Optimization**: খরচ-কার্যকর ডিপ্লয়মেন্ট এবং রিসোর্স ম্যানেজমেন্টের নির্দেশিকা

#### Documentation Quality
- **Detailed Code Examples**: ব্যবহারিক, পরীক্ষা করা কোড স্যাম্পল
- **Step-by-Step Instructions**: স্পষ্ট, কার্যকর নির্দেশিকা
- **Comprehensive Error Handling**: সাধারণ সমস্যার জন্য ট্রাবলশুটিং
- **Best Practices Integration**: ইন্ডাস্ট্রি স্ট্যান্ডার্ড এবং সুপারিশসমূহ
- **Version Compatibility**: সর্বশেষ Azure সার্ভিস এবং azd ফিচারের সাথে আপ-টু-ডেট

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Integration patterns for Hugging Face, Azure Machine Learning, and custom models
- **AI Agent Frameworks**: Templates for LangChain, Semantic Kernel, and AutoGen deployments
- **Advanced RAG Patterns**: Vector database options beyond Azure AI Search (Pinecone, Weaviate, etc.)
- **AI Observability**: Enhanced monitoring for model performance, token usage, and response quality

#### ডেভেলপার অভিজ্ঞতা
- **VS Code Extension**: Integrated AZD + Microsoft Foundry development experience
- **GitHub Copilot Integration**: AI-assisted AZD template generation
- **Interactive Tutorials**: Hands-on coding exercises with automated validation for AI scenarios
- **Video Content**: Supplementary video tutorials for visual learners focusing on AI deployments

### সংস্করণ 4.0.0 (পরিকল্পিত)
#### এন্টারপ্রাইজ AI প্যাটার্নসমূহ
- **Governance Framework**: AI model governance, compliance, and audit trails
- **Multi-Tenant AI**: Patterns for serving multiple customers with isolated AI services
- **Edge AI Deployment**: Integration with Azure IoT Edge and container instances
- **Hybrid Cloud AI**: Multi-cloud and hybrid deployment patterns for AI workloads

#### উন্নত ফিচারসমূহ
- **AI Pipeline Automation**: MLOps integration with Azure Machine Learning pipelines
- **Advanced Security**: Zero-trust patterns, private endpoints, and advanced threat protection
- **Performance Optimization**: Advanced tuning and scaling strategies for high-throughput AI applications
- **Global Distribution**: Content delivery and edge caching patterns for AI applications

### সংস্করণ 3.0.0 (পরিকল্পিত) - বর্তমান রিলিজ দ্বারা প্রতিস্থাপিত
#### প্রস্তাবিত সংযোজন - এখন v3.0.0-এ বাস্তবায়িত
- ✅ **AI-Focused Content**: Comprehensive Microsoft Foundry integration (সম্পন্ন)
- ✅ **Interactive Tutorials**: Hands-on AI workshop lab (সম্পন্ন)
- ✅ **Advanced Security Module**: AI-specific security patterns (সম্পন্ন)
- ✅ **Performance Optimization**: AI workload tuning strategies (সম্পন্ন)

### সংস্করণ 2.1.0 (পরিকল্পিত) - আংশিকভাবে v3.0.0-এ বাস্তবায়িত
#### ছোটখাটো উন্নতি - বর্তমান রিলিজে কিছু সম্পন্ন
- ✅ **Additional Examples**: AI-focused deployment scenarios (সম্পন্ন)
- ✅ **Extended FAQ**: AI-specific questions and troubleshooting (সম্পন্ন)
- **Tool Integration**: Enhanced IDE and editor integration guides
- ✅ **Monitoring Expansion**: AI-specific monitoring and alerting patterns (সম্পন্ন)

#### ভবিষ্যত রিলিজের জন্য এখনও পরিকল্পিত
- **Mobile-Friendly Documentation**: Responsive design for mobile learning
- **Offline Access**: Downloadable documentation packages
- **Enhanced IDE Integration**: VS Code extension for AZD + AI workflows
- **Community Dashboard**: Real-time community metrics and contribution tracking

## চেঞ্জলগে অবদান রাখা

### পরিবর্তন রিপোর্ট করা
এই রিপোজিটরিতে অবদান রাখার সময়, দয়া করে নিশ্চিত করুন যে চেঞ্জলগ এন্ট্রিগুলোতে নিম্নলিখিত অন্তর্ভুক্ত রয়েছে:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

### পরিবর্তন বিভাগসমূহ

#### Added
- New features, documentation sections, or capabilities
- New examples, templates, or learning resources
- Additional tools, scripts, or utilities

#### Changed
- Modifications to existing functionality or documentation
- Updates to improve clarity or accuracy
- Restructuring of content or organization

#### Deprecated
- Features or approaches that are being phased out
- Documentation sections scheduled for removal
- Methods that have better alternatives

#### Removed
- Features, documentation, or examples that are no longer relevant
- Outdated information or deprecated approaches
- Redundant or consolidated content

#### Fixed
- Corrections to errors in documentation or code
- Resolution of reported issues or problems
- Improvements to accuracy or functionality

#### Security
- Security-related improvements or fixes
- Updates to security best practices
- Resolution of security vulnerabilities

### সেমান্টিক ভার্শনিং নির্দেশিকা

#### Major Version (X.0.0)
- Breaking changes that require user action
- Significant restructuring of content or organization
- Changes that alter the fundamental approach or methodology

#### Minor Version (X.Y.0)
- New features or content additions
- Enhancements that maintain backward compatibility
- Additional examples, tools, or resources

#### Patch Version (X.Y.Z)
- Bug fixes and corrections
- Minor improvements to existing content
- Clarifications and small enhancements

## কমিউনিটি প্রতিক্রিয়া এবং পরামর্শ

আমরা এই লার্নিং রিসোর্স উন্নত করতে কমিউনিটির প্রতিক্রিয়া উৎসাহিত করি:

### কীভাবে প্রতিক্রিয়া দিন
- **GitHub Issues**: Report problems or suggest improvements (AI-specific issues welcome)
- **Discord Discussions**: Share ideas and engage with the Microsoft Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates and guides
- **Microsoft Foundry Discord**: Participate in #Azure channel for AZD + AI discussions
- **Community Forums**: Participate in broader Azure developer discussions

### প্রতিক্রিয়া বিভাগসমূহ
- **AI Content Accuracy**: Corrections to AI service integration and deployment information
- **Learning Experience**: Suggestions for improved AI developer learning flow
- **Missing AI Content**: Requests for additional AI templates, patterns, or examples
- **Accessibility**: Improvements for diverse learning needs
- **AI Tool Integration**: Suggestions for better AI development workflow integration
- **Production AI Patterns**: Enterprise AI deployment pattern requests

### প্রতিক্রিয়া প্রতিশ্রুতি
- **Issue Response**: Within 48 hours for reported problems
- **Feature Requests**: Evaluation within one week
- **Community Contributions**: Review within one week
- **Security Issues**: Immediate priority with expedited response

## রক্ষণাবেক্ষণ সূচি

### নিয়মিত আপডেট
- **Monthly Reviews**: Content accuracy and link validation
- **Quarterly Updates**: Major content additions and improvements
- **Semi-Annual Reviews**: Comprehensive restructuring and enhancement
- **Annual Releases**: Major version updates with significant improvements

### মনিটরিং এবং গুণগত নিশ্চয়তা
- **Automated Testing**: Regular validation of code examples and links
- **Community Feedback Integration**: Regular incorporation of user suggestions
- **Technology Updates**: Alignment with latest Azure services and azd releases
- **Accessibility Audits**: Regular review for inclusive design principles

## সংস্করণ সমর্থন নীতি

### বর্তমান সংস্করণ সমর্থন
- **Latest Major Version**: Full support with regular updates
- **Previous Major Version**: Security updates and critical fixes for 12 months
- **Legacy Versions**: Community support only, no official updates

### মাইগ্রেশন নির্দেশিকা
যখন মেজর সংস্করণ প্রকাশ করা হয়, আমরা প্রদান করি:
- **Migration Guides**: Step-by-step transition instructions
- **Compatibility Notes**: Details about breaking changes
- **Tool Support**: Scripts or utilities to assist with migration
- **Community Support**: Dedicated forums for migration questions

---

**Navigation**
- **Previous Lesson**: [পরীক্ষা নির্দেশিকা](resources/study-guide.md)
- **Next Lesson**: Return to [মূল README](README.md)

**আপডেট থাকুন**: Watch this repository for notifications about new releases and important updates to the learning materials.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
দায়বদ্ধতা:
এই নথিটি AI অনুবাদ সেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতা বজায় রাখার চেষ্টা করি; তবুও অনুগ্রহ করে জানুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিকেই কর্তৃত্বপ্রাপ্ত উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদকেই সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ব্যাখ্যার ত্রুটির জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->