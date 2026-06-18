# চেঞ্জলগ - AZD ফর বিগিনার্স

## ভূমিকা

এই চেঞ্জলগটি AZD For Beginners রিপোজিটরিতে সকল উল্লেখযোগ্য পরিবর্তন, আপডেট এবং উন্নতির নথিভুক্ত করে। আমরা সেমান্টিক ভার্সনিং নীতিগুলি অনুসরণ করি এবং ব্যবহারকারীরা সংস্করণগুলোর মধ্যে কী পরিবর্তিত হয়েছে তা বোঝার জন্য এই লগটি বজায় রাখি।

## শিখনের লক্ষ্য

এই চেঞ্জলগ পর্যালোচনা করে আপনি:
- নতুন ফিচার এবং কনটেন্ট সংযোজন সম্পর্কে ενηত থাকবেন
- বিদ্যমান ডকুমেন্টেশনগুলিতে করা উন্নতিগুলি বুঝতে পারবেন
- সঠিকতা নিশ্চিত করার জন্য বাগ ফিক্স এবং সংশোধনগুলি ট্র্যাক করতে পারবেন
- শেখার উপকরণগুলির সময়কালীন বিবর্তন অনুসরণ করতে পারবেন

## শেখার ফলাফল

চেঞ্জলগ এন্ট্রিগুলি পর্যালোচনা করার পরে আপনি সক্ষম হবেন:
- শেখার জন্য উপলব্ধ নতুন কনটেন্ট এবং রিসোর্স চিহ্নিত করতে
- কোন সেকশনগুলো আপডেট বা উন্নত করা হয়েছে তা বোঝতে
- সবচেয়ে সাম্প্রতিক উপকরণগুলোর ভিত্তিতে আপনার শেখার পথ পরিকল্পনা করতে
- ভবিষ্যত উন্নতির জন্য প্রতিক্রিয়া এবং সুপারিশ পাঠাতে

## ভার্সন ইতিহাস

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**এই ভার্সনটি azd-coverage বিশ্লেষণে উত্থাপিত বাকি ইন্টারমিডিয়েট ফাঁকগুলো বন্ধ করে: কিভাবে আপনার নিজস্ব টেমপ্লেট লেখেন এবং প্রকাশ করেন, পুনরুত্পাদনযোগ্য dev-container/Codespaces পরিবেশ, Pulumi ইন্ফ্রাস্ট্রাকচার প্রোভাইডার, একটি Azure DevOps CI/CD ওয়াকথ্রু, সার্ভিস-প্রিন্সিপাল অথেনটিকেশন, হোস্ট-নির্বাচন নির্দেশিকা (AKS/Spring Apps), `azd restore`/`azd package` ব্যাখ্যাগুলি, হুক ত্রুটি-হ্যান্ডলিং, এবং টিম/শেয়ার্ড-পরিবেশ অনুশীলন।**

#### যোগ করা হয়েছে
- **🧱 নতুন অধ্যায় 4 লেসন** `docs/chapter-04-infrastructure/custom-templates.md` — আপনার নিজস্ব azd টেমপ্লেট রচনা: প্রয়োজনীয় কাঠামো (`azure.yaml`, `infra/`, `src/`), `metadata.template` ফিল্ড, ইনফ্রাস্ট্রাকচারকে `uniqueString()` রিসোর্স টোকেন এবং `azd-env-name` ট্যাগ দিয়ে প্যারামিটারাইজ করা, লোকালি পরীক্ষা করা `azd init --template <local-path>` দিয়ে, GitHub-এ প্রকাশ করা, এবং Awesome AZD গ্যালারিতে সাবমিট করা
- **📦 নতুন অধ্যায় 1 লেসন** `docs/chapter-01-foundation/dev-containers.md` — Dev Containers এবং GitHub Codespaces দিয়ে পুনরুত্পাদনযোগ্য azd পরিবেশ: একটি ন্যূনতম `.devcontainer/devcontainer.json` যা অফিসিয়াল `ghcr.io/azure/azure-dev/azd` ফিচার ব্যবহার করে, ভাষা-নির্দিষ্ট ফিচার, কন্টেইনার হোস্টগুলির জন্য `docker-in-docker`, এবং রিমোট সাইন-ইনের জন্য `azd auth login --use-device-code`
- **🧩 Pulumi with azd** বিভাগ `docs/chapter-04-infrastructure/provisioning.md` এ — `infra.provider: pulumi`, Pulumi ফোল্ডার লেআউট, স্ট্যাকগুলোকে azd এনভায়রনমেন্টের সাথে ম্যাপ করা, প্রয়োজনীয় আউটপুট/ট্যাগিং, এবং একই `azd up` / `azd down` ওয়ার্কফ্লো
- **🎯 হোস্ট-নির্বাচন নির্দেশিকা** `docs/chapter-04-infrastructure/provisioning.md` এ — `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, এবং `springapp` এর একটি বিগিনার-বন্ধুসুলভ তুলনা, এবং কখন AKS বা Azure Spring Apps নির্বাচন করা উচিৎ সে সম্পর্কে নির্দেশনা
- **🛠️ Azure DevOps CI/CD ওয়াকথ্রু** `docs/chapter-08-production/production-ai-practices.md` এ — `azd pipeline config --provider azdo`, workload identity federation (OIDC) সহ সার্ভিস কানেকশন, জেনারেট করা `azure-dev.yml`, এবং ভেরিয়েবল-গ্রুপ সেটআপ
- **🔑 সার্ভিস প্রিন্সিপালস (Pattern 4)** যোগ করা হয়েছে `docs/chapter-03-configuration/authsecurity.md` এ — `az ad sp create-for-rbac`, নন-ইন্টারেক্টিভ `azd auth login` ক্লায়েন্ট সিক্রেট বনাম ফেডারেটেড/OIDC ক্রেডেনশিয়ালস ব্যবহার করে, কখন ব্যবহার করবেন, এবং নিরাপদ ক্রেডেনশিয়াল স্টোরেজ
- **🪝 হুক ত্রুটি-হ্যান্ডলিং** উপবিভাগ `docs/chapter-04-infrastructure/deployment-guide.md` এ — এক্সিট কোড এবং `set -e`, `continueOnError`, `azd hooks run` দিয়ে হুকগুলো আলাদাভাবে পরীক্ষা করা, OS-নির্দিষ্ট শেল, এবং `--debug`
- **👥 টিম / শেয়ার্ড পরিবেশ** সেকশন `docs/chapter-03-configuration/configuration.md` এ — `.azure/` এ কী থাকে, কী gitignore করবেন, per-developer এনভায়রনমেন্ট, `azd env list`/`select`, এবং CI/CD-তে এনভায়রনমেন্ট ভ্যালু প্রদান করা
- **🧰 `azd restore` এবং বিস্তৃত `azd package`** ব্যাখ্যা যোগ করা হয়েছে `resources/cheat-sheet.md` এ — ডিপেনডেন্সি রিস্টোর করা এবং ডিপ্লয় না করে একটি deployable আর্টিফ্যাক্ট তৈরি করা

#### পরিবর্তিত
- **🧭 অধ্যায় 4 লেসন টেবিল** নতুন "Authoring Your Own Template" লেসন (Lesson 3) অন্তর্ভুক্ত করার জন্য হালনাগাদকৃত
- **🧭 অধ্যায় 1 লেসন টেবিল** নতুন "Dev Containers & Codespaces" লেসন (Lesson 5) অন্তর্ভুক্ত করার জন্য হালনাগাদকৃত; `bring-your-own-app.md` এবং `dev-containers.md` এর মধ্যে নেভিগেশন ফুটার সংযুক্ত করা হয়েছে

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**এই ভার্সনটি সম্পূর্ণ বিগিনার গাইডের জন্য সবচেয়ে বড় ফাঁকগুলো বন্ধ করে দুটি নতুন হ্যান্ডস-অন লেসন (একটি ডিপ্লয়েবল মাল্টি-এজেন্ট ওয়াকথ্রু এবং বিদ্যমান অ্যাপে azd যোগ করা), একজন বিগিনারের জন্য হুক পরিচিতি, azd সহ Terraform অংশ, ধাপে ধাপে GitHub Actions পাইপলাইন ওয়াকথ্রু, নতুন প্রিভিউ এক্সটেনশনের ব্যাখ্যাকারী, এবং একটি স্পষ্ট ডিপ্লয়মেন্ট-ভেরিফিকেশন চেকলিস্ট যোগ করে।**

#### যোগ করা হয়েছে
- **🤝 নতুন অধ্যায় 5 লেসন** `docs/chapter-05-multi-agent/multi-agent-basics.md` — একটি সম্পূর্ণ হ্যান্ডস-অন, ডিপ্লয়েবল দুই-এজেন্ট ওয়াকথ্রু (orchestrator + specialists) একটি বাস্তব টেমপ্লেট (`contoso-creative-writer`) ব্যবহার করে, কখন মাল্টি-এজেন্ট ব্যবহার করবেন, `azd up` ওয়ার্কফ্লো, ডিপ্লয় করা রিসোর্সগুলো বোঝা, ক্রস-এজেন্ট ট্রেসিং, কাস্টমাইজেশন, এবং ক্লিনআপ কভার করে
- **📦 নতুন অধ্যায় 1 লেসন** `docs/chapter-01-foundation/bring-your-own-app.md` — কিভাবে বিদ্যমান প্রজেক্টে azd যুক্ত করবেন `azd init` ("use code in the current directory") দিয়ে, `azure.yaml` এবং `infra/` বোঝা, `azd infra generate`, হোস্ট ডিটেকশন, এবং `azd up` দিয়ে ডিপ্লয় করা
- **🌐 Terraform with azd** সেকশন যোগ করা হয়েছে `docs/chapter-04-infrastructure/provisioning.md` এ — `infra.provider: terraform` কনফিগ, `.tf` ফোল্ডার লেআউট, প্রয়োজনীয় `AZURE_*` আউটপুট এবং `azd-env-name` ট্যাগিং, এবং একই `azd up` / `azd down` ওয়ার্কফ্লো (এই ফাঁক বন্ধ করে যেখানে Terraform সাপোর্ট দাবি করা হয়েছিল কিন্তু কেবল Bicep দেখানো হয়েছিল)
- **⚙️ ধাপে ধাপে GitHub Actions ওয়াকথ্রু** `docs/chapter-08-production/production-ai-practices.md` এ — GitHub রিপো থেকে স্বয়ংক্রিয় ডিপ্লয় পর্যন্ত: `azd pipeline config`, OIDC ফেডারেটেড ক্রেডেনশিয়ালস (কোন সঞ্চিত সিক্রেট নয়), জেনারেট করা `azure-dev.yml`, এবং সিক্রেট বনাম ভেরিয়েবল নির্দেশিকা
- **🪝 বিগিনার "New to hooks?" পরিচিতি** `docs/chapter-04-infrastructure/deployment-guide.md` এ — হুক কী, হুক-স্টেজ টেবিল, একটি ন্যূনতম প্রথম হুক, এবং `azd hooks run` দিয়ে হুক ম্যানুয়ালি চালানোর উপায়
- **✅ "Verify Your Deployment" চেকলিস্ট** `docs/chapter-01-foundation/first-project.md` এর Step 5-এ যোগ করা হয়েছে — স্মোক টেস্ট, হেলথ-এন্ডপয়েন্ট চেক, এবং স্পষ্ট সফলতার ক্রাইটেরিয়া
- **🧩 নতুন প্রিভিউ এক্সটেনশনের ব্যাখ্যাকারী** `azure.ai.skills` এবং `azure.ai.connections` (এগুলো কী এবং কখন ব্যবহার করবেন) `docs/chapter-08-production/production-ai-practices.md` এ

#### পরিবর্তিত
- **🧭 অধ্যায় 5 লেসন টেবিল** সংশোধিত: `multi-agent-basics.md` এখন Lesson 1 (এটি একমাত্র সম্পূর্ণ হ্যান্ডস-অন লেসন), with সততার সাথে লেবেল করা হয়েছে যে Lesson 2 অধ্যায় 6-এ রয়েছে এবং রিটেইল সিনারিও একটি আর্কিটেকচার ব্লুপ্রিন্ট, একটি এক-কমান্ড টেমপ্লেট নয়
- **🧭 অধ্যায় 1 লেসন টেবিল** এখন নতুন "Bring Your Own App" লেসন (Lesson 4) অন্তর্ভুক্ত করে
- **🔗 নেভিগেশন ফুটার** হালনাগাদকৃত: `first-project.md` এখন `bring-your-own-app.md` এর দিকে লিংক করে

#### ঠিক করা হয়েছে
- **🧱 "দাবি করা কিন্তু অনুপস্থিত" Terraform ফাঁক বন্ধ করা হয়েছে** — কোর্সটি পূর্বে Terraform সাপোর্ট উল্লেখ করেছিল কিন্তু দেখায়নি
- **🔀 অধ্যায় 5-এর বিভ্রান্তিকর ক্রস-লিঙ্কগুলি সংশোধন করা হয়েছে** যা বোঝাত যে একটি পূর্ণ মাল্টি-এজেন্ট বাস্তবায়ন ছিল যেখানে কেবল একটি আর্কিটেকচার ব্লুপ্রিন্টই ছিল

#### আপডেট করা ফাইলসমূহ
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(new)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(new)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**এই ভার্সনটি কোর্সটিকে `azd` `1.25.6` (জুন 2026) এবং `azure.ai.agents` `0.1.40-preview` এক্সটেনশনের বিরুদ্ধে পুনরায় মান্যতায় আনে, AI নির্দেশনাকে "একটি এজেন্ট scaffold করা" থেকে সম্পূর্ণ এজেন্ট লাইফসাইকেল (test → evaluate → optimize → inspect → delete) পর্যন্ত সম্প্রসারিত করে, নতুন `azure.ai.skills` এবং `azure.ai.connections` প্রিভিউ এক্সটেনশনগুলো সামনে আনে, এবং ".NET Aspire" → "Aspire" প্রোডাক্ট রিব্র্যান্ডটি নোট করে।**

#### যোগ করা হয়েছে
- **🔁 পূর্ণ এজেন্ট লাইফসাইকেল কভারেজ** বিগিনার এবং AI ইঞ্জিনিয়ারদের জন্য ডকস জুড়ে:
  - `docs/chapter-01-foundation/azd-basics.md` — লাইফসাইকেল টেবিল (scaffold → test → measure → improve → inspect → clean up) Extensions এবং AI Commands সেকশনে যোগ করা হয়েছে
  - `docs/chapter-08-production/production-ai-practices.md` — "Managing the Agent Lifecycle" নতুন সেকশন যা `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, এবং `delete --force` কভার করে
  - `resources/cheat-sheet.md` — AI Agent Commands সম্প্রসারিত হয়েছে `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, এবং `delete --force` সহ
- **🧩 নতুন প্রিভিউ এক্সটেনশনসমূহ** ডকুমেন্টেড: `azure.ai.skills` (পুনঃব্যবহারযোগ্য এজেন্ট স্কিল) এবং `azure.ai.connections` (Foundry connections) এক্সটেনশন টেবিলে এবং চিট শীটে যোগ করা হয়েছে
- **⏱️ রেসপন্স-টাইমিং নির্দেশিকা** — `azd ai agent invoke` উদাহরণগুলো এখন মোট লেটেন্সি এবং টাইম-টু-ফার্স্ট-বাইট প্রিন্ট করে তা নির্দেশ করে
- **📌 ভার্সন ব্যানার** রুট README-তে যোগ করা হয়েছে যেটি শিক্ষার্থীদের `azd version` এবং `azd upgrade` দেখায়

#### পরিবর্তিত
- **✅ ভ্যালিডেশন বেসলাইন হালনাগাদ করা হয়েছে** `azd 1.23.12` (মার্চ 2026) থেকে `azd 1.25.6` (জুন 2026) এ সব অধ্যায়ের README এবং ওয়ার্কশপ ডকস জুড়ে
- **🤖 অধ্যায় 2 এক্সটেনশন নোট** `azure.ai.agents` `0.1.18-preview` থেকে `0.1.40-preview` এ হালনাগাদ করা হয়েছে
- **🧪 ওয়ার্কশপ ভ্যালিডেশন উদাহরণ** (`azd version` আউটপুট) `1.25.6` এ আপডেট করা হয়েছে
- **🧭 README "What's New in azd Today"** রিফ্রেশ করা হয়েছে এন্ড-টু-এন্ড এজেন্ট লাইফসাইকেল, নতুন AI এক্সটেনশন এবং সাম্প্রতিক কিউঅলিটি-অফ-লাইফ ফিক্সেস (`azd init` idempotency, `azd auth login` stale-token clearing, `azd tool` first-run prompt) হাইলাইট করার জন্য
- **📖 অধ্যায় 2 agents.md (Option 4)** এখন শিক্ষার্থীদের পোস্ট-ডিপ্লয় লাইফসাইকেল কমান্ডগুলোর দিকে নির্দেশ করে `azd up` এ থামার পরিবর্তে

#### ঠিক করা হয়েছে
- **🏷️ প্রোডাক্ট নামকরণ** — Aspire রিব্র্যান্ড নোট যোগ করা হয়েছে (".NET Aspire" এখন শুধুই "Aspire"); azd-র Aspire সাপোর্ট অপরিবর্তিত
- **🔎 লাইভ রিলিজ ভ্যালিডেশন** Azure Developer CLI রিলিজ ফিডের বিরুদ্ধে নিশ্চিত করা হয়েছে: স্টেবল CLI `1.25.6` (2026-06-12) এবং `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### আপডেট করা ফাইলসমূহ
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27
#### Beginner Onboarding Clarification, Setup Validation & Final AZD Command Cleanup
**এই সংস্করণটি AZD 1.23 ভ্যালিডেশন সুইপের পর শুরু করা শিক্ষানবীষ-কেন্দ্রিক ডকুমেন্টেশন পাসটি অনুসরণ করে: এটি AZD-প্রথম প্রমাণীকরণ নির্দেশনাকে স্পষ্ট করে, লোকাল সেটআপ ভ্যালিডেশন স্ক্রিপ্ট যোগ করে, লাইভ AZD CLI-এর বিরুদ্ধে মূল কমান্ডগুলি যাচাই করে, এবং চেঞ্জলগ ছাড়া অবশিষ্ট ইংরেজি-মূল কমান্ড রেফারেন্সগুলি সরিয়ে দেয়।**

#### Added
- **🧪 Beginner setup validation scripts** `validate-setup.ps1` এবং `validate-setup.sh` সহ যাতে শিক্ষানবীষরা Chapter 1 শুরু করার আগে প্রয়োজনীয় টুলগুলি নিশ্চিত করতে পারে
- **✅ Upfront setup validation steps** রুট README এবং Chapter 1 README-তে যাতে অনুপস্থিত পূর্বশর্তগুলো `azd up` করার আগে ধরা পড়ে

#### Changed
- **🔐 Beginner authentication guidance** এখন ধারাবাহিকভাবে `azd auth login`-কে AZD ওয়ার্কফ্লোর প্রধান পথ হিসেবে বিবেচনা করে, যখন `az login` শুধুমাত্র ঐচ্ছিকভাবে উল্লেখ করা হয়েছে যদি সরাসরি Azure CLI কমান্ড ব্যবহার করা হয়
- **📚 Chapter 1 onboarding flow** এখন শিক্ষানবীষদের ইনস্টলেশন, প্রমাণীকরণ, এবং প্রথম ডেপ্লয়মেন্ট ধাপগুলির আগে তাদের লোকাল সেটআপ ভ্যালিডেট করতে নির্দেশ দেয়
- **🛠️ Validator messaging** এখন AZD-শুধু শিক্ষানবীষ পথে বাধাপ্রাপ্ত প্রয়োজনীয়তাগুলোকে Azure CLI সতর্কবার্তা থেকে স্পষ্টভাবে আলাদা করে
- **📖 Configuration, troubleshooting, and example docs** এখন প্রয়োজনীয় AZD প্রমাণীকরণ এবং ঐচ্ছিক Azure CLI সাইন-ইনের মধ্যে পার্থক্য করে যেখানে পূর্বে উভয়ই প্রসঙ্গ ছাড়াই উপস্থাপিত ছিল

#### Fixed
- **📋 Remaining English-source command references** আপডেট করে বর্তমান AZD ফর্মে, যেমন cheat sheet-এ `azd config show` এবং যেখানে Azure Portal ওভারভিউ নির্দেশ ছিল সেখানে `azd monitor --overview`
- **🧭 Beginner claims in Chapter 1** শিথিল করা হয়েছে যাতে সব টেমপ্লেট এবং Azure রিসোর্স জুড়েই শূন্য-ত্রুটি বা রোলব্যাক গ্যারান্টি দেওয়া হচ্ছে বলে অতিরঞ্জনা না করা হয়
- **🔎 Live CLI validation** নিশ্চিত করেছে যে `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, এবং `azd down --force --purge` বর্তমানে সমর্থিত

#### Files Updated
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### AZD 1.23.12 Validation, Workshop Environment Expansion & AI Model Refresh
**এই সংস্করণটি `azd` `1.23.12`-এর বিরুদ্ধে ডকুমেন্টেশন ভ্যালিডেশন সুইপ করে, পুরনো AZD কমান্ড উদাহরণগুলো আপডেট করে, AI মডেল নির্দেশনাগুলোকে বর্তমান ডিফল্টে রিফ্রেশ করে, এবং কর্মশালা নির্দেশনাগুলোকে শুধুমাত্র GitHub Codespaces সীমাবদ্ধ না রেখে dev container এবং লোকাল ক্লোনকেও সমর্থন করে বিস্তৃত করে।**

#### Added
- **✅ Validation notes across core chapters and workshop docs** যাতে পরীক্ষিত AZD বেসলাইন শিক্ষানবীষদের জন্য স্পষ্ট থাকে যারা নতুন বা পুরনো CLI বিল্ড ব্যবহার করছেন
- **⏱️ Deployment timeout guidance** দীর্ঘকাল চলা AI অ্যাপ ডেপ্লয়মেন্টগুলোর জন্য `azd deploy --timeout 1800`
- **🔎 Extension inspection steps** AI ওয়ার্কফ্লো ডকসে `azd extension show azure.ai.agents` সহ
- **🌐 Broader workshop environment guidance** GitHub Codespaces, dev containers, এবং MkDocs সহ লোকাল ক্লোন কভার করে

#### Changed
- **📚 Chapter intro READMEs** এখন ধারাবাহিকভাবে foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting, এবং production সেকশনগুলোতে `azd 1.23.12`-এর বিরুদ্ধে ভ্যালিডেশন উল্লেখ করে
- **🛠️ AZD command references** ডকস জুড়ে বর্তমান ফর্মে আপডেট করা হয়েছে:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` বা প্রসঙ্গে নির্ভর করে `azd env get-value(s)`
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → যেখানে Application Insights ওভারভিউ ইঙ্গিত করা হয় সেখানে `azd monitor --overview`
- **🧪 Provision preview examples** বর্তমান সমর্থিত ব্যবহারের মতো সরলীকৃত, যেমন `azd provision --preview` এবং `azd provision --preview -e production`
- **🧭 Workshop flow** আপডেট করা হয়েছে যাতে শিক্ষানবীষরা Codespaces, একটি dev container, বা লোকাল ক্লোনে ল্যাবগুলো সম্পন্ন করতে পারে, কেবল Codespaces-ই নয়
- **🔐 Authentication guidance** এখন AZD ওয়ার্কফ্লোর জন্য `azd auth login`-কে প্রাধান্য দেয়, যখন সরাসরি Azure CLI কমান্ড ব্যবহার করলে `az login` ঐচ্ছিক হিসেবে রাখা হয়েছে

#### Fixed
- **🪟 Windows install commands** ইনস্টলেশন গাইডে বর্তমান `winget` প্যাকেজ কেসিং অনুযায়ী সাধারণীকরণ করা হয়েছে
- **🐧 Linux install guidance** ডিস্ট্রো-নির্দিষ্ট অসমর্থিত `azd` প্যাকেজ ম্যানেজার নির্দেশগুলি এড়িয়ে সঠিক রিলিজ অ্যাসেটগুলো দেখানোর জন্য সংশোধন করা হয়েছে
- **📦 AI model examples** পুরনো ডিফল্টগুলোর থেকে রিফ্রেশ করা হয়েছে, যেমন `gpt-35-turbo` এবং `text-embedding-ada-002` থেকে বর্তমান উদাহরণগুলো `gpt-4.1-mini`, `gpt-4.1`, এবং `text-embedding-3-large`-এ
- **📋 Deployment and diagnostics snippets** লগ, স্ক্রিপ্ট, এবং ট্রাবলশুটিং ধাপগুলিতে বর্তমান এনভায়রনমেন্ট ও স্ট্যাটাস কমান্ড ব্যবহার করার জন্য সংশোধিত
- **⚙️ GitHub Actions guidance** `Azure/setup-azd@v1.0.0` থেকে `Azure/setup-azd@v2`-এ আপডেট করা হয়েছে
- **🤖 MCP/Copilot consent guidance** `azd mcp consent` থেকে `azd copilot consent list`-এ আপডেট করা হয়েছে

#### Improved
- **🧠 AI chapter guidance** এখন প্রিভিউ-সংবেদনশীল `azd ai` আচরণ, টেন্যান্ট-নির্দিষ্ট লগইন, বর্তমান এক্সটেনশন ব্যবহার, এবং আপডেটেড মডেল ডেপ্লয়মেন্ট সুপারিশগুলো ভালভাবে ব্যাখ্যা করে
- **🧪 Workshop instructions** এখন আরও বাস্তবসম্মত ভার্সন উদাহরণ এবং হ্যান্ডস-অন ল্যাবের জন্য পরিষ্কার এনভায়রনমেন্ট সেটআপ ভাষ্য ব্যবহার করে
- **📈 Production and troubleshooting docs** এখন বর্তমান মনিটরিং, ফলব্যাক মডেল, এবং কস্ট-টিয়ার উদাহরণগুলোর সাথে ভালভাবে মানানসই

#### Files Updated
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### AZD AI CLI Commands, Content Validation & Template Expansion
**এই সংস্করণটি `azd ai`, `azd extension`, এবং `azd mcp` কমান্ড কভারেজ সব AI-সম্পর্কিত অধ্যায় জুড়ে যোগ করে, agents.md-এ ভাঙ্গা লিংক এবং ডিপ্রিকেটেড কোড ঠিক করে, cheat sheet আপডেট করে, এবং Example Templates সেকশনকে যাচাইকৃত বিবরণ এবং নতুন Azure AI AZD টেমপ্লেট সহ পুনর্গঠন করে।**

#### Added
- **🤖 AZD AI CLI coverage** 7 ফাইল জুড়ে (পূর্বে শুধু Chapter 8-এ ছিল):
  - `docs/chapter-01-foundation/azd-basics.md` — নতুন "Extensions and AI Commands" সেকশন যা `azd extension`, `azd ai agent init`, এবং `azd mcp` পরিচয় করায়
  - `docs/chapter-02-ai-development/agents.md` — বিকল্প 4: `azd ai agent init` টেমপ্লেট বনাম ম্যানিফেস্ট পদ্ধতির তুলনাসূচক টেবিল সহ
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" এবং "Agent-First Deployment" উপবিভাগসমূহ
  - `docs/chapter-05-multi-agent/README.md` — Quick Start এখন টেমপ্লেট এবং ম্যানিফেস্ট-ভিত্তিক উভয় ডেপ্লয়মেন্ট পাথ দেখায়
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy অংশ এখন `azd ai agent init` অপশন অন্তর্ভুক্ত করে
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" উপবিভাগ
  - `resources/cheat-sheet.md` — নতুন "AI & Extensions Commands" সেকশন `azd extension`, `azd ai agent init`, `azd mcp`, এবং `azd infra generate` সহ
- **📦 New AZD AI example templates** `microsoft-foundry-integration.md`-এ:
  - **azure-search-openai-demo-csharp** — .NET RAG চ্যাট Blazor WebAssembly, Semantic Kernel, এবং ভয়েস চ্যাট সহ
  - **azure-search-openai-demo-java** — Java RAG চ্যাট Langchain4J ব্যবহার করে ACA/AKS ডেপ্লয়মেন্ট অপশন সহ
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding, এবং Prompty ব্যবহার করে মাল্টি-এজেন্ট ক্রিয়েটিভ রাইটিং অ্যাপ
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB ব্যবহার করে সার্ভারলেস RAG, Ollama লোকাল ডেভ সমর্থনসহ
  - **chat-with-your-data-solution-accelerator** — অ্যাডমিন পোর্টাল, Teams ইন্টিগ্রেশন, এবং PostgreSQL/Cosmos DB অপশনসহ এন্টারপ্রাইজ RAG অ্যাক্সেলারেটর
  - **azure-ai-travel-agents** — .NET, Python, Java, এবং TypeScript-এ সার্ভারসহ মাল্টি-এজেন্ট MCP অর্কেস্ট্রেশন রেফারেন্স অ্যাপ
  - **azd-ai-starter** — মিনিমাল Azure AI ইনফ্রা Bicep স্টার্টার টেমপ্লেট
  - **🔗 Awesome AZD AI Gallery link** — [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ টেমপ্লেট) রেফারেন্স

#### Fixed
- **🔗 agents.md navigation**: Previous/Next লিংকগুলো এখন Chapter 2 README লেসনের ক্রমের সাথে মেলে (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md broken links**: `production-ai-practices.md` ঠিক করে `../chapter-08-production/production-ai-practices.md` করা হয়েছে (3টি স্থানে)
- **📦 agents.md deprecated code**: `opencensus` কে `azure-monitor-opentelemetry` + OpenTelemetry SDK দিয়ে প্রতিস্থাপন করা হয়েছে
- **🐛 agents.md invalid API**: `max_tokens` কে `create_agent()` থেকে সরিয়ে `create_run()`-এ `max_completion_tokens` হিসেবে নেওয়া হয়েছে
- **🔢 agents.md token counting**: আনুমানিক `len//4` বদলে `tiktoken.encoding_for_model()` ব্যবহার করা হয়েছে
- **azure-search-openai-demo**: ডিফল্ট হোস্ট পরিবর্তনের (Oct 2024) পরে সার্ভিসগুলিকে "Cognitive Search + App Service" থেকে "Azure AI Search + Azure Container Apps" এ সংশোধন করা হয়েছে
- **contoso-chat**: বর্ণনা আপডেট করে Azure AI Foundry + Prompty উল্লেখ করা হয়েছে যাতে রেপোর প্রকৃত শিরোনাম ও টেক স্ট্যাক মেলে

#### Removed
- **ai-document-processing**: অকার্যকর টেমপ্লেট রেফারেন্সটি সরানো হয়েছে (রেপোটি AZD টেমপ্লেট হিসেবে প্রকাশ্যভাবে অ্যাক্সেসযোগ্য নয়)

#### Improved
- **📝 agents.md exercises**: Exercise 1 এখন প্রত্যাশিত আউটপুট এবং `azd monitor` ধাপ দেখায়; Exercise 2-তে পূর্ণ `FunctionTool` রেজিস্ট্রেশন কোড অন্তর্ভুক্ত; Exercise 3 অস্পষ্ট নির্দেশনার বদলে কনক্রিট `prepdocs.py` কমান্ড দেয়
- **📚 agents.md resources**: ডকুমেন্টেশন লিংকগুলোকে বর্তমান Azure AI Agent Service ডকস এবং কুইকস্টার্ট অনুযায়ী আপডেট করা হয়েছে
- **📋 agents.md Next Steps table**: সম্পূর্ণ অধ্যায় কভার করার জন্য AI Workshop Lab লিংক যোগ করা হয়েছে

#### Files Updated
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05
#### কোর্স নেভিগেশন উন্নতি
**এই সংস্করণটি README.md অধ্যায় নেভিগেশনকে উন্নত টেবিল বিন্যাসের মাধ্যমে উন্নত করে।**

#### পরিবর্তিত
- **কোর্স মানচিত্র টেবিল**: সরাসরি পাঠ লিঙ্ক, সময়কাল অনুমান, এবং জটিলতা রেটিং সহ উন্নত
- **ফোল্ডার ক্লিনআপ**: অতিরিক্ত পুরানো ফোল্ডারগুলি সরানো হয়েছে (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **লিঙ্ক যাচাই**: কোর্স মানচিত্র টেবিলে সমস্ত 21+ অভ্যন্তরীণ লিংক নিশ্চিত করা হয়েছে

### [v3.16.0] - 2026-02-05

#### পণ্য নাম আপডেট
**এই সংস্করণটি বর্তমান Microsoft ব্র্যান্ডিং অনুসারে পণ্যের রেফারেন্স আপডেট করে।**

#### পরিবর্তিত
- **Microsoft Foundry → Microsoft Foundry**: অনুবাদ-হীন ফাইল জুড়েই সব রেফারেন্স আপডেট করা হয়েছে
- **Azure AI Agent Service → Foundry Agents**: সার্ভিসের নাম বর্তমান ব্র্যান্ডিং প্রতিফলিত করতে আপডেট করা হয়েছে

#### ফাইল আপডেট করা হয়েছে
- `README.md` - Main course landing page
- `changelog.md` - Version history
- `course-outline.md` - Course structure
- `docs/chapter-02-ai-development/agents.md` - AI agents guide
- `examples/README.md` - Examples documentation
- `workshop/README.md` - Workshop landing page
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - All workshop instruction files

---

### [v3.15.0] - 2026-02-05

#### বড় রেপোজিটরি পুনর্গঠন: অধ্যায়-ভিত্তিক ফোল্ডার নাম
**এই সংস্করণটি পরিষ্কার নেভিগেশনের জন্য ডকুমেন্টেশনকে নিবেদিত অধ্যায় ফোল্ডারগুলিতে পুনর্গঠন করে।**

#### ফোল্ডার নাম পরিবর্তন
পুরানো ফোল্ডারগুলি অধ্যায়-সংখ্যাযুক্ত ফোল্ডার দিয়ে প্রতিস্থাপন করা হয়েছে:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

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
- **📚 অধ্যায় README ফাইলসমূহ**: প্রতিটি অধ্যায় ফোল্ডারে README.md তৈরি করা হয়েছে, যার মধ্যে রয়েছে:
  - শেখার লক্ষ্য এবং সময়কাল
  - বর্ণনাসহ পাঠ টেবিল
  - দ্রুত শুরু কমান্ড
  - অন্যান্য অধ্যায়ে নেভিগেশন

#### পরিবর্তিত
- **🔗 সমস্ত অভ্যন্তরীণ লিংক আপডেট করা হয়েছে**: 78+ পথ সমস্ত ডকুমেন্টেশন ফাইলে আপডেট করা হয়েছে
- **🗺️ Main README.md**: নতুন অধ্যায় কাঠামোসহ কোর্স মানচিত্র আপডেট করা হয়েছে
- **📝 examples/README.md**: অধ্যায় ফোল্ডারগুলোর ক্রস-রেফারেন্সগুলি আপডেট করা হয়েছে

#### অপসারণ করা হয়েছে
- পুরানো ফোল্ডার কাঠামো (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### রেপোজিটরি পুনর্গঠন: অধ্যায় নেভিগেশন
**এই সংস্করণটি অধ্যায় নেভিগেশন README ফাইল যোগ করেছে (v3.15.0 দ্বারা অপসিদ্ধ)।**

---

### [v3.13.0] - 2026-02-05

#### নতুন AI এজেন্ট গাইড
**এই সংস্করণটি Azure Developer CLI ব্যবহার করে AI এজেন্ট ডেপ্লয়মেন্টের জন্য একটি বিস্তৃত গাইড যোগ করে।**

#### যোগ করা হয়েছে
- **🤖 docs/microsoft-foundry/agents.md**: নিম্নলিখিত কভার করে একটি সম্পূর্ণ গাইড:
  - AI এজেন্ট কী এবং তারা কীভাবে চ্যাটবট থেকে ভিন্ন
  - তিনটি দ্রুত-শুরু এজেন্ট টেমপ্লেট (Foundry Agents, Prompty, RAG)
  - এজেন্ট আর্কিটেকচার প্যাটার্ন (একক এজেন্ট, RAG, মাল্টি-এজেন্ট)
  - টুল কনফিগারেশন এবং কাস্টমাইজেশন
  - মনিটরিং এবং মেট্রিক্স ট্র্যাকিং
  - ব্যয় সংক্রান্ত বিবেচ্য বিষয় এবং অপটিমাইজেশন
  - সাধারণ ট্ৰাবলশুটিং পরিস্থিতি
  - সফলতা নির্ধারণ সহ তিনটি হ্যান্ডস-অন অনুশীলন

#### বিষয়বস্তুর গঠন
- **পরিচিতি**: শিক্ষানবিসদের জন্য এজেন্ট ধারণা
- **দ্রুত শুরু**: `azd init --template get-started-with-ai-agents` ব্যবহার করে এজেন্ট ডেপ্লয় করুন
- **আর্কিটেকচার প্যাটার্ন**: এজেন্ট প্যাটার্নের ভিজ্যুয়াল ডায়াগ্রাম
- **কনফিগারেশন**: টুল সেটআপ এবং পরিবেশ ভেরিয়েবল
- **মনিটরিং**: Application Insights ইন্টিগ্রেশন
- **অনুশীলনসমূহ**: ধাপে ধাপে হ্যান্ডস-অন শেখা (প্রতিটি 20-45 মিনিট)

---

### [v3.12.0] - 2026-02-05

#### DevContainer পরিবেশ আপডেট
**এই সংস্করণটি AZD শেখার অভিজ্ঞতার জন্য আধুনিক টুল এবং উন্নত ডিফল্ট সহ ডেভেলপমেন্ট কন্টেইনার কনফিগারেশন আপডেট করে।**

#### পরিবর্তিত
- **🐳 বেস ইমেজ**: `python:3.12-bullseye` থেকে `python:3.12-bookworm`-এ আপডেট করা হয়েছে (সর্বশেষ Debian স্টেবল)
- **📛 কন্টেইনার নাম**: স্পষ্টতার জন্য "Python 3" থেকে "AZD for Beginners" এ নাম পরিবর্তন

#### যোগ করা হয়েছে
- **🔧 নতুন Dev Container বৈশিষ্ট্য**:
  - `azure-cli` Bicep সাপোর্ট সহ সক্রিয়
  - `node:20` (AZD টেমপ্লেটগুলোর জন্য LTS সংস্করণ)
  - `github-cli` টেমপ্লেট ম্যানেজমেন্টের জন্য
  - `docker-in-docker` কন্টেইনার অ্যাপ ডেপ্লয়মেন্টের জন্য

- **🔌 পোর্ট ফরওয়ার্ডিং**: সাধারণ ডেভেলপমেন্টের জন্য পূর্ব-নির্ধারিত পোর্টসমূহ:
  - 8000 (MkDocs প্রিভিউ)
  - 3000 (ওয়েব অ্যাপ)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 নতুন VS Code এক্সটেনশনসমূহ**:
  - `ms-python.vscode-pylance` - উন্নত Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions সাপোর্ট
  - `ms-azuretools.vscode-docker` - Docker সাপোর্ট
  - `ms-azuretools.vscode-bicep` - Bicep ভাষা সাপোর্ট
  - `ms-azure-devtools.azure-resource-groups` - Azure রিসোর্স ম্যানেজমেন্ট
  - `yzhang.markdown-all-in-one` - Markdown সম্পাদনা
  - `DavidAnson.vscode-markdownlint` - Markdown লিন্টিং
  - `bierner.markdown-mermaid` - Mermaid ডায়াগ্রাম সাপোর্ট
  - `redhat.vscode-yaml` - YAML সাপোর্ট (azure.yaml-এর জন্য)
  - `eamodio.gitlens` - Git ভিজ্যুয়ালাইজেশন
  - `mhutchie.git-graph` - Git ইতিহাস

- **⚙️ VS Code সেটিংস**: Python interpreter, format on save, এবং whitespace trimming-এর জন্য ডিফল্ট সেটিংস যোগ করা হয়েছে

- **📦 Updated requirements-dev.txt**:
  - MkDocs minify প্লাগইন যোগ করা হয়েছে
  - কোড কোয়ালিটির জন্য pre-commit যোগ করা হয়েছে
  - Azure SDK প্যাকেজসমূহ যোগ করা হয়েছে (azure-identity, azure-mgmt-resource)

#### ঠিক করা হয়েছে
- **Post-Create Command**: কন্টেইনার স্টার্টে এখন AZD এবং Azure CLI ইনস্টলেশন যাচাই করে

---

### [v3.11.0] - 2026-02-05

#### শিক্ষানবিস-সুবিধাজনক README পুনর্গঠন
**এই সংস্করণটি README.md-কে শিক্ষানবিসদের জন্য অনেক বেশি অ্যাক্সেসযোগ্য করে তোলে এবং AI ডেভেলপারদের জন্য প্রয়োজনীয় রিসোর্স যোগ করে।**

#### যোগ করা হয়েছে
- **🆚 Azure CLI বনাম AZD তুলনা**: কখন কোন টুল ব্যবহার করবেন তা স্পষ্টভাবে উদাহরণসহ ব্যাখ্যা
- **🌟 Awesome AZD লিংকসমূহ**: কমিউনিটি টেমপ্লেট গ্যালারি এবং কনট্রিবিউশন রিসোর্সের সরাসরি লিংক:
  - [অসাধারণ AZD গ্যালারি](https://azure.github.io/awesome-azd/) - 200+ রেডি-টু-ডেপ্লয় টেমপ্লেট
  - [টেমপ্লেট জমা করুন](https://github.com/Azure/awesome-azd/issues) - কমিউনিটি কনট্রিবিউশন
- **🎯 দ্রুত শুরু গাইড**: সরলীকৃত 3-ধাপের গেটিং স্টার্ট সেকশন (Install → Login → Deploy)
- **📊 অভিজ্ঞতা-ভিত্তিক নেভিগেশন টেবিল**: ডেভেলপারের অভিজ্ঞতা অনুযায়ী কোথা থেকে শুরু করবেন তার স্পষ্ট নির্দেশনা

#### পরিবর্তিত
- **README গঠন**: প্রগ্রেসিভ ডিসক্লোজারের জন্য পুনরায় সংগঠিত - প্রথমে মূল তথ্য
- **পরিচিতি সেকশন**: সম্পূর্ণ শিক্ষানবিসদের জন্য "The Magic of `azd up`" ব্যাখ্যা পুনরায় লেখা হয়েছে
- **ডুপ্লিকেট কনটেন্ট অপসারণ**: ডুপ্লিকেট ট্ৰাবলশুটিং সেকশন বাতিল করা হয়েছে
- **ট্ৰাবলশুটিং কমান্ডসমূহ**: `azd logs` রেফারেন্সটি বৈধ `azd monitor --logs`-এ ঠিক করা হয়েছে

#### ঠিক করা হয়েছে
- **🔐 অথেন্টিকেশন কমান্ডসমূহ**: cheat-sheet.md-এ `azd auth login` এবং `azd auth logout` যোগ করা হয়েছে
- **অবৈধ কমান্ড রেফারেন্স**: README ট্রাবলশুটিং সেকশন থেকে অবশিষ্ট `azd logs` মুছে ফেলা হয়েছে

#### নোটসমূহ
- **পরিধি**: পরিবর্তনসমূহ মূল README.md এবং resources/cheat-sheet.md-এ প্রয়োগ করা হয়েছে
- **টার্গেট পাঠকশ্রেণী**: পরিবর্তনগুলো বিশেষভাবে AZD-তে নতুন ডেভেলপারদের লক্ষ্য করে করা হয়েছে

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI কমান্ড সঠিককরণ আপডেট
**এই সংস্করণটি ডকুমেন্টেশনের মাধ্যমে অস্তিত্বহীন AZD কমান্ডগুলো সংশোধন করে, নিশ্চিত করে যে সমস্ত কোড উদাহরণ বৈধ Azure Developer CLI সিনট্যাক্স ব্যবহার করছে।**

#### ঠিক করা হয়েছে
- **🔧 অস্থিতিশীল AZD কমান্ড অপসারণ**: অবৈধ কমান্ডগুলোর ব্যাপক অডিট এবং সংশোধন:
  - `azd logs` (অস্তিত্ব নেই) → `azd monitor --logs` বা Azure CLI বিকল্পগুলোর মাধ্যমে প্রতিস্থাপিত
  - `azd service` সাবকমান্ডসমূহ (অস্তিত্ব নেই) → `azd show` এবং Azure CLI দিয়ে প্রতিস্থাপিত
  - `azd infra import/export/validate` (অস্তিত্ব নেই) → অপসারণ বা বৈধ বিকল্প দিয়ে প্রতিস্থাপিত
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` ফ্ল্যাগসমূহ (অস্তিত্ব নেই) → অপসারণ
  - `azd provision --what-if/--rollback` ফ্ল্যাগসমূহ (অস্তিত্ব নেই) → `--preview` ব্যবহার করে আপডেট করা হয়েছে
  - `azd config validate` (অস্তিত্ব নেই) → `azd config list` দ্বারা প্রতিস্থাপিত
  - `azd info`, `azd history`, `azd metrics` (অস্তিত্ব নেই) → অপসারণ

- **📚 কমান্ড সংশোধনসহ আপডেট করা ফাইলসমূহ**:
  - `resources/cheat-sheet.md`: কমান্ড রেফারেন্সের বড় পুনর্গঠন
  - `docs/deployment/deployment-guide.md`: রোলব্যাক এবং ডেপ্লয়মেন্ট কৌশল ঠিক করা হয়েছে
  - `docs/troubleshooting/debugging.md`: লগ বিশ্লেষণ সেকশন সংশোধন
  - `docs/troubleshooting/common-issues.md`: ট্ৰাবলশুটিং কমান্ড আপডেট
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD ডিবাগিং সেকশন ঠিক করা হয়েছে
  - `docs/getting-started/azd-basics.md`: মনিটরিং কমান্ড সংশোধন
  - `docs/getting-started/first-project.md`: মনিটরিং এবং ডিবাগিং উদাহরণ আপডেট
  - `docs/getting-started/installation.md`: হেল্প এবং ভার্সন উদাহরণ ঠিক করা হয়েছে
  - `docs/pre-deployment/application-insights.md`: লগ ভিউ করতে কমান্ড সংশোধন
  - `docs/pre-deployment/coordination-patterns.md`: এজেন্ট ডিবাগিং কমান্ড ঠিক করা হয়েছে

- **📝 সংস্করণ রেফারেন্স আপডেট**:
  - `docs/getting-started/installation.md`: হার্ডকোড করা `1.5.0` সংস্করণটি সাধারণ `1.x.x`-এ পরিবর্তন করা হয়েছে এবং releases-এ লিংক দেওয়া হয়েছে

#### পরিবর্তিত
- **রোলব্যাক কৌশল**: AZD-এ নেটিভ রোলব্যাক না থাকার কারণে Git-ভিত্তিক রোলব্যাক ব্যবহারের জন্য ডকুমেন্টেশন আপডেট করা হয়েছে
- **লগ ভিউয়িং**: `azd logs` রেফারেন্সগুলো `azd monitor --logs`, `azd monitor --live`, এবং Azure CLI কমান্ড দিয়ে প্রতিস্থাপিত হয়েছে
- **পারফরম্যান্স সেকশন**: অবৈধ parallel/incremental ডেপ্লয়মেন্ট ফ্ল্যাগ অপসারণ করে বৈধ বিকল্প প্রদান করা হয়েছে

#### প্রযুক্তিগত বিবরণ
- **বৈধ AZD কমান্ডসমূহ**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **বৈধ azd monitor ফ্ল্যাগসমূহ**: `--live`, `--logs`, `--overview`
- **অপসারিত ফিচারসমূহ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### নোট
- **যাচাই**: কমান্ডগুলো Azure Developer CLI v1.23.x-এর বিরুদ্ধে যাচাই করা হয়েছে

---

### [v3.9.0] - 2026-02-05

#### ওয়ার্কশপ সম্পন্নকরণ এবং ডকুমেন্টেশন মান আপডেট
**এই সংস্করণটি ইন্টারেক্টিভ ওয়ার্কশপ মডিউলগুলি সম্পন্ন করে, সব ভাঙা ডকুমেন্টেশন লিংক ঠিক করে, এবং Microsoft AZD ব্যবহারকারী AI ডেভেলপারদের জন্য সামগ্রিক কন্টেন্ট কোয়ালিটি উন্নত করে।**

#### যোগ করা হয়েছে
- **📝 CONTRIBUTING.md**: নতুন কনট্রিবিউশন গাইডলাইন ডকুমেন্ট যার মধ্যে রয়েছে:
  - ইস্যু রিপোর্ট করা এবং পরিবর্তন প্রস্তাব করার জন্য স্পষ্ট নির্দেশনা
  - নতুন কনটেন্টের জন্য ডকুমেন্টেশন স্ট্যান্ডার্ডসমূহ
  - কোড উদাহরণ নির্দেশিকা এবং কমিট বার্তা কনভেনশন
  - কমিউনিটি অংশগ্রহণ সম্পর্কিত তথ্য

#### সম্পন্ন
- **🎯 ওয়ার্কশপ মডিউল 7 (Wrap-up)**: সম্পূর্ণভাবে শেষ করা Wrap-up মডিউল সহ:
  - ওয়ার্কশপ সম্পাদনার বিস্তৃত সারসংক্ষেপ
  - AZD, টেমপ্লেট এবং Microsoft Foundry কভার করা মূল ধারণাগুলির সেকশন
  - শেখার যাত্রা চালিয়ে যাওয়ার সুপারিশসমূহ
  - কঠিনতার রেটিংসহ ওয়ার্কশপ চ্যালেঞ্জ অনুশীলন
  - কমিউনিটির মতামত এবং সহায়তা লিঙ্কসমূহ

- **📚 ওয়ার্কশপ মডিউল 3 (Deconstruct)**: শিক্ষার লক্ষ্যসমূহ আপডেট করা হয়েছে:
  - GitHub Copilot ও MCP সার্ভারের অ্যাক্টিভেশন গাইডেন্স
  - AZD টেমপ্লেট ফোল্ডার স্ট্রাকচার বোঝা
  - ইনফ্রাস্ট্রাকচার-অ্যাস-কোড (Bicep) সংগঠন প্যাটার্ন
  - প্র্যাকটিক্যাল ল্যাব নির্দেশাবলী

- **🔧 ওয়ার্কশপ মডিউল 6 (Teardown)**: নিম্নলিখিত সহ সমাপ্ত:
  - রিসোর্স পরিষ্কারকরণ এবং খরচ ব্যবস্থাপনা লক্ষ্য
  - নিরাপদভাবে ইনফ্রাস্ট্রাকচার অপসারণের জন্য `azd down` ব্যবহারের নির্দেশিকা
  - সফট-ডিলিটেড Cognitive Services পুনরুদ্ধার নির্দেশিকা
  - GitHub Copilot এবং Azure Portal এর জন্য বোনাস এক্সপ্লোরেশন প্রম্পট

#### সমাধান করা হয়েছে
- **🔗 ভাঙা লিঙ্ক সংশোধন**: 15+ টির বেশি ভাঙা অভ্যন্তরীণ ডকুমেন্টেশন লিঙ্ক সমাধান করা হয়েছে:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md-এ পথ ঠিক করা হয়েছে
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md এবং production-ai-practices.md পথগুলি সঠিক করা হয়েছে
  - `docs/getting-started/first-project.md`: অস্তিত্বহীন cicd-integration.md কে deployment-guide.md দিয়ে প্রতিস্থাপন করা হয়েছে
  - `examples/retail-scenario.md`: FAQ এবং ট্রাবলশুটিং গাইডের পথ ঠিক করা হয়েছে
  - `examples/container-app/microservices/README.md`: কোর্স হোম এবং ডিপ্লয়মেন্ট গাইডের পথ সঠিক করা হয়েছে
  - `resources/faq.md` এবং `resources/glossary.md`: AI অধ্যায়ের রেফারেন্স আপডেট করা হয়েছে
  - `course-outline.md`: ইনস্ট্রাক্টর গাইড এবং AI ওয়ার্কশপ ল্যাব রেফারেন্স ঠিক করা হয়েছে

- **📅 ওয়ার্কশপ স্ট্যাটাস ব্যানার**: "Under Construction" থেকে সক্রিয় ওয়ার্কশপ স্ট্যাটাসে আপডেট করা হয়েছে, February 2026 তারিখসহ

- **🔗 ওয়ার্কশপ নেভিগেশন**: README.md-এ ল্যাব-1-azd-basics ফোল্ডার যে লিংকগুলো ছিল তা এমন লিংকগুলো ঠিক করা হয়েছে যেগুলো অস্তিত্বহীন নির্দেশ করছিল

#### পরিবর্তিত
- **ওয়ার্কশপ উপস্থাপনা**: "under construction" সতর্কবার্তা সরানো হয়েছে, ওয়ার্কশপ এখন সম্পন্ন এবং ব্যবহারের জন্য প্রস্তুত
- **নেভিগেশন সামঞ্জস্য**: সব ওয়ার্কশপ মডিউলে সঠিক আন্তঃমডিউল নেভিগেশন নিশ্চিত করা হয়েছে
- **লার্নিং পাথ রেফারেন্স**: অধ্যায়ের ক্রস-রেফারেন্সগুলো সঠিক microsoft-foundry পাথ ব্যবহার করে আপডেট করা হয়েছে

#### যাচাইকৃত
- ✅ সমস্ত ইংরেজি মার্কডাউন ফাইলগুলির অভ্যন্তরীণ লিঙ্ক বৈধ
- ✅ ওয়ার্কশপ মডিউল 0-7 শেখার লক্ষ্যসহ সম্পূর্ণ
- ✅ অধ্যায় এবং মডিউলগুলোর মধ্যে নেভিগেশন সঠিকভাবে কাজ করে
- ✅ কনটেন্ট AI ডেভেলপারদের জন্য AZD ব্যবহার করে উপযুক্ত
- ✅ শুরুতেই ব্যবহারকারী-বান্ধব ভাষা এবং কাঠামো বজায় রাখা হয়েছে
- ✅ CONTRIBUTING.md কমিউনিটি কনট্রিবিউটরের জন্য স্পষ্ট নির্দেশনা প্রদান করে

#### প্রযুক্তিগত বাস্তবায়ন
- **লিঙ্ক যাচাই**: স্বয়ংক্রিয় PowerShell স্ক্রিপ্ট সমস্ত .md অভ্যন্তরীণ লিংক যাচাই করেছে
- **কনটেন্ট অডিট**: ওয়ার্কশপ সম্পূর্ণতা এবং নবাগত উপযোগিতার ম্যানুয়াল রিভিউ
- **নেভিগেশন সিস্টেম**: অধ্যায় এবং মডিউল নেভিগেশনের ধরণগুলো একরূপভাবে প্রয়োগ করা হয়েছে

#### নোট
- **স্কোপ**: পরিবর্তনগুলি কেবল ইংরেজি ডকুমেন্টেশনে প্রযোজ্য
- **অনুবাদসমূহ**: এই সংস্করণে অনুবাদ ফোল্ডার আপডেট করা হয়নি (স্বয়ংক্রিয় অনুবাদ পরে সিঙ্ক হবে)
- **ওয়ার্কশপ সময়কাল**: সম্পূর্ণ ওয়ার্কশপ এখন 3-4 ঘণ্টার হাতে-কলমে শেখার সুযোগ প্রদান করে

---

### [v3.8.0] - 2025-11-19

#### উন্নত ডকুমেন্টেশন: মনিটরিং, সিকিউরিটি, এবং মাল্টি-এজেন্ট প্যাটার্ন
**এই সংস্করণটি Application Insights ইন্টিগ্রেশন, প্রমাণীকরণ প্যাটার্ন এবং প্রোডাকশন ডিপ্লয়মেন্টের জন্য মাল্টি-এজেন্ট সমন্বয় নিয়ে বিস্তৃত A-গ্রেড লেসন যোগ করে।**

#### যোগ করা হয়েছে
- **📊 Application Insights Integration Lesson**: `docs/pre-deployment/application-insights.md`-এ:
  - AZD-ফোকাসড ডিপ্লয়মেন্ট সহ স্বয়ংক্রিয় প্রোভিশনিং
  - Application Insights + Log Analytics-এর সম্পূর্ণ Bicep টেমপ্লেট
  - কাস্টম টেলেমেট্রি সহ কাজ করা Python অ্যাপ্লিকেশন (1,200+ লাইনের বেশি)
  - AI/LLM মনিটরিং প্যাটার্ন (Microsoft Foundry Models টোকেন/খরচ ট্র্যাকিং)
  - 6টি Mermaid ডায়াগ্রাম (আর্কিটেকচার, বিতরণ-ট্রেসিং, টেলিমেট্রি ফ্লো)
  - 3টি প্র্যাকটিক্যাল অনুশীলন (অ্যালার্ট, ড্যাশবোর্ড, AI মনিটরিং)
  - Kusto কুয়েরি উদাহরণ এবং খরচ অপ্টিমাইজেশন কৌশল
  - লাইভ মেট্রিক স্ট্রিমিং এবং রিয়েল-টাইম ডিবাগিং
  - প্রোডাকশন-রেডি প্যাটার্নসহ 40-50 মিনিটের শেখার সময়

- **🔐 Authentication & Security Patterns Lesson**: `docs/getting-started/authsecurity.md`-এ:
  - 3টি প্রমাণীকরণ প্যাটার্ন (connection strings, Key Vault, managed identity)
  - নিরাপদ ডিপ্লয়মেন্টের জন্য সম্পূর্ণ Bicep ইনফ্রাস্ট্রাকচার টেমপ্লেট
  - Azure SDK ইন্টিগ্রেশনের সাথে Node.js অ্যাপ্লিকেশন কোড
  - 3টি সম্পূর্ণ অনুশীলন (managed identity সক্ষম করা, user-assigned identity, Key Vault রোটেশন)
  - সিকিউরিটি সেরা অনুশীলন এবং RBAC কনফিগারেশন
  - ট্রাবলশুটিং গাইড এবং খরচ বিশ্লেষণ
  - প্রোডাকশন-রেডি পাসওয়ার্ডলেস প্রমাণীকরণ প্যাটার্ন

- **🤖 Multi-Agent Coordination Patterns Lesson**: `docs/pre-deployment/coordination-patterns.md`-এ:
  - 5টি সমন্বয় প্যাটার্ন (sequential, parallel, hierarchical, event-driven, consensus)
  - সম্পূর্ণ orchestrator সার্ভিস ইমপ্লিমেন্টেশন (Python/Flask, 1,500+ লাইনের বেশি)
  - 3টি বিশেষায়িত এজেন্ট ইমপ্লিমেন্টেশন (Research, Writer, Editor)
  - 메시 কিউইংয়ের জন্য Service Bus ইন্টিগ্রেশন
  - বিতরণকৃত সিস্টেমের জন্য Cosmos DB স্টেট ম্যানেজমেন্ট
  - এজেন্ট ইন্টারঅ্যাকশন দেখানোর জন্য 6টি Mermaid ডায়াগ্রাম
  - 3টি অ্যাডভান্সড অনুশীলন (টাইমআউট হ্যান্ডলিং, রিট্রি লজিক, সার্কিট ব্রেকার)
  - খরচ ভাঙন ($240-565/month) এবং অপ্টিমাইজেশন কৌশল
  - মনিটরিংয়ের জন্য Application Insights ইন্টিগ্রেশন

#### উন্নত করা হয়েছে
- **Pre-deployment অধ্যায়**: এখন বিস্তৃত মনিটরিং এবং সমন্বয় প্যাটার্ন অন্তর্ভুক্ত
- **Getting Started অধ্যায়**: পেশাদার প্রমাণীকরণ প্যাটার্ন দিয়ে উন্নত
- **Production Readiness**: সিকিউরিটি থেকে অবজার্ভেবিলিটি পর্যন্ত পূর্ণ কাভারেজ
- **Course Outline**: অধ্যায় 3 এবং 6-এ নতুন লেসনগুলোর রেফারেন্স যোগ করা হয়েছে

#### পরিবর্তিত
- **লার্নিং প্রোগ্রেশন**: কোর্স জুড়ে সিকিউরিটি এবং মনিটরিং ভালভাবে একত্রিত করা হয়েছে
- **ডকুমেন্টেশন গুণমান**: নতুন লেসনগুলোতে A-গ্রেড স্ট্যান্ডার্ড (95-97%) বজায় রাখা হয়েছে
- **প্রোডাকশন প্যাটার্ন**: এন্টারপ্রাইজ ডিপ্লয়মেন্টের জন্য সম্পূর্ণ end-to-end কাভারেজ

#### উন্নত
- **ডেভেলপার অভিজ্ঞতা**: ডেভেলপমেন্ট থেকে প্রোডাকশন মনিটরিং পর্যন্ত পরিষ্কার পথ
- **সিকিউরিটি স্ট্যান্ডার্ড**: প্রমাণীকরণ এবং সিক্রেট ম্যানেজমেন্টের পেশাদার প্যাটার্ন
- **অবজার্ভেবিলিটি**: AZD-এর সাথে সম্পূর্ণ Application Insights ইন্টিগ্রেশন
- **AI ওয়ার্কলোডস**: Microsoft Foundry Models এবং মাল্টি-এজেন্ট সিস্টেমের জন্য বিশেষায়িত মনিটরিং

#### যাচাইকৃত
- ✅ সমস্ত লেসনে সম্পূর্ণ কাজ করা কোড অন্তর্ভুক্ত (স্নিপেট নয়)
- ✅ ভিজ্যুয়াল শেখার জন্য Mermaid ডায়াগ্রাম (মোট 19টি তিনটি লেসনে)
- ✅ যাচাই ধাপসহ প্র্যাকটিক্যাল অনুশীলন (মোট 9টি)
- ✅ `azd up` দিয়ে ডিপ্লয়েবল প্রোডাকশন-রেডি Bicep টেমপ্লেট
- ✅ খরচ বিশ্লেষণ এবং অপ্টিমাইজেশন কৌশল
- ✅ ট্রাবলশুটিং গাইড এবং সেরা অনুশীলন
- ✅ যাচাইকরণ কমান্ডসহ জ্ঞান চেকপয়েন্ট

#### ডকুমেন্টেশন গ্রেডিং ফলাফল
- **docs/pre-deployment/application-insights.md**: - সম্পূর্ণ পর্যবেক্ষণ নির্দেশিকা
- **docs/getting-started/authsecurity.md**: - পেশাদার সিকিউরিটি প্যাটার্ন
- **docs/pre-deployment/coordination-patterns.md**: - উন্নত মাল্টি-এজেন্ট আর্কিটেকচার
- **Overall New Content**: - ধারাবাহিক উচ্চ-গুণমান স্ট্যান্ডার্ড

#### প্রযুক্তিগত বাস্তবায়ন
- **Application Insights**: Log Analytics + কাস্টম টেলেমেট্রি + বিতরণ-ট্রেসিং
- **Authentication**: Managed Identity + Key Vault + RBAC প্যাটার্ন
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + অর্কেস্ট্রেশন
- **Monitoring**: লাইভ মেট্রিক্স + Kusto কুয়েরি + অ্যালার্ট + ড্যাশবোর্ড
- **Cost Management**: স্যাম্পলিং কৌশল, রিটেনশন পলিসি, বাজেট নিয়ন্ত্রণ

### [v3.7.0] - 2025-11-19

#### ডকুমেন্টেশন গুণমান উন্নতি এবং নতুন Microsoft Foundry Models উদাহরণ
**এই সংস্করণটি রেপোজিটরির ডকুমেন্টেশন গুণমান উন্নত করে এবং একটি সম্পূর্ণ Microsoft Foundry Models ডিপ্লয়মেন্ট উদাহরণ gpt-4.1 চ্যাট ইন্টারফেস নিয়ে যোগ করে।**

#### যোগ করা হয়েছে
- **🤖 Microsoft Foundry Models Chat Example**: `examples/azure-openai-chat/`-এ সম্পূর্ণ gpt-4.1 ডিপ্লয়মেন্ট সহ কাজ করা ইমপ্লিমেন্টেশন:
  - Microsoft Foundry Models ইন্সট্রাকচার (gpt-4.1 মডেল ডিপ্লয়মেন্ট)
  - কথোপকথন ইতিহাসসহ Python কমান্ড-লাইন চ্যাট ইন্টারফেস
  - API কী সুরক্ষিতভাবে সংরক্ষণের জন্য Key Vault ইন্টিগ্রেশন
  - টোকেন ব্যবহার ট্র্যাকিং এবং খরচ অনুমান
  - রেট লিমিটিং এবং এরর হ্যান্ডলিং
  - 35-45 মিনিটের ডিপ্লয়মেন্ট গাইডসহ বিস্তৃত README
  - 11টি প্রোডাকশন-রেডি ফাইল (Bicep টেমপ্লেট, Python অ্যাপ, কনফিগারেশন)
- **📚 ডকুমেন্টেশন অনুশীলনসমূহ**: কনফিগারেশন গাইডে হাতে-কলমে অনুশীলন যোগ করা হয়েছে:
  - অনুশীলন 1: মাল্টি-এনভায়রনমেন্ট কনফিগারেশন (15 মিনিট)
  - অনুশীলন 2: সিক্রেট ম্যানেজমেন্ট অনুশীলন (10 মিনিট)
  - স্পষ্ট সফলতা মানদণ্ড এবং যাচাই ধাপসমূহ
- **✅ ডিপ্লয়মেন্ট ভেরিফিকেশন**: ডিপ্লয়মেন্ট গাইডে যাচাইকরণ সেকশন যোগ করা হয়েছে:
  - হেলথ চেক পদ্ধতি
  - সফলতা মানদণ্ড চেকলিস্ট
  - সমস্ত ডিপ্লয়মেন্ট কমান্ডের প্রত্যাশিত আউটপুট
  - দ্রুত ট্রাবলশুটিং রেফারেন্স

#### উন্নত করা হয়েছে
- **examples/README.md**: A-গ্রেড গুণমান (93%) এ আপডেট করা হয়েছে:
  - azure-openai-chat সকল প্রাসঙ্গিক সেকশনে যোগ করা হয়েছে
  - লোকাল উদাহরণ সংখ্যা 3 থেকে 4-এ আপডেট করা হয়েছে
  - AI অ্যাপ্লিকেশন উদাহরণ টেবিলে যোগ করা হয়েছে
  - Intermediate Users-এর জন্য Quick Start-এ ইন্টিগ্রেট করা হয়েছে
  - Microsoft Foundry Templates সেকশনে যোগ করা হয়েছে
  - Comparison Matrix এবং প্রযুক্তি অনুসন্ধান সেকশন আপডেট করা হয়েছে
- **ডকুমেন্টেশন গুণমান**: B+ (87%) → A- (92%) ডক্স ফোল্ডার জুড়ে উন্নতি:
  - গুরুত্বপূর্ণ কমান্ড উদাহরণগুলিতে প্রত্যাশিত আউটপুট যোগ করা হয়েছে
  - কনফিগারেশন পরিবর্তনের জন্য যাচাই ধাপ অন্তর্ভুক্ত করা হয়েছে
  - প্রায়োগিক অনুশীলনগুলোর মাধ্যমে হাতে-কলমে শেখা উন্নত করা হয়েছে

#### পরিবর্তিত
- **লার্নিং প্রোগ্রেশন**: মধ্যম স্তরের শিক্ষার্থীদের জন্য AI উদাহরণগুলোর ভাল ইন্টিগ্রেশন
- **ডকুমেন্টেশন স্ট্রাকচার**: স্পষ্ট ফলাফলসহ আরও কার্যকর অনুশীলন
- **জাচাইকরণ প্রক্রিয়া**: প্রধান ওয়ার্কফ্লোতে স্পষ্ট সফলতা মানদণ্ড যোগ করা হয়েছে

#### উন্নত
- **ডেভেলপার অভিজ্ঞতা**: Microsoft Foundry Models ডিপ্লয়মেন্ট এখন 35-45 মিনিটে সম্পন্ন (বিকল্প জটিল পন্থার বিপরীতে 60-90 মিনিট)
- **খরচ স্বচ্ছতা**: Microsoft Foundry Models উদাহরণের জন্য স্পষ্ট খরচ অনুমান ($50-200/month)
- **লার্নিং পাথ**: AI ডেভেলপারদের জন্য azure-openai-chat দিয়ে স্পষ্ট এন্ট্রি পয়েন্ট
- **ডকুমেন্টেশন স্ট্যান্ডার্ড**: প্রত্যাশিত আউটপুট এবং যাচাই ধাপগুলোর ধারাবাহিকতা

#### যাচাইকৃত
- ✅ Microsoft Foundry Models উদাহরণ `azd up` দিয়ে সম্পূর্ণ কার্যকর
- ✅ সব 11টি ইমপ্লিমেন্টেশন ফাইল অনুচাসম্যভাবে সঠিক
- ✅ README নির্দেশনা প্রকৃত ডিপ্লয়মেন্ট অভিজ্ঞতার সাথে মিলে যায়
- ✅ ডকুমেন্টেশন লিংক 8+ স্থানে আপডেট করা হয়েছে
- ✅ উদাহরণ ইনডেক্সে সঠিকভাবে 4টি লোকাল উদাহরণ প্রতিফলিত
- ✅ টেবিলে কোনো ডুপ্লিকেট এক্সটার্নাল লিংক নেই
- ✅ সমস্ত নেভিগেশন রেফারেন্স সঠিক

#### প্রযুক্তিগত বাস্তবায়ন
- **Microsoft Foundry Models আর্কিটেকচার**: gpt-4.1 + Key Vault + Container Apps প্যাটার্ন
- **সিকিউরিটি**: Managed Identity প্রস্তুত, সিক্রেটগুলো Key Vault-এ
- **মনিটরিং**: Application Insights ইন্টিগ্রেশন
- **খরচ ব্যবস্থাপনা**: টোকেন ট্র্যাকিং এবং ব্যবহার অপ্টিমাইজেশন
- **ডিপ্লয়মেন্ট**: সম্পূর্ণ সেটআপের জন্য একক `azd up` কমান্ড

### [v3.6.0] - 2025-11-19

#### প্রধান আপডেট: Container App ডিপ্লয়মেন্ট উদাহরণ
**এই সংস্করণটি Azure Developer CLI (AZD) ব্যবহার করে কনটেইনার অ্যাপ্লিকেশন ডিপ্লয়মেন্টের বিস্তৃত, প্রোডাকশন-রেডি উদাহরণ যোগ করে, সম্পূর্ণ ডকুমেন্টেশন এবং লার্নিং পাথে ইন্টিগ্রেশনসহ।**

#### যোগ করা হয়েছে
- **🚀 কনটেইনার অ্যাপ উদাহরণ**: নতুন লোকাল উদাহরণসমূহ `examples/container-app/`-এ:
  - [মাস্টার গাইড](examples/container-app/README.md): কনটেইনারাইজড ডিপ্লয়মেন্ট, কুইক স্টার্ট, প্রোডাকশন এবং অ্যাডভান্সড প্যাটার্নের সম্পূর্ণ ওভারভিউ
  - [সিম্পল Flask API](../../examples/container-app/simple-flask-api): শুরুতে-উপযোগী REST API যার মধ্যে scale-to-zero, হেলথ প্রোব, মনিটরিং এবং ট্রাবলশুটিং আছে
  - [মাইক্রোসার্ভিস আর্কিটেকচার](../../examples/container-app/microservices): প্রোডাকশন-রেডি মাল্টি-সার্ভিস ডিপ্লয়মেন্ট (API Gateway, Product, Order, User, Notification), অ্যাসিঙ্ক মেসেজিং, Service Bus, Cosmos DB, Azure SQL, বিতরণ-ট্রেসিং, blue-green/canary ডিপ্লয়মেন্ট
- **সেরা অনুশীলনসমূহ**: কনটেইনারাইজড ওয়ার্কলোডের জন্য সিকিউরিটি, মনিটরিং, খরচ অপ্টিমাইজেশন এবং CI/CD নির্দেশিকা
- **কোড স্যাম্পলসমূহ**: সম্পূর্ণ `azure.yaml`, Bicep টেমপ্লেট এবং বহু-ভাষার সার্ভিস ইমপ্লিমেন্টেশন (Python, Node.js, C#, Go)
- **টেস্টিং ও ট্রাবলশুটিং**: এন্ড-টু-এন্ড টেস্ট সenario, মনিটরিং কমান্ড, ট্রাবলশুটিং নির্দেশিকা

#### পরিবর্তিত
- **README.md**: "Local Examples - Container Applications" অধীনে নতুন কনটেইনার অ্যাপ উদাহরণগুলো প্রদর্শন এবং লিংক যোগ করা হয়েছে
- **examples/README.md**: কনটেইনার অ্যাপ উদাহরণ হাইলাইট করার জন্য আপডেট, তুলনা ম্যাট্রিক্স এন্ট্রি যোগ এবং প্রযুক্তি/আর্কিটেকচার রেফারেন্স আপডেট করা হয়েছে
- **Course Outline & Study Guide**: প্রাসঙ্গিক অধ্যায়গুলিতে নতুন কনটেইনার অ্যাপ উদাহরণ এবং ডিপ্লয়মেন্ট প্যাটার্ন রেফারেন্স যোগ করা হয়েছে

#### যাচাইকৃত
- ✅ সমস্ত নতুন উদাহরণ `azd up` দিয়ে ডিপ্লয়েবল এবং সেরা অনুশীলন অনুসরণ করে
- ✅ ডকুমেন্টেশন ক্রস-লিংক এবং নেভিগেশন আপডেট করা হয়েছে
- ✅ উদাহরণসমূহ শুরু থেকে অ্যাডভান্সড দৃশ্য পর্যন্ত কভার করে, যার মধ্যে প্রোডাকশন মাইক্রোসার্ভিসও আছে

#### নোট
- **স্কোপ**: কেবল ইংরেজি ডকুমেন্টেশন এবং উদাহরণ
- **পরবর্তী পদক্ষেপ**: ভবিষ্যত রিলিজে অতিরিক্ত অ্যাডভান্সড কনটেইনার প্যাটার্ন এবং CI/CD অটোমেশন যোগ করা হবে

### [v3.5.0] - 2025-11-19

#### প্রোডাক্ট রিব্র্যান্ডিং: Microsoft Foundry
**এই সংস্করণটি "Microsoft Foundry" নামক প্রোডাক্টের ব্যাপক নাম পরিবর্তন সম্পাদন করে ইংরেজি ডকুমেন্টেশনের সর্বত্র, Microsoft-এর অফিসিয়াল রিব্র্যান্ডিং প্রতিফলিত করে।**

#### পরিবর্তিত
- **🔄 প্রোডাক্ট নাম আপডেট**: "Microsoft Foundry" থেকে "Microsoft Foundry" এ ব্যাপক রিব্র্যান্ডিং সম্পন্ন
  - ইংরেজি ডকুমেন্টেশনের `docs/` ফোল্ডারে সমস্ত রেফারেন্স আপডেট করা হয়েছে
  - ফোল্ডারের নাম পরিবর্তন: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - নাম পরিবর্তন করা ফাইল: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - মোট: 7টি ডকুমেন্টেশন ফাইলে 23টি কন্টেন্ট রেফারেন্স আপডেট করা হয়েছে

- **📁 ফোল্ডার স্ট্রাকচার পরিবর্তন**:
  - `docs/ai-foundry/` পুনঃনামকরণ করা হয়েছে → `docs/microsoft-foundry/`
  - সমস্ত ক্রসবিন্দুগুলি নতুন ফোল্ডার স্ট্রাকচার প্রতিফলিত করে আপডেট করা হয়েছে
  - ন্যাভিগেশন লিঙ্কগুলো সমস্ত ডকুমেন্টেশনে যাচাই করা হয়েছে

- **📄 ফাইল নাম পরিবর্তন**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - সমস্ত অভ্যন্তরীণ লিঙ্ক নতুন ফাইলনেম রেফারেন্সের দিকে আপডেট করা হয়েছে

#### আপডেট করা ফাইলসমূহ
- **অধ্যায় ডকুমেন্টেশন** (7 ফাইল):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3টি ন্যাভিগেশন লিঙ্ক আপডেট
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4টি প্রোডাক্ট নাম রেফারেন্স আপডেট
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - পূর্বের আপডেটে ইতোমধ্যে Microsoft Foundry ব্যবহার করা হচ্ছে
  - `docs/microsoft-foundry/production-ai-practices.md` - 3টি রেফারেন্স আপডেট (ওভারভিউ, কমিউনিটি ফিডব্যাক, ডকুমেন্টেশন)
  - `docs/getting-started/azd-basics.md` - 4টি ক্রস-রেফারেন্স লিঙ্ক আপডেট
  - `docs/getting-started/first-project.md` - 2টি অধ্যায় ন্যাভিগেশন লিংক আপডেট
  - `docs/getting-started/installation.md` - 2টি পরবর্তী অধ্যায় লিংক আপডেট
  - `docs/troubleshooting/ai-troubleshooting.md` - 3টি রেফারেন্স আপডেট (ন্যাভিগেশন, Discord কমিউনিটি)
  - `docs/troubleshooting/common-issues.md` - 1টি ন্যাভিগেশন লিংক আপডেট
  - `docs/troubleshooting/debugging.md` - 1টি ন্যাভিগেশন লিংক আপডেট

- **কোর্স স্ট্রাকচার ফাইলসমূহ** (2 ফাইল):
  - `README.md` - 17টি রেফারেন্স আপডেট (কোর্স ওভারভিউ, অধ্যায় শিরোনাম, টেমপ্লেট সেকশন, কমিউনিটি ইনসাইট)
  - `course-outline.md` - 14টি রেফারেন্স আপডেট (ওভারভিউ, শেখার উদ্দেশ্য, অধ্যায় রিসোর্স)

#### যাচাই করা হয়েছে
- ✅ English ডকুমেন্টগুলোতে "ai-foundry" ফোল্ডার পাথ রেফারেন্স আর নেই
- ✅ English ডকুমেন্টগুলোতে "Microsoft Foundry" প্রোডাক্ট নাম রেফারেন্স আর নেই
- ✅ নতুন ফোল্ডার স্ট্রাকচারের সাথে সকল ন্যাভিগেশন লিংক কার্যকর
- ✅ ফাইল এবং ফোল্ডার নাম পরিবর্তন সফলভাবে সম্পন্ন
- ✅ অধ্যায়গুলোর মধ্যে ক্রস-রেফারেন্স যাচাই করা হয়েছে

#### নোট
- **স্কোপ**: পরিবর্তনগুলো `docs/` ফোল্ডারের ইংরেজি ডকুমেন্টেশনে প্রয়োগ করা হয়েছে
- **অনুবাদসমূহ**: এই সংস্করণে অনুবাদ ফোল্ডারগুলো (`translations/`) আপডেট করা হয়নি
- **ওয়ার্কশপ**: ওয়ার্কশপ উপকরণসমূহ (`workshop/`) এই সংস্করণে আপডেট করা হয়নি
- **উদাহরণসমূহ**: উদাহরণ ফাইলগুলো এখনও পুরোনো নাম ব্যবহার করতে পারে (ভবিষ্যতের আপডেটে সমাধান হবে)
- **বহিরাগত লিঙ্কসমূহ**: বহিরাগত URL এবং GitHub রেপোজিটরি রেফারেন্স অপরিবর্তিত রয়েছে

#### কনট্রিবিউটরদের জন্য মাইগ্রেশন গাইড
যদি আপনার লোকাল ব্রাঞ্চ বা ডকুমেন্টেশন পুরনো স্ট্রাকচারের রেফারেন্স করে:
1. ফোল্ডার রেফারেন্স আপডেট করুন: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. ফাইল রেফারেন্স আপডেট করুন: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. প্রোডাক্ট নাম প্রতিস্থাপন করুন: "Microsoft Foundry" → "Microsoft Foundry"
4. যাচাই করুন যে সমস্ত অভ্যন্তরীণ ডকুমেন্টেশন লিংক এখনও কাজ করছে

---

### [v3.4.0] - 2025-10-24

#### অবকাঠামো প্রিভিউ এবং যাচাই উন্নতি
**এই সংস্করণটি নতুন Azure Developer CLI প্রিভিউ ফিচারের বিস্তৃত সমর্থন সহ ওয়ার্কশপ ব্যবহারকারীর অভিজ্ঞতা উন্নত করে।**

#### যোগ করা হয়েছে
- **🧪 azd provision --preview বৈশিষ্ট্য ডকুমেন্টেশন**: নতুন অবকাঠামো প্রিভিউ ক্ষমতার ব্যাপক কাভারেজ
  - চিট শিটে কমান্ড রেফারেন্স এবং ব্যবহারের উদাহরণ
  - প্রোভিশনিং গাইডে বিস্তারিত ইন্টিগ্রেশন, ব্যবহার কেস এবং সুবিধासমূহ
  - নিরাপদ ডিপ্লয়মেন্ট যাচাইয়ের জন্য প্রি-ফ্লাইট চেক ইন্টিগ্রেশন
  - নিরাপত্তা-প্রাথমিক ডিপ্লয়মেন্ট অনুশীলনসহ শুরু করার গাইড আপডেট
- **🚧 ওয়ার্কশপ স্ট্যাটাস ব্যানার**: ওয়ার্কশপ ডেভেলপমেন্ট স্টেটাস নির্দেশ করে এমন পেশাদার HTML ব্যানার
  - গ্রেডিয়েন্ট ডিজাইন এবং কনস্ট্রাকশন ইন্ডিকেটর ব্যবহার করে ব্যবহারকারীর জন্য স্পষ্ট যোগাযোগ
  - স্বচ্ছতার জন্য সর্বশেষ আপডেট টাইমস্ট্যাম্প
  - সব ডিভাইস টাইপের জন্য মোবাইল-রেস্পনসিভ ডিজাইন

#### উন্নত
- **অবকাঠামো নিরাপত্তা**: ডিপ্লয়মেন্ট ডকুমেন্টেশনে প্রিভিউ ফাংশনালিটি সার্বিকভাবে ইনটিগ্রেট করা হয়েছে
- **প্রি-ডিপ্লয়মেন্ট ভ্যালিডেশন**: অটোমেটেড স্ক্রিপ্টগুলিতে এখন অবকাঠামো প্রিভিউ টেস্টিং অন্তর্ভুক্ত
- **ডেভেলপার ওয়ার্কফ্লো**: সেরা অনুশীলন হিসাবে প্রিভিউ অন্তর্ভুক্ত করে কমান্ড সিকোয়েন্স আপডেট করা হয়েছে
- **ওয়ার্কশপ এক্সপেরিয়েন্স**: কনটেন্ট ডেভেলপমেন্ট স্টেটাস সম্পর্কে ব্যবহারকারীদের জন্য পরিষ্কার প্রত্যাশা স্থাপন

#### পরিবর্তন
- **ডিপ্লয়মেন্ট সেরা অনুশীলন**: প্রিভিউ-ফার্স্ট ওয়ার্কফ্লো এখন সুপারিশকৃত পদ্ধতি
- **ডকুমেন্টেশন ফ্লো**: শেখার প্রক্রিয়ায় অবকাঠামো যাচাইকে আগের দিকে সরানো হয়েছে
- **ওয়ার্কশপ প্রদান**: পেশাদার স্ট্যাটাস যোগাযোগ এবং পরিষ্কার ডেভেলপমেন্ট টাইমলাইন

#### উন্নত করা হয়েছে
- **নিরাপত্তা-প্রাথমিক পদ্ধতি**: অবকাঠামোর পরিবর্তন ডিপ্লয়মেন্টের আগে যাচাই করা যাবে
- **টিম সহযোগিতা**: প্রিভিউ ফলাফল সমীক্ষার জন্য অংশীদারদের সঙ্গে শেয়ার করা যায়
- **কস্ট সচেতনতা**: প্রোভিশনিংয়ের আগে রিসোর্স খরচের ভাল বোঝাপড়া
- **ঝুঁকি হ্রাস**: অগ্রিম যাচাইয়ের মাধ্যমে ডিপ্লয়মেন্ট ব্যর্থতার সম্ভাবনা কমানো

#### টেকনিক্যাল ইমপ্লিমেন্টেশন
- **মাল্টি-ডকুমেন্ট ইন্টিগ্রেশন**: প্রিভিউ ফিচার 4টি মূল ফাইলে ডকুমেন্ট করা হয়েছে
- **কমান্ড প্যাটার্ন**: ডকুমেন্টেশনে ধারাবাহিক সিনট্যাক্স এবং উদাহরণ
- **সেরা অনুশীলন ইন্টিগ্রেশন**: ভ্যালিডেশান ওয়ার্কফ্লো এবং স্ক্রিপ্টে প্রিভিউ অন্তর্ভুক্ত
- **ভিজ্যুয়াল ইন্ডিকেটর**: নতুন ফিচার খুঁজে পাওয়ার জন্য স্পষ্ট NEW মার্কিং

#### ওয়ার্কশপ অবকাঠামো
- **স্ট্যাটাস কমিউনিকেশন**: গ্রেডিয়েন্ট স্টাইলিং সহ পেশাদার HTML ব্যানার
- **ব্যবহারকারীর অভিজ্ঞতা**: স্পষ্ট ডেভেলপমেন্ট স্ট্যাটাস বিভ্রন্তি রোধ করে
- **পেশাদার উপস্থাপনা**: প্রত্যাশা নির্ধারণ করে রেপোজিটরির বিশ্বাসযোগ্যতা বজায় রাখে
- **টাইমলাইন স্বচ্ছতা**: দায়বদ্ধতার জন্য October 2025 সর্বশেষ আপডেট টাইমস্ট্যাম্প

### [v3.3.0] - 2025-09-24

#### উন্নত ওয়ার্কশপ সামগ্রী এবং ইন্টারঅ্যাকটিভ শেখার অভিজ্ঞতা
**এই সংস্করণটি ব্রাউজার-ভিত্তিক ইন্টারঅ্যাক্টিভ গাইড এবং কাঠামোবদ্ধ শেখার পাথসহ বিস্তৃত ওয়ার্কশপ সামগ্রী যোগ করে।**

#### যোগ করা হয়েছে
- **🎥 ইন্টারঅ্যাক্টিভ ওয়ার্কশপ গাইড**: MkDocs প্রিভিউ সক্ষমতা সহ ব্রাউজার-ভিত্তিক ওয়ার্কশপ অভিজ্ঞতা
- **📝 কাঠামোবদ্ধ ওয়ার্কশপ নির্দেশাবলী**: আবিষ্কার থেকে কাস্টমাইজেশন পর্যন্ত 7-ধাপ নির্দেশিত শেখার পথ
  - 0-Introduction: ওয়ার্কশপ ওভারভিউ এবং সেটআপ
  - 1-Select-AI-Template: টেমপ্লেট আবিষ্কার এবং নির্বাচন প্রক্রিয়া
  - 2-Validate-AI-Template: ডিপ্লয়মেন্ট এবং ভ্যালিডেশন পদ্ধতি
  - 3-Deconstruct-AI-Template: টেমপ্লেট আর্কিটেকচার বোঝা
  - 4-Configure-AI-Template: কনফিগারেশন এবং কাস্টমাইজেশন
  - 5-Customize-AI-Template: উন্নত মডিফিকেশন এবং পুনরাবৃত্তি
  - 6-Teardown-Infrastructure: ক্লিনআপ এবং রিসোর্স ম্যানেজমেন্ট
  - 7-Wrap-up: সারসংক্ষেপ এবং পরবর্তী পদক্ষেপ
- **🛠️ ওয়ার্কশপ টুলিং**: উন্নত শেখার অভিজ্ঞতার জন্য Material থিমসহ MkDocs কনফিগারেশন
- **🎯 হ্যান্ডস-অন লার্নিং পাথ**: 3-ধাপ পদ্ধতি (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces ইন্টিগ্রেশন**: নির্বিঘ্ন ডেভেলপমেন্ট এনভায়রনমেন্ট সেটআপ

#### উন্নত
- **AI ওয়ার্কশপ ল্যাব**: বিস্তৃত 2-3 ঘন্টার কাঠামোবদ্ধ শেখার অভিজ্ঞতা সহ এক্সটেন্ডেড
- **ওয়ার্কশপ ডকুমেন্টেশন**: ন্যাভিগেশন এবং ভিজ্যুয়াল সাহায্যসহ পেশাদার উপস্থাপনা
- **শেখার অগ্রগতি**: টেমপ্লেট নির্বাচন থেকে প্রোডাকশনে ডিপ্লয়মেন্ট পর্যন্ত স্পষ্ট ধাপে-ধাপে নির্দেশনা
- **ডেভেলপার অভিজ্ঞতা**: স্ট্রীমলাইনড ডেভেলপমেন্ট ওয়ার্কফ্লো জন্য ইন্টিগ্রেটেড টুলিং

#### উন্নত করা হয়েছে
- **অ্যাক্সেসিবিলিটি**: সার্চ, কপি ফাংশনালিটি, এবং থিম টগল সহ ব্রাউজার-ভিত্তিক ইন্টারফেস
- **স্ব-গতি শেখা**: বিভিন্ন শেখার গতির জন্য নমনীয় ওয়ার্কশপ কাঠামো
- **প্রায়োগিক ব্যবহার**: বাস্তব-জীবনের AI টেমপ্লেট ডিপ্লয়মেন্ট দৃশ্যকল্প
- **কোমিউনিটি ইন্টিগ্রেশন**: ওয়ার্কশপ সাপোর্ট এবং সহযোগিতার জন্য Discord ইন্টিগ্রেশন

#### ওয়ার্কশপ বৈশিষ্ট্য
- **বিল্ট-ইন সার্চ**: দ্রুত কীওয়ার্ড এবং লেসন আবিষ্কার
- **কপি কোড ব্লক**: সমস্ত কোড উদাহরণে hover-to-copy ফাংশনালিটি
- **থিম টগল**: বিভিন্ন পছন্দের জন্য ডার্ক/লাইট মোড সমর্থন
- **ভিজ্যুয়াল অ্যাসেটস**: উন্নত বোঝাপড়ার জন্য স্ক্রিনশট এবং ডায়াগ্রাম
- **হেল্প ইন্টিগ্রেশন**: কমিউনিটি সাপোর্টের জন্য সরাসরি Discord অ্যাক্সেস

### [v3.2.0] - 2025-09-17

#### প্রধান ন্যাভিগেশন পুনর্গঠন এবং অধ্যায়-ভিত্তিক শেখার সিস্টেম
**এই সংস্করণটি পুরো রেপোজিটরিকে একটি বিস্তৃত অধ্যায়-ভিত্তিক শেখার কাঠামোতে রিডিজাইন করে এবং সারাবিশ্বে ন্যাভিগেশন উন্নত করে।**

#### যোগ করা হয়েছে
- **📚 অধ্যায়-ভিত্তিক শেখার সিস্টেম**: পুরো কোর্সটি 8টি প্রগতি-ভিত্তিক অধ্যায়ে পুনর্গঠিত
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 ব্যাপক ন্যাভিগেশন সিস্টেম**: সমস্ত ডকুমেন্টেশনে সঙ্গত ন্যাভিগেশন হেডার এবং ফুটার
- **🎯 অগ্রগতি ট্র্যাকিং**: কোর্স সম্পন্নের চেকলিস্ট এবং শেখার যাচাই সিস্টেম
- **🗺️ শেখার পথ নির্দেশনা**: বিভিন্ন অভিজ্ঞতা স্তর এবং লক্ষ্যগুলির জন্য স্পষ্ট এন্ট্রি পয়েন্ট
- **🔗 ক্রস-রেফারেন্স ন্যাভিগেশন**: সম্পর্কিত অধ্যায় এবং প্রাক-প্রয়োজনীয়তাগুলি সুস্পষ্টভাবে লিংক করা হয়েছে

#### উন্নত
- **README স্ট্রাকচার**: অধ্যায়-ভিত্তিক সংগঠনের সাথে একটি কাঠামোবদ্ধ শেখার প্ল্যাটফর্মে পরিণত
- **ডকুমেন্টেশন ন্যাভিগেশন**: প্রতিটি পৃষ্ঠায় এখন অধ্যায় প্রসঙ্গ এবং অগ্রগতি নির্দেশনা রয়েছে
- **টেমপ্লেট সংগঠন**: উদাহরণ এবং টেমপ্লেটগুলো উপযুক্ত অধ্যায়গুলোর সাথে মিলান করা হয়েছে
- **রিসোর্স ইন্টিগ্রেশন**: চিট শিট, FAQ, এবং স্টাডি গাইডগুলো সম্পর্কিত অধ্যায়গুলোর সাথে সংযুক্ত
- **ওয়ার্কশপ ইন্টিগ্রেশন**: হ্যান্ডস-অন ল্যাবগুলি একাধিক অধ্যায় শেখার উদ্দেশ্যের সাথে মিলিত

#### পরিবর্তন
- **শেখার অগ্রগতি**: রৈখিক ডকুমেন্টেশন থেকে নমনীয় অধ্যায়-ভিত্তিক শেখায় স্থানান্তর
- **কনফিগারেশন প্লেসমেন্ট**: ভাল শেখার প্রবাহের জন্য কনফিগারেশন গাইডকে Chapter 3 হিসাবে পুনঃস্থাপন
- **AI কন্টেন্ট ইন্টিগ্রেশন**: শেখার যাত্রায় AI-নির্দিষ্ট কন্টেন্টের ভাল ইন্টিগ্রেশন
- **প্রোডাকশন কন্টেন্ট**: এন্টারপ্রাইজ শিখনার্থীদের জন্য উন্নত প্যাটার্নগুলো Chapter 8-এ সংহত

#### উন্নত করা হয়েছে
- **ব্যবহারকারীর অভিজ্ঞতা**: পরিষ্কার ন্যাভিগেশন ব্রেডক্রাম্ব এবং অধ্যায় অগ্রগতি নির্দেশক
- **অ্যাক্সেসিবিলিটি**: সহজতর কোর্স ট্র্যাভার্সালের জন্য কনসিস্টেন্ট ন্যাভিগেশন প্যাটার্ন
- **পেশাদার উপস্থাপনা**: একাডেমিক এবং কর্পোরেট প্রশিক্ষণের জন্য উপযুক্ত ইউনিভার্সিটি-স্টাইল কোর্স স্ট্রাকচার
- **শেখার দক্ষতা**: উন্নত সংগঠনের মাধ্যমে প্রাসঙ্গিক কন্টেন্ট খুঁজে পাওয়ার সময় কমানো

#### টেকনিক্যাল ইমপ্লিমেন্টেশন
- **ন্যাভিগেশন হেডার**: 40+ ডকুমেন্টেশন ফাইলে স্ট্যান্ডার্ডাইজড অধ্যায় ন্যাভিগেশন
- **ফুটার ন্যাভিগেশন**: ধারাবাহিক অগ্রগতি নির্দেশনা এবং অধ্যায় সম্পন্ন ইন্ডিকেটর
- **ক্রস-লিংকিং**: সম্পর্কিত ধারণাগুলো সংযুক্ত করার জন্য ব্যাপক অভ্যন্তরীণ লিংকিং সিস্টেম
- **অধ্যায় মানচিত্রণ**: টেমপ্লেট এবং উদাহরণগুলো শেখার উদ্দেশ্যগুলোর সাথে স্পষ্টভাবে সম্পর্কযুক্ত

#### স্টাডি গাইড উন্নতি
- **📚 বিস্তৃত শেখার লক্ষ্য**: 8-অধ্যায় সিস্টেমের সাথে সামঞ্জস্যপূর্ণ করে স্টাডি গাইড পুনর্গঠিত
- **🎯 অধ্যায়ভিত্তিক মূল্যায়ন**: প্রতিটি অধ্যায়ে নির্দিষ্ট শেখার লক্ষ্য এবং প্রায়োগিক অনুশীলন রয়েছে
- **📋 অগ্রগতি ট্র্যাকিং**: পরিমাপযোগ্য ফলাফল এবং সম্পন্ন চেকলিস্ট সহ সাপ্তাহিক শেখার সময়সূচি
- **❓ মূল্যায়ন প্রশ্ন**: প্রতিটি অধ্যায়ের জন্য জ্ঞান যাচাই প্রশ্নপত্র পেশাদার ফলাফল সহ
- **🛠️ প্রায়োগিক অনুশীলন**: বাস্তব ডিপ্লয়মেন্ট দৃশ্যকল্প এবং ডিবাগিং সহ হ্যান্ডস-অন কার্যক্রম
- **📊 দক্ষতা অগ্রগতি**: প্রাথমিক ধারণা থেকে এন্টারপ্রাইজ প্যাটার্ন পর্যন্ত স্পষ্ট উন্নতি এবং ক্যারিয়ার উন্নয়ন ফোকাস
- **🎓 সাটিফিকেশন ফ্রেমওয়ার্ক**: পেশাদার উন্নয়ন ফলাফল এবং কমিউনিটি স্বীকৃতি ব্যবস্থাপনা
- **⏱️ সময়রেখা ব্যবস্থাপনা**: মাইলস্টোন যাচাই সহ কাঠামোবদ্ধ 10-সপ্তাহীয় শেখার পরিকল্পনা

### [v3.1.0] - 2025-09-17

#### উন্নত মাল্টি-এজেন্ট AI সলিউশন
**এই সংস্করণ রিটেইল মাল্টি-এজেন্ট সলিউশনকে উন্নত করে ভাল এজেন্ট নামকরণ এবং উন্নত ডকুমেন্টেশনের মাধ্যমে।**

#### পরিবর্তন
- **মাল্টি-এজেন্ট টার্মিনোলজি**: রিটেইল মাল্টি-এজেন্ট সলিউশনের সারা জুড়ে "Cora agent" পরিবর্তে "Customer agent" ব্যবহার করা হয়েছে স্পষ্টতার জন্য
- **এজেন্ট আর্কিটেকচার**: সঙ্গত ডকুমেন্টেশন, ARM টেমপ্লেট, এবং কোড উদাহরণগুলোতে consistent "Customer agent" নামকরণ আপডেট করা হয়েছে
- **কনফিগারেশন উদাহরণ**: আপডেটেড নামকরণ কনভেনশনসহ আধুনিক এজেন্ট কনফিগারেশন প্যাটার্ন
- **ডকুমেন্টেশন কনসিস্টেন্সি**: নিশ্চিত করা হয়েছে যে সমস্ত রেফারেন্স পেশাদার, বর্ণনামূলক এজেন্ট নাম ব্যবহার করে

#### উন্নত
- **ARM টেমপ্লেট প্যাকেজ**: retail-multiagent-arm-template আপডেট করা হয়েছে Customer agent রেফারেন্সসহ
- **আর্কিটেকচার ডায়াগ্রাম**: আপডেটেড এজেন্ট নামকরণসহ Mermaid ডায়াগ্রাম রিফ্রেশ করা হয়েছে
- **কোড উদাহরণ**: Python ক্লাস এবং ইমপ্লিমেন্টেশন উদাহরণগুলো এখন CustomerAgent নামকরণ ব্যবহার করে
- **এনভায়রনমেন্ট ভ্যারিয়েবল**: সমস্ত ডিপ্লয়মেন্ট স্ক্রিপ্টে CUSTOMER_AGENT_NAME কনভেনশন ব্যবহার করা হয়েছে

#### উন্নত করা হয়েছে
- **ডেভেলপার অভিজ্ঞতা**: ডকুমেন্টেশনে এজেন্টগুলোর ভূমিকা ও দায়িত্ব স্পষ্টতর
- **প্রোডাকশন রেডিনেস**: এন্টারপ্রাইজ নামকরণ কনভেনশনের সাথে ভাল মিল
- **শিক্ষণ উপকরণ**: শিক্ষাগত উদ্দেশ্যে আরও বোধগম্য এজেন্ট নামকরণ
- **টেমপ্লেট ব্যবহারযোগ্যতা**: এজেন্ট কার্যকারিতা এবং ডিপ্লয়মেন্ট প্যাটার্ন সহজে বোঝার যোগ্য

#### টেকনিক্যাল ডিটেইলস
- Mermaid আর্কিটেকচার ডায়াগ্রামে CustomerAgent রেফারেন্স আপডেট করা হয়েছে
- Python উদাহরণে CoraAgent ক্লাস নামগুলিকে CustomerAgent দিয়ে প্রতিস্থাপন করা হয়েছে
- ARM টেমপ্লেট JSON কনফিগারেশনগুলো "customer" এজেন্ টটাইপ ব্যবহার করার জন্য পরিবর্তিত
- এনভায়রনমেন্ট ভ্যারিয়েবলগুলো CORA_AGENT_* থেকে CUSTOMER_AGENT_* প্যাটার্নে আপডেট করা হয়েছে
- সমস্ত ডিপ্লয়মেন্ট কমান্ড এবং কন্টেইনার কনফিগারেশন রিফ্রেশ করা হয়েছে

### [v3.0.0] - 2025-09-12

#### প্রধান পরিবর্তন - AI ডেভেলপার ফোকাস এবং Microsoft Foundry ইন্টিগ্রেশন
**এই সংস্করণ রেপোজিটরিকে একটি বিস্তৃত AI-ফোকাসড শেখার রিসোর্সে রূপান্তর করে Microsoft Foundry ইন্টিগ্রেশনসহ।**

#### যোগ করা হয়েছে
- **🤖 AI-First লার্নিং পাথ**: AI ডেভেলপার এবং ইঞ্জিনিয়ারদের অগ্রাধিকার দিয়ে সম্পূর্ণ রিডিরেকশন
- **Microsoft Foundry Integration Guide**: AZD কে Microsoft Foundry সার্ভিসগুলোর সাথে সংযুক্ত করার ব্যাপক ডকুমেন্টেশন
- **AI মডেল ডিপ্লয়মেন্ট প্যাটার্ন**: মডেল নির্বাচন, কনফিগারেশন এবং প্রোডাকশনে ডিপ্লয়মেন্ট কৌশল কভার করে বিস্তারিত গাইড
- **AI Workshop Lab**: 2-3 ঘণ্টার হ্যান্ডস-অন ওয়ার্কশপ AI অ্যাপ্লিকেশনগুলোকে AZD-ডিপ্লয়েবল সলিউশনে রূপান্তর করার জন্য
- **Production AI Best Practices**: AI ওয়ার্কলোডগুলো স্কেল, মনিটর এবং সুরক্ষার জন্য এন্টারপ্রাইজ-রেডি প্যাটার্নসমূহ
- **AI-Specific Troubleshooting Guide**: Microsoft Foundry Models, Cognitive Services, এবং AI ডিপ্লয়মেন্ট সমস্যার জন্য বিস্তৃত ট্রাবলশুটিং গাইড
- **AI Template Gallery**: জটিলতা রেটিংসহ Microsoft Foundry টেমপ্লেটগুলোর নির্বাচিত সংগ্রহ
- **Workshop Materials**: পূর্ণ ওয়ার্কশপ স্ট্রাকচার হ্যান্ডস-অন ল্যাব এবং রেফারেন্স মেটারিয়ালসহ

#### Enhanced
- **README Structure**: AI-ডেভেলপার-কেন্দ্রিক, Microsoft Foundry Discord থেকে 45% কমিউনিটি ইন্টারেস্ট ডেটা সহ
- **Learning Paths**: স্টুডেন্ট এবং DevOps ইঞ্জিনিয়ারের জন্য প্রচলিত পাথগুলোর পাশাপাশি নিবেদিত AI ডেভেলপার জার্নি
- **Template Recommendations**: নির্বাচিত AI টেমপ্লেটসমূহ যার মধ্যে azure-search-openai-demo, contoso-chat, এবং openai-chat-app-quickstart অন্তর্ভুক্ত
- **Community Integration**: AI-নির্দিষ্ট চ্যানেল ও আলোচনা সহ উন্নত Discord কমিউনিটি সাপোর্ট

#### Security & Production Focus
- **Managed Identity Patterns**: AI-নির্দিষ্ট অথেনটিকেশন এবং সিকিউরিটি কনফিগারেশনসমূহ
- **Cost Optimization**: AI ওয়ার্কলোডগুলোর টোকেন ব্যবহার ট্র্যাকিং এবং বাজেট নিয়ন্ত্রণ
- **Multi-Region Deployment**: গ্লোবাল AI অ্যাপ্লিকেশন ডিপ্লয়মেন্টের কৌশলসমূহ
- **Performance Monitoring**: AI-নির্দিষ্ট মেট্রিক্স এবং Application Insights ইন্টিগ্রেশন

#### Documentation Quality
- **Linear Course Structure**: শুরু থেকে উন্নত AI ডিপ্লয়মেন্ট প্যাটার্ন পর্যন্ত যুক্তিযুক্ত অগ্রগতি
- **Validated URLs**: সব এক্সটার্নাল রিপোজিটরি লিঙ্ক যাচাইকৃত এবং অ্যাক্সেসযোগ্য
- **Complete Reference**: সব ইন্টারনাল ডকুমেন্টেশন লিঙ্ক যাচাইকৃত এবং কার্যকর
- **Production Ready**: বাস্তব-জগতের উদাহরণসহ এন্টারপ্রাইজ ডিপ্লয়মেন্ট প্যাটার্নসমূহ

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**এই সংস্করণ রিপোজিটরি স্ট্রাকচার এবং কনটেন্ট উপস্থাপনার একটি গুরুত্বপূর্ণ সংস্কারের প্রতিনিধিত্ব করে।**

#### Added
- **Structured Learning Framework**: সব ডকুমেন্টেশন পৃষ্ঠায় এখন Introduction, Learning Goals, এবং Learning Outcomes সেকশন অন্তর্ভুক্ত
- **Navigation System**: গাইডেড লার্নিং অগ্রগতির জন্য সারা ডকুমেন্টেশনে Previous/Next লেসন লিঙ্ক যোগ করা হয়েছে
- **Study Guide**: learning objectives, practice exercises, এবং assessment materials সহ ব্যাপক study-guide.md
- **Professional Presentation**: উন্নত অ্যাক্সেসিবিলিটি এবং প্রফেশনাল চেহারা নিশ্চিত করতে সব ইমোজি আইকন সরানো হয়েছে
- **Enhanced Content Structure**: লার্নিং মেটারিয়ালগুলোর সংগঠনের এবং প্রবাহে উন্নতি করা হয়েছে

#### Changed
- **Documentation Format**: সব ডকুমেন্টেশনকে স্ট্যান্ডার্ডাইজড করা হয়েছে একটি সম্মিলিত লার্নিং-ফোকাসড স্ট্রাকচারে
- **Navigation Flow**: সব লার্নিং মেটারিয়ালে যৌক্তিক অগ্রগতি বাস্তবায়িত হয়েছে
- **Content Presentation**: পরিষ্কার, প্রফেশনাল ফরম্যাটিংয়ের পক্ষে ডেকোরেটিভ উপাদানগুলো সরানো হয়েছে
- **Link Structure**: নতুন নেভিগেশন সিস্টেম সমর্থনের জন্য সব ইন্টারনাল লিংক আপডেট করা হয়েছে

#### Improved
- **Accessibility**: স্ক্রিন রিডারের জন্য ইমোজি নির্ভরতা সরিয়ে উন্নতি করা হয়েছে
- **Professional Appearance**: এন্টারপ্রাইজ লার্নিংয়ের উপযোগী ক্লিন, একাডেমিক স্টাইলের উপস্থাপনা
- **Learning Experience**: প্রতিটি লেসনের জন্য স্পষ্ট উদ্দেশ্য এবং আউটকাম সহ স্ট্রাকচারড অ্যাপ্রোচ
- **Content Organization**: সম্পর্কিত টপিকগুলোর মধ্যে ভাল যৌক্তিক প্রবাহ এবং সংযোগ

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - সম্পূর্ণ getting-started গাইড সিরিজ
  - সম্পূর্ণ ডিপ্লয়মেন্ট এবং প্রোভিশনিং ডকুমেন্টেশন
  - বিস্তারিত ট্রাবলশুটিং রিসোর্স এবং ডিবাগিং গাইড
  - প্রি-ডিপ্লয়মেন্ট ভ্যালিডেশন টুল এবং প্রক্রিয়া

- **Getting Started Module**
  - AZD Basics: মূল ধারণা এবং টার্মিনোলজি
  - Installation Guide: প্ল্যাটফর্ম-নির্দিষ্ট সেটআপ নির্দেশাবলী
  - Configuration Guide: পরিবেশ সেটআপ এবং অথেনটিকেশন
  - First Project Tutorial: ধাপে ধাপে হ্যান্ডস-অন লার্নিং

- **Deployment and Provisioning Module**
  - Deployment Guide: সম্পূর্ণ ওয়ার্কফ্লো ডকুমেন্টেশন
  - Provisioning Guide: Bicep সহ Infrastructure as Code
  - প্রোডাকশন ডিপ্লয়মেন্টের জন্য বেস্ট প্র্যাকটিস
  - মাল্টি-সার্ভিস আর্কিটেকচার প্যাটার্নসমূহ

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure রিসোর্সের উপলভ্যতা যাচাই
  - SKU Selection: সার্ভিস টিয়ার নির্দেশিকা
  - Pre-flight Checks: অটোমেটেড ভ্যালিডেশন স্ক্রিপ্ট (PowerShell এবং Bash)
  - কস্ট এস্টিমেশন এবং বাজেট পরিকল্পনা টুলস

- **Troubleshooting Module**
  - Common Issues: ঘন ঘন দেখা যায় এমন সমস্যা এবং সমাধান
  - Debugging Guide: সিস্টেম্যাটিক ট্রাবলশুটিং পদ্ধতি
  - অ্যাডভান্সড ডায়াগনস্টিক কৌশল এবং টুলস
  - পারফরম্যান্স মনিটরিং এবং অপ্টিমাইজেশন

- **Resources and References**
  - Command Cheat Sheet: প্রয়োজনীয় কমান্ডগুলোর দ্রুত রেফারেন্স
  - Glossary: বিস্তৃত টার্মিনোলজি এবং এক্রোনিম সংজ্ঞা
  - FAQ: সাধারণ প্রশ্নের বিশদ উত্তর
  - এক্সটার্নাল রিসোর্স লিংক এবং কমিউনিটি সংযোগসমূহ

- **Examples and Templates**
  - Simple Web Application উদাহরণ
  - Static Website ডিপ্লয়মেন্ট টেমপ্লেট
  - Container Application কনফিগারেশন
  - Database ইন্টিগ্রেশন প্যাটার্ন
  - Microservices আর্কিটেকচার উদাহরণ
  - Serverless ফাংশন ইমপ্লিমেন্টেশন

#### Features
- **Multi-Platform Support**: Windows, macOS, এবং Linux এর জন্য ইনস্টলেশন ও কনফিগারেশন গাইড
- **Multiple Skill Levels**: স্টুডেন্ট থেকে প্রফেশনাল ডেভেলপার পর্যন্ত ডিজাইন করা কনটেন্ট
- **Practical Focus**: হ্যান্ডস-অন উদাহরণ এবং বাস্তব-জগতের সিনারিও
- **Comprehensive Coverage**: বেসিক ধারণা থেকে উন্নত এন্টারপ্রাইজ প্যাটার্ন পর্যন্ত
- **Security-First Approach**: সারাক্ষণ সিকিউরিটি বেস্ট প্র্যাকটিস একত্রীকৃত
- **Cost Optimization**: খরচ-কার্যকর ডিপ্লয়মেন্ট এবং রিসোর্স ম্যানেজমেন্টের নির্দেশিকা

#### Documentation Quality
- **Detailed Code Examples**: ব্যবহারিক, টেস্ট করা কোড স্যাম্পল
- **Step-by-Step Instructions**: পরিষ্কার, কার্যকর নির্দেশনা
- **Comprehensive Error Handling**: সাধারণ সমস্যার ট্রাবলশুটিং
- **Best Practices Integration**: ইন্ডাস্ট্রি স্ট্যান্ডার্ড এবং সুপারিশসমূহ
- **Version Compatibility**: সর্বশেষ Azure সার্ভিস এবং azd ফিচারের সাথে আপ-টু-ডেট

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Hugging Face, Azure Machine Learning, এবং কাস্টম মডেলের ইন্টিগ্রেশন প্যাটার্ন
- **AI Agent Frameworks**: LangChain, Semantic Kernel, এবং AutoGen ডিপ্লয়মেন্টগুলোর জন্য টেমপ্লেট
- **Advanced RAG Patterns**: Azure AI Search ছাড়াও Pinecone, Weaviate ইত্যাদি ভেক্টর ডাটাবেস অপশন
- **AI Observability**: মডেল পারফরম্যান্স, টোকেন ব্যবহার, এবং রেস্পন্স কোয়ালিটির জন্য উন্নত মনিটরিং

#### Developer Experience
- **VS Code Extension**: সংশ্লিষ্ট AZD + Microsoft Foundry ডেভেলপমেন্ট অভিজ্ঞতা
- **GitHub Copilot Integration**: AI-সহায়ক AZD টেমপ্লেট জেনারেশন
- **Interactive Tutorials**: AI সিনারিওর জন্য অটোমেটেড ভ্যালিডেশন সহ হ্যান্ডস-অন কোডিং এক্সারসাইজ
- **Video Content**: AI ডিপ্লয়মেন্টে মনোনিবেশ করে ভিজ্যুয়াল লার্নারদের জন্য পরিপূরক ভিডিও টিউটোরিয়াল

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI মডেল গভর্ন্যান্স, কমপ্লায়েন্স, এবং অডিট ট্রেইল
- **Multi-Tenant AI**: বিচ্ছিন্ন AI সার্ভিস দিয়ে একাধিক কাস্টমার সার্ভ করার প্যাটার্ন
- **Edge AI Deployment**: Azure IoT Edge এবং কনটেইনার ইনস্ট্যান্সের সাথে ইন্টিগ্রেশন
- **Hybrid Cloud AI**: AI ওয়ার্কলোডের জন্য মাল্টি-ক্লাউড এবং হাইব্রিড ডিপ্লয়মেন্ট প্যাটার্ন

#### Advanced Features
- **AI Pipeline Automation**: Azure Machine Learning পাইপলাইনের সাথে MLOps ইন্টিগ্রেশন
- **Advanced Security**: Zero-trust প্যাটার্ন, প্রাইভেট এন্ডপয়েন্ট, এবং উন্নত থ্রাট প্রোটেকশন
- **Performance Optimization**: উচ্চ-থ্রুপুট AI অ্যাপ্লিকেশনের জন্য উন্নত টিউনিং এবং স্কেলিং কৌশল
- **Global Distribution**: AI অ্যাপ্লিকেশনের জন্য কনটেন্ট ডেলিভারি এবং এজ ক্যাশিং প্যাটার্ন

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: বিস্তৃত Microsoft Foundry ইন্টিগ্রেশন (Completed)
- ✅ **Interactive Tutorials**: হ্যান্ডস-অন AI ওয়ার্কশপ ল্যাব (Completed)
- ✅ **Advanced Security Module**: AI-নির্দিষ্ট সিকিউরিটি প্যাটার্ন (Completed)
- ✅ **Performance Optimization**: AI ওয়ার্কলোড টিউনিং কৌশল (Completed)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI-ফোকাসড ডিপ্লয়মেন্ট সিনারিও (Completed)
- ✅ **Extended FAQ**: AI-নির্দিষ্ট প্রশ্ন এবং ট্রাবলশুটিং (Completed)
- **Tool Integration**: উন্নত IDE এবং এডিটর ইন্টিগ্রেশন গাইড
- ✅ **Monitoring Expansion**: AI-নির্দিষ্ট মনিটরিং এবং এলার্টিং প্যাটার্ন (Completed)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: মোবাইল লার্নিংয়ের জন্য রেসপনসিভ ডিজাইন
- **Offline Access**: ডাউনলোডযোগ্য ডকুমেন্টেশন প্যাকেজ
- **Enhanced IDE Integration**: AZD + AI ওয়ার্কফ্লোয়ের জন্য VS Code এক্সটেনশন
- **Community Dashboard**: রিয়েল-টাইম কমিউনিটি মেট্রিক্স এবং কন্ট্রিবিউশন ট্র্যাকিং

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

### Change Categories

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

### Semantic Versioning Guidelines

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

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Report problems or suggest improvements (AI-specific issues welcome)
- **Discord Discussions**: Share ideas and engage with the Microsoft Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates and guides
- **Microsoft Foundry Discord**: Participate in #Azure channel for AZD + AI discussions
- **Community Forums**: Participate in broader Azure developer discussions

### Feedback Categories
- **AI Content Accuracy**: Corrections to AI service integration and deployment information
- **Learning Experience**: Suggestions for improved AI developer learning flow
- **Missing AI Content**: Requests for additional AI templates, patterns, or examples
- **Accessibility**: Improvements for diverse learning needs
- **AI Tool Integration**: Suggestions for better AI development workflow integration
- **Production AI Patterns**: Enterprise AI deployment pattern requests

### Response Commitment
- **Issue Response**: Within 48 hours for reported problems
- **Feature Requests**: Evaluation within one week
- **Community Contributions**: Review within one week
- **Security Issues**: Immediate priority with expedited response

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Content accuracy and link validation
- **Quarterly Updates**: Major content additions and improvements
- **Semi-Annual Reviews**: Comprehensive restructuring and enhancement
- **Annual Releases**: Major version updates with significant improvements

### Monitoring and Quality Assurance
- **Automated Testing**: Regular validation of code examples and links
- **Community Feedback Integration**: Regular incorporation of user suggestions
- **Technology Updates**: Alignment with latest Azure services and azd releases
- **Accessibility Audits**: Regular review for inclusive design principles

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Full support with regular updates
- **Previous Major Version**: Security updates and critical fixes for 12 months
- **Legacy Versions**: Community support only, no official updates

### Migration Guidance
When major versions are released, we provide:
- **Migration Guides**: Step-by-step transition instructions
- **Compatibility Notes**: Details about breaking changes
- **Tool Support**: Scripts or utilities to assist with migration
- **Community Support**: Dedicated forums for migration questions

---

**Navigation**
- **Previous Lesson**: [Study Guide](resources/study-guide.md)
- **Next Lesson**: Return to [Main README](README.md)

**Stay Updated**: Watch this repository for notifications about new releases and important updates to the learning materials.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->