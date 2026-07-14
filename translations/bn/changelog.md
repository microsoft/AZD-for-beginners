# চেঞ্জলগ - AZD ফর বিগিনার্স

## পরিচিতি

এই চেঞ্জলগ AZD ফর বিগিনারস রেপোজিটরির সকল গুরুত্বপূর্ণ পরিবর্তন, আপডেট এবং উন্নতির নথি রাখে। আমরা সেমান্টিক ভার্সনিং নীতিমালা অনুসরণ করি এবং ব্যবহারকারীদের ভার্সনের মধ্যে কি পরিবর্তন হয়েছে তা বোঝাতে এই লগ রক্ষা করি।

## শেখার লক্ষ্য

এই চেঞ্জলগ পর্যালোচনা করে, আপনি:
- নতুন ফিচার এবং কনটেন্ট যোগ সম্পর্কে অবগত থাকবেন
- বিদ্যমান ডকুমেন্টেশনে করা উন্নতিগুলো বুঝতে পারবেন
- বাগ ফিক্স এবং সংশোধনগুলি ট্র্যাক করতে পারবেন যা নির্ভুলতা নিশ্চিত করে
- শিক্ষণ সামগ্রীর আধুনিকতাকে সময়ের মাঝে অনুসরণ করতে পারবেন

## শেখার ফলাফল

চেঞ্জলগ এন্ট্রিগুলো পর্যালোচনা করার পর, আপনি সক্ষম হবেন:
- শেখার জন্য নতুন কনটেন্ট এবং রিসোর্স সনাক্ত করতে
- কোন সেকশনসমূহ আপডেট বা উন্নত হয়েছে তা বুঝতে
- সর্বশেষ সামগ্রীর উপর ভিত্তি করে আপনার শেখার পথ পরিকল্পনা করতে
- ভবিষ্যতের উন্নতিগুলির জন্য প্রতিক্রিয়া এবং পরামর্শ প্রদান করতে

## ভার্সন ইতিহাস

### [v3.23.0] - ২০২৬-০৭-১৩

#### AZD 1.27.1 রিফ্রেশ: ভার্সন কারেন্সি আপডেট
**এই ভার্সনটি কোর্সকে `azd` `1.27.1` (জুলাই ২০২৬, সর্বশেষ স্থিতিশীল রিলিজ) এবং বর্তমান প্রিভিউ AI এজেন্ট এক্সটেনশন `azure.ai.agents` `1.0.0-beta.5` এর বিরুদ্ধে পুনঃপ্রমাণিত করে, 1.26.0, 1.27.0, এবং 1.27.1 রিলিজগুলির পর প্রতিটি "ভ্যালিডেটেড এগেইনস্ট" ব্যানার আপ টু ডেট নিয়ে আসে।**

#### পরিবর্তিত
- **✅ ভ্যালিডেশন বেসলাইন আপডেট** হয়েছে `azd 1.25.6` (জুন ২০২৬) থেকে `azd 1.27.1` (জুলাই ২০২৬) সার্বিক README, সকল অধ্যায়ের README, অধ্যায় ১ ডেভ-কন্টেইনার লেসন (পিন্ড-ভার্সন উদাহরণসহ), অধ্যায় ৪ কাস্টম-টেমপ্লেট লেসন, অধ্যায় ৫ মাল্টি-এজেন্ট লেসন এবং ওয়ার্কশপ ডকস এ
- **🤖 অধ্যায় ২ বেসলাইন রিফ্রেশ** হয়েছে `azd 1.23.12` (মার্চ ২০২৬) থেকে `azd 1.27.1` এ `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, এবং `microsoft-foundry-integration.md` ফাইলগুলিতে; ভ্যালিডেশন-নোট তারিখগুলি ২০২৬-০৭-১৩ এ আপডেট করা হয়েছে
- **🧩 AI এজেন্ট এক্সটেনশন বাম্প** হয়েছে `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` থেকে বর্তমান `1.0.0-beta.5` রিলিজ এ অধ্যায় ২ README এবং `agents.md` এ
- **🧪 ওয়ার্কশপ ভ্যালিডেশন উদাহরণ** (`azd version` আউটপুট) আপডেট হয়েছে `1.27.1` এ

#### প্রাসঙ্গিক azd রিলিজের নোটস (1.26.0 → 1.27.1)
- **1.26.0 (২০২৬-০৬-২৪):** Azure Functions এ Flex Consumption এর জন্য Go সাপোর্ট, `azd config sub-filter` প্রতিটি ভাড়াটে সাবস্ক্রিপশন ফিল্টার, সেলফ-কনটেইন্ড এক্সটেনশন বান্ডেল (`azd x pack --bundle`), এবং `azd tool install azure-skills`
- **1.27.0 (২০২৬-০৬-৩০):** `azure.yaml` এ সরাসরি Azure AI Foundry প্রকল্প/এজেন্ট মডেলিং (Bicep বা Terraform ছাড়া ইনিট), App Service এর জন্য কনটেইনার ডিপ্লয়মেন্ট সাপোর্ট (`host: appservice` + `language: docker`), `azd extension` কমান্ডের জন্য সরাসরি `-s/--source` অপশন, এবং `azd tool uninstall`
- **1.27.1 (২০২৬-০৭-০৯):** `azd extension install` এ `--no-dependencies` ফ্ল্যাগ, ডিপ্রিকেটেড মডেলগুলি ডিফল্টভাবে ক্যাটালগ/কোটা প্রম্পট থেকে বাদ দেওয়া, এবং বেশ কয়েকটি বাগ ফিক্স

#### আপডেট করা ফাইলসমূহ
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - ২০২৬-০৬-১৬

#### বিগিনার গ্যাপ-ফিল #2: টেমপ্লেট লেখালেখি, ডেভ কন্টেইনার, পুলুমি, আজুর ডেভঅপস, সার্ভিস প্রিন্সিপালস, এবং আরও অনেক কিছু
**এই ভার্সনটি azd-কভারেজ বিশ্লেষণে উন্মোচিত অবশিষ্ট ইন্টারমিডিয়েট গ্যাপগুলো বন্ধ করে: কীভাবে নিজের টেমপ্লেট লিখবেন ও প্রকাশ করবেন, পুনরুত্পাদনযোগ্য ডেভ-কন্টেইনার/কোডস্পেস পরিবেশ, পুলুমি ইনফ্রাসট্রাকচার প্রোভাইডার, আজুর ডেভঅপস CI/CD ওয়াকথ্রু, সার্ভিস-প্রিন্সিপাল প্রমাণীকরণ, হোস্ট নির্বাচন নির্দেশিকা (AKS/Spring Apps), `azd restore`/`azd package` ব্যাখ্যা, হুক এরর-হ্যান্ডলিং, এবং দল/শেয়ারড-পরিবেশ অনুশীলন।**

#### যোগ করা হয়েছে
- **🧱 নতুন অধ্যায় ৪ লেসন** `docs/chapter-04-infrastructure/custom-templates.md` — নিজের azd টেমপ্লেট লেখালেখি: প্রয়োজনীয় কাঠামো (`azure.yaml`, `infra/`, `src/`), `metadata.template` ফিল্ড, `uniqueString()` রিসোর্স টোকেন এবং `azd-env-name` ট্যাগ দিয়ে পরিকাঠামো প্যারামিটারাইজেশন, লোকালি `azd init --template <local-path>` দিয়ে পরীক্ষা, GitHub এ প্রকাশ এবং Awesome AZD গ্যালারীতে জমা দেওয়া
- **📦 নতুন অধ্যায় ১ লেসন** `docs/chapter-01-foundation/dev-containers.md` — ডেভ কন্টেইনার এবং GitHub Codespaces দিয়ে পুনরুত্পাদনযোগ্য azd পরিবেশ: অফিসিয়াল `ghcr.io/azure/azure-dev/azd` ফিচার ব্যবহার করে একটি ন্যূনতম `.devcontainer/devcontainer.json`, ভাষা-নির্দিষ্ট ফিচার, কনটেইনার হোস্টের জন্য `docker-in-docker`, এবং রিমোট সাইন-ইনের জন্য `azd auth login --use-device-code`
- **🧩 azd এর সাথে পুলুমি** বিভাগ `docs/chapter-04-infrastructure/provisioning.md` এ — `infra.provider: pulumi`, পুলুমি ফোল্ডার বিন্যাস, azd পরিবেশের সাথে স্ট্যাক ম্যাপিং, প্রয়োজনীয় আউটপুট/ট্যাগিং, এবং একই `azd up` / `azd down` ওয়ার্কফ্লো
- **🎯 হোস্ট-নির্বাচন নির্দেশিকা** `docs/chapter-04-infrastructure/provisioning.md` এ — `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, এবং `springapp` এর একটি বিগিনার-ফ্রেন্ডলি তুলনা, AKS বা Azure Spring Apps কখন বেছে নিতে হবে সে সম্পর্কে নির্দেশিকা
- **🛠️ আজুর ডেভঅপস CI/CD ওয়াকথ্রু** `docs/chapter-08-production/production-ai-practices.md` এ — `azd pipeline config --provider azdo`, ওয়ার্কলোড আইডেন্টিটি ফেডারেশনের মাধ্যমে সার্ভিস সংযোগ (OIDC), তৈরি হওয়া `azure-dev.yml`, এবং ভেরিয়েবল-গ্রুপ সেটআপ
- **🔑 সার্ভিস প্রিন্সিপালস (প্যাটার্ন ৪)** `docs/chapter-03-configuration/authsecurity.md` এ যোগ করা হয়েছে — `az ad sp create-for-rbac`, ক্লায়েন্ট সিক্রেট বনাম ফেডারেটেড/OIDC ক্রেডেনশিয়াল দিয়ে নন-ইন্টারেক্টিভ `azd auth login`, কখন ব্যবহার করবেন, এবং নিরাপদ ক্রেডেনশিয়াল সংরক্ষণ
- **🪝 হুক এরর-হ্যান্ডলিং** উপবিভাগ `docs/chapter-04-infrastructure/deployment-guide.md` এ — এক্সিট কোড এবং `set -e`, `continueOnError`, `azd hooks run` দিয়ে বিচ্ছিন্ন হুক পরীক্ষা, OS-নির্দিষ্ট শেল, এবং `--debug`
- **👥 দল / শেয়ারড পরিবেশ** বিভাগ `docs/chapter-03-configuration/configuration.md` এ — `.azure/` এ কি থাকে, কী গিটইগনোর করবেন, বিকাশকারীদের আলাদা পরিবেশ, `azd env list`/`select`, এবং CI/CD তে পরিবেশ মান প্রদানের নিয়মাবলী
- **🧰 `azd restore` এবং বিস্তৃত `azd package`** ব্যাখ্যা `resources/cheat-sheet.md` এ — ডিপেন্ডেন্সি পুনরুদ্ধার এবং ডিপ্লয়মেন্ট ছাড়া ডিপ্লয়েবল আর্টিফ্যাক্ট তৈরি করা

#### পরিবর্তিত
- **🧭 অধ্যায় ৪ লেসন টেবিল** নতুন "নিজের টেমপ্লেট লেখালেখি" লেসন (লেসন ৩) অন্তর্ভুক্ত করতে আপডেট করা হয়েছে
- **🧭 অধ্যায় ১ লেসন টেবিল** নতুন "ডেভ কন্টেইনার এবং কোডস্পেসেস" লেসন (লেসন ৫) অন্তর্ভুক্ত করতে আপডেট করা হয়েছে; নেভিগেশন ফুটার `bring-your-own-app.md` এবং `dev-containers.md` এর মধ্যে সংযুক্ত

### [v3.21.0] - ২০২৬-০৬-১৬

#### বিগিনার গ্যাপ-ফিল: হাতেকলমে মাল্টি-এজেন্ট লেসন, "নিজের অ্যাপ আনুন," টেরাফর্ম, এবং CI/CD ওয়াকথ্রু
**এই ভার্সনটি সম্পূর্ণ নতুনদের গাইডের সবচেয়ে বড় গ্যাপগুলি বন্ধ করে দুটি নতুন হাতেকলমের লেসন যোগ করে (একটি ডিপ্লয়েবল মাল্টি-এজেন্ট ওয়াকথ্রু এবং বিদ্যমান অ্যাপে azd যোগ করা), বিগিনার-বন্ধুত্বপূর্ণ হুকস পরিচিতি, azd সহ টেরাফর্ম সেকশন, ধাপে ধাপে GitHub Actions পাইপলাইন ওয়াকথ্রু, নতুন প্রিভিউ এক্সটেনশনের ব্যাখ্যা, এবং স্পষ্ট ডিপ্লয়মেন্ট যাচাই চেকলিস্ট।**

#### যোগ করা হয়েছে
- **🤝 নতুন অধ্যায় ৫ লেসন** `docs/chapter-05-multi-agent/multi-agent-basics.md` — একটি সম্পূর্ণ হাতেকলমের, ডিপ্লয়েবল দুই-এজেন্ট ওয়াকথ্রু (অর্কেস্ট্রেটর + স্পেশালিস্ট) একটি প্রকৃত টেমপ্লেট ব্যবহার করে (`contoso-creative-writer`), কখন মাল্টি-এজেন্ট ব্যবহার করবেন, `azd up` ওয়ার্কফ্লো, ডিপ্লয় করা রিসোর্স বোঝা, ক্রস-এজেন্ট ট্রেসিং, কাস্টমাইজেশন, এবং ক্লিনআপ কভার করে
- **📦 নতুন অধ্যায় ১ লেসন** `docs/chapter-01-foundation/bring-your-own-app.md` — বিদ্যমান প্রকল্পে azd যোগ করার পদ্ধতি `azd init` দিয়ে ("বর্তমান ডিরেক্টরির কোড ব্যবহার করুন"), `azure.yaml` এবং `infra/` বোঝা, `azd infra generate`, হোস্ট শনাক্তকরণ, এবং `azd up` দিয়ে ডিপ্লয়মেন্ট
- **🌐 azd সহ টেরাফর্ম** সেকশন যোগ করা হয়েছে `docs/chapter-04-infrastructure/provisioning.md` এ — `infra.provider: terraform` কনফিগ, `.tf` ফোল্ডার বিন্যাস, প্রয়োজনীয় `AZURE_*` আউটপুট এবং `azd-env-name` ট্যাগিং, এবং একই `azd up` / `azd down` ওয়ার্কফ্লো (একই সময়ে টেরাফর্ম সাপোর্ট দাবি করেছিল কিন্তু শুধুমাত্র বিসেপ প্রদর্শন করেছিল এমন গ্যাপ বন্ধ করে)
- **⚙️ ধাপে ধাপে GitHub Actions ওয়াকথ্রু** `docs/chapter-08-production/production-ai-practices.md` এ — GitHub রিপো থেকে স্বয়ংক্রিয় ডিপ্লয়মেন্ট: `azd pipeline config`, OIDC ফেডারেটেড ক্রেডেনশিয়াল (কোনো সংরক্ষিত সিক্রেট নয়), তৈরি হওয়া `azure-dev.yml`, এবং সিক্রেট বনাম ভেরিয়েবল নির্দেশিকা
- **🪝 বিগিনার "নিউ টু হুকস?" পরিচিতি** `docs/chapter-04-infrastructure/deployment-guide.md` এ — হুক কী, একটি হুক-পর্যায় টেবিল, একটি ন্যূনতম প্রথম হুক, এবং ম্যানুয়ালি `azd hooks run` দিয়ে হুক চালানো
- **✅ "আপনার ডিপ্লয়মেন্ট যাচাই করুন" চেকলিস্ট** `docs/chapter-01-foundation/first-project.md` এর স্টেপ ৫ এ যোগ করা হয়েছে — স্মোক টেস্ট, স্বাস্থ্য এন্ডপয়েন্ট পরীক্ষা, এবং স্পষ্ট সফলতার মানদণ্ড
- **🧩 নতুন প্রিভিউ এক্সটেনশনের ব্যাখ্যা** `azure.ai.skills` এবং `azure.ai.connections` (তারা কী এবং কখন ব্যবহার করবেন) `docs/chapter-08-production/production-ai-practices.md` এ

#### পরিবর্তিত
- **🧭 অধ্যায় ৫ লেসন টেবিল** সঠিক করা হয়েছে: `multi-agent-basics.md` এখন লেসন ১ (মात्र সম্পূর্ণ হাতেকলমের লেসন), সৎ লেবেলিং সহ যে লেসন ২ অধ্যায় ৬ এ আছে এবং রিটেইল দৃশ্যাবলী একটি আর্কিটেকচার নকশা, এক-কমান্ড টেমপ্লেট নয়
- **🧭 অধ্যায় ১ লেসন টেবিল** এখন নতুন "নিজের অ্যাপ আনুন" লেসন (লেসন ৪) অন্তর্ভুক্ত করে
- **🔗 নেভিগেশন ফুটার** আপডেট করা হয়েছে: `first-project.md` এখন ফরোয়ার্ড লিঙ্ক করে `bring-your-own-app.md` এ

#### সংশোধিত
- **🧱 "দাবি করা কিন্তু অনুপস্থিত" টেরাফর্ম গ্যাপ বন্ধ করা হয়েছে** — কোর্সটি পূর্বে টেরাফর্ম সাপোর্ট উল্লেখ করেছিল কিন্তু তা দেখায়নি
- **🔀 বিভ্রান্তিকর অধ্যায় ৫ ক্রস-লিঙ্ক সংশোধন করা হয়েছে** যা একটি পূর্ণ মাল্টি-এজেন্ট ইমপ্লিমেন্টেশন ছিল বলে ইঙ্গিত করেছিল যেখানে শুধুমাত্র একটি আর্কিটেকচার নকশা ছিল

#### আপডেট করা ফাইলসমূহ
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(নতুন)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(নতুন)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - ২০২৬-০৬-১৬

#### AZD 1.25.6 রিফ্রেশ, সম্পূর্ণ এজেন্ট লাইফসাইকেল কমান্ড এবং Aspire রিব্র্যান্ড

**এই সংস্করণটি কোর্সটিকে `azd` `1.25.6` (জুন ২০২৬) এবং `azure.ai.agents` `0.1.40-preview` এক্সটেনশনের বিরুদ্ধে পুনঃযাচাই করে, AI নির্দেশনাকে "স্ক্যাফোল্ড একটি এজেন্ট" থেকে সম্পূর্ণ এজেন্ট লাইফসাইকেল (পরীক্ষা → মূল্যায়ন → অপ্টিমাইজ → পরিদর্শন → মুছুন) বিস্তৃত করে, নতুন `azure.ai.skills` এবং `azure.ai.connections` প্রিভিউ এক্সটেনশনগুলি উপস্থাপন করে, এবং ".NET Aspire" → "Aspire" পণ্যের পুনরাবৃত্তির নোট করে।**

#### যোগ করা হয়েছে
- **🔁 সম্পূর্ণ এজেন্ট লাইফসাইকেল কভারেজ** নবীন এবং AI ইঞ্জিনিয়ারদের জন্য ডকুমেন্টেশনের মাধ্যমে:
  - `docs/chapter-01-foundation/azd-basics.md` — এক্সটেনশনস ও AI কমান্ডস বিভাগে লাইফসাইকেল টেবিল (স্ক্যাফোল্ড → পরীক্ষা → পরিমাপ → উন্নত → পরিদর্শন → পরিস্কার) যোগ করা হয়েছে
  - `docs/chapter-08-production/production-ai-practices.md` — নতুন "এজেন্ট লাইফসাইকেল পরিচালনা" বিভাগ, যা `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, এবং `delete --force` কভার করে
  - `resources/cheat-sheet.md` — AI এজেন্ট কমান্ডগুলি বর্ধিত হয়েছে `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, এবং `delete --force` সহ
- **🧩 নতুন প্রিভিউ এক্সটেনশন** ডকুমেন্টেড: `azure.ai.skills` (পুনঃব্যবহারযোগ্য এজেন্ট স্কিলস) এবং `azure.ai.connections` (Foundry কানেকশনস) এক্সটেনশন টেবিল এবং চিট শিটে যোগ করা হয়েছে
- **⏱️ প্রতিক্রিয়া-সময় নির্দেশিকা** — `azd ai agent invoke` উদাহরণগুলি এখন মোট বিলম্ব এবং প্রথম বাইটের সময় প্রদর্শন করার কথা উল্লেখ করে
- **📌 সংস্করণ ব্যানার** মূল README-তে শিক্ষার্থীদের `azd version` এবং `azd upgrade` নির্দেশ করে

#### পরিবর্তিত হয়েছে
- **✅ যাচাইয়ের বেসলাইন আপডেট** হয়েছে `azd 1.23.12` (মার্চ ২০২৬) থেকে `azd 1.25.6` (জুন ২০২৬) সমস্ত অধ্যায় README এবং ওয়ার্কশপ ডকুমেন্টেশনে
- **🤖 অধ্যায় ২ এক্সটেনশন নোট আপডেট** হয়েছে `azure.ai.agents` `0.1.18-preview` থেকে `0.1.40-preview` এ
- **🧪 ওয়ার্কশপ যাচাই উদাহরণ** (`azd version` আউটপুট) আপডেট হয়েছে `1.25.6` এ
- **🧭 README "আজকের azd-এ কী নতুন"** রিফ্রেশ হয়েছে সম্পূর্ণ এজেন্ট লাইফসাইকেল, নতুন AI এক্সটেনশন, এবং সাম্প্রতিক জীবনমান উন্নতিগুলি হাইলাইট করতে (`azd init` অনাবৃতিত্ব, `azd auth login` মেয়াদোত্তীর্ণ টোকেন পরিষ্কার, `azd tool` প্রথম-চালানোর প্রম্পট)
- **📖 অধ্যায় ২ agents.md (অপশন ৪)** এখন শিক্ষার্থীদেরকে `azd up` থেমে না থেকে পোস্ট-ডিপ্লয় লাইফসাইকেল কমান্ডে নির্দেশ করে

#### সংশোধিত
- **🏷️ পণ্যের নামকরণ** — Aspire পুনরাবৃত্তি নোট যোগ করা হয়েছে (".NET Aspire" এখন শুধুমাত্র "Aspire"); azd-এর Aspire সমর্থন অপরিবর্তিত
- **🔎 লাইভ রিলিজ যাচাই** নিশ্চিত হয়েছে Azure Developer CLI রিলিজ ফিডের বিরুদ্ধে: স্টেবল CLI `1.25.6` (2026-06-12) এবং `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### ফাইল আপডেট হয়েছে
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

#### নবীন অনবোর্ডিং স্পষ্টীকরণ, সেটআপ যাচাই এবং শেষ AZD কমান্ড পরিস্কার
**এই সংস্করণটি AZD 1.23 যাচাই পরবর্তী নবীন-কেন্দ্রিক ডকুমেন্টেশন পাস অনুসরণ করে: এটি AZD-প্রথম প্রমাণীকরণ নির্দেশিকা স্পষ্ট করে, স্থানীয় সেটআপ যাচাই স্ক্রিপ্ট যোগ করে, লাইভ AZD CLI-এর বিরুদ্ধে গুরুত্বপূর্ণ কমান্ড যাচাই করে, এবং চেঞ্জলগের বাইরে শেষ পুরোনো ইংরেজি উৎস কমান্ড রেফারেন্স অপসারণ করে।**

#### যোগ করা হয়েছে
- **🧪 নবীন সেটআপ যাচাই স্ক্রিপ্ট** `validate-setup.ps1` এবং `validate-setup.sh` দিয়ে যাতে শিক্ষার্থীরা অধ্যায় ১ শুরু করার আগে প্রয়োজনীয় টুলগুলির নিশ্চয়তা পায়
- **✅ প্রাথমিক সেটআপ যাচাই ধাপ** মূল README এবং অধ্যায় ১ README-তে, যাতে মিসিং প্রয়োজনীয়তা `azd up` এর আগে ধরা পড়ে

#### পরিবর্তিত হয়েছে
- **🔐 নবীন প্রমাণীকরণ নির্দেশিকা** এখন ধারাবাহিকভাবে `azd auth login` কে AZD ওয়ার্কফ্লোর প্রধান পথ হিসেবে বিবেচনা করে, যেখানে `az login` ঐচ্ছিক হিসাবে উল্লেখ রয়েছে যতক্ষণ না Azure CLI কমান্ড সরাসরি ব্যবহৃত হয়
- **📚 অধ্যায় ১ অনবোর্ডিং প্রবাহ** এখন শিক্ষার্থীদেরকে ইনস্টলেশন, প্রমাণীকরণ এবং প্রথম ডিপ্লয়মেন্ট ধাপের আগে স্থানীয় সেটআপ যাচাই করতে নির্দেশ দেয়
- **🛠️ ভ্যালিডেটর মেসেজিং** এখন স্পষ্টভাবে বাধা দেওয়া প্রয়োজনীয়তা এবং ঐচ্ছিক Azure CLI সতর্কতার মধ্যে পার্থক্য করে AZD-শুধুমাত্র নবীন পথের জন্য
- **📖 কনফিগারেশন, ট্রাবলশুটিং, এবং উদাহরণ ডকস** এখন প্রয়োজনীয় AZD প্রমাণীকরণ এবং ঐচ্ছিক Azure CLI সাইন-ইন পৃথক করে যেখানে আগে উভয়ই প্রসঙ্গ ছাড়াই উপস্থাপিত ছিল

#### সংশোধিত
- **📋 বাকি ইংরেজি-সূত্র কমান্ড রেফারেন্স** বর্তমান AZD ফর্মে আপডেট হয়েছে, চিট শিটের `azd config show` এবং `azd monitor --overview` সহ যেখানে Azure পোর্টালের ওভারভিউ নির্দেশিকা দেয়া হয়েছিল
- **🧭 অধ্যায় ১ নবীন দাবিসমূহ** নরম করা হয়েছে সমস্ত টেমপ্লেট এবং Azure রিসোর্সে শূন্য ত্রুটি বা রোলব্যাক আচরণের গ্যারান্টি দেওয়া থেকে বিরত রাখার জন্য
- **🔎 লাইভ CLI যাচাই** নিশ্চিত হয়েছে `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, এবং `azd down --force --purge` এর জন্য বর্তমান সমর্থন

#### ফাইল আপডেট হয়েছে
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

#### AZD 1.23.12 যাচাই, ওয়ার্কশপ পরিবেশ সম্প্রসারণ এবং AI মডেল রিফ্রেশ
**এই সংস্করণটি `azd` `1.23.12` বিরুদ্ধে ডকুমেন্টেশন যাচাই সম্পূর্ণ করে, পুরনো AZD কমাণ্ড উদাহরণগুলি আপডেট করে, AI মডেল নির্দেশনাগুলো বর্তমান ডিফল্টে রিফ্রেশ করে, এবং ওয়ার্কশপ নির্দেশনাগুলো GitHub Codespaces ছাড়াও dev containers এবং স্থানীয় ক্লোন সমর্থন করে বিস্তৃত করে।**

#### যোগ করা হয়েছে
- **✅ মূল অধ্যায় এবং ওয়ার্কশপ ডকস জুড়ে যাচাই নোট** যাতে পরীক্ষিত AZD বেসলাইন শিক্ষার্থীদের জন্য স্পষ্ট হয়, যারা নতুন বা পুরাতন CLI বিল্ড ব্যবহার করছেন
- **⏱️ দীর্ঘমেয়াদী AI অ্যাপ ডিপ্লয়মেন্টের জন্য টাইমআউট নির্দেশিকা** `azd deploy --timeout 1800` ব্যবহার করে
- **🔎 এক্সটেনশন তদন্ত ধাপ** AI ওয়ার্কফ্লো ডকুমেন্টেশনে `azd extension show azure.ai.agents` দিয়ে
- **🌐 বিস্তৃত ওয়ার্কশপ পরিবেশ নির্দেশিকা** GitHub Codespaces, dev containers, এবং স্থানীয় ক্লোন MkDocs দিয়ে কভার করে

#### পরিবর্তিত হয়েছে
- **📚 অধ্যায় সূচনা README** এখন ধারাবাহিকভাবে `azd 1.23.12` যাচাইয়ের কথা উল্লেখ করে ফাউন্ডেশন, কনফিগারেশন, ইনফ্রাস্ট্রাকচার, মাল্টি-এজেন্ট, প্রি-ডিপ্লয়মেন্ট, ট্রাবলশুটিং, এবং প্রোডাকশন সেকশনে
- **🛠️ AZD কমাণ্ড রেফারেন্স আপডেট** ডকস জুড়ে বর্তমান ফর্মে:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` অথবা `azd env get-value(s)` প্রসঙ্গ অনুযায়ী
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` যেখানে Application Insights ওভারভিউ নির্দেশিত
- **🧪 প্রিভিউ উদাহরণ সরলীকৃত** বর্তমান সমর্থিত ব্যবহারের মতো যেমন `azd provision --preview` এবং `azd provision --preview -e production`
- **🧭 ওয়ার্কশপ প্রবাহ আপডেট** যাতে শিক্ষার্থীরা Codespaces ছাড়াও dev container বা স্থানীয় ক্লোনে ল্যাব সম্পন্ন করতে পারে
- **🔐 প্রমাণীকরণ নির্দেশিকা** এখন `azd auth login` কে AZD ওয়ার্কফ্লোর জন্য প্রাধান্য দেয়, `az login` ঐচ্ছিক যেখানে Azure CLI কমান্ড সরাসরি ব্যবহৃত হয়

#### সংশোধিত
- **🪟 উইন্ডোজ ইনস্টল কমাণ্ডস** স্থাপনা গাইডে বর্তমান `winget` প্যাকেজ কেসিং অনুযায়ী স্বাভাবিকীকরণ হয়েছে
- **🐧 লিনাক্স ইনস্টল নির্দেশিকা** সংশোধন হয়েছে যা সমর্থিত নয় এমন ডিস্ট্রো-নির্দিষ্ট `azd` প্যাকেজ ম্যানেজার নির্দেশনা বর্জন করে এবং পরিবর্তে প্রয়োজনীয় রিলিজ অ্যাসেটের দিকে নির্দেশ করে
- **📦 AI মডেল উদাহরণ আপডেট** পুরোনো ডিফল্ট যেমন `gpt-35-turbo`, `text-embedding-ada-002` থেকে বর্তমান উদাহরণ যেমন `gpt-4.1-mini`, `gpt-4.1`, এবং `text-embedding-3-large` এ রিফ্রেশ করা হয়েছে
- **📋 ডিপ্লয়মেন্ট এবং ডায়াগনস্টিক স্নিপেটস সংশোধিত** লোগ, স্ক্রিপ্ট এবং ট্রাবলশুটিং ধাপগুলোতে বর্তমান পরিবেশ ও স্ট্যাটাস কমাণ্ড ব্যবহার করতে
- **⚙️ GitHub Actions নির্দেশিকা আপডেট** করা হয়েছে `Azure/setup-azd@v1.0.0` থেকে `Azure/setup-azd@v2` এ
- **🤖 MCP/Copilot সম্মতি নির্দেশিকা আপডেট** হয়েছে `azd mcp consent` থেকে `azd copilot consent list`

#### উন্নত হয়েছে
- **🧠 AI অধ্যায় নির্দেশিকা** এখন প্রিভিউ-সেন্সিটিভ `azd ai` আচরণ, টেন্যান্ট-নির্দিষ্ট লগইন, বর্তমান এক্সটেনশন ব্যবহার, এবং আপডেটকৃত মডেল ডিপ্লয়মেন্ট সুপারিশ আরও ভাল ব্যাখ্যা করে
- **🧪 ওয়ার্কশপ নির্দেশিকা** এখন আরও বাস্তবসম্মত সংস্করণ উদাহরণ এবং পরিষ্কার পরিবেশ সেটআপ ভাষা ব্যবহার করে হাতে-কলমে ল্যাবের জন্য
- **📈 প্রোডাকশন এবং ট্রাবলশুটিং ডকস** এখন বর্তমান মনিটরিং, ফ্যালব্যাক মডেল, এবং খরচ স্তরের উদাহরণগুলোর সাথে আরও সঙ্গতিপূর্ণ

#### ফাইল আপডেট হয়েছে
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

#### AZD AI CLI কমান্ড, বিষয়বস্তু যাচাই এবং টেম্পলেট সম্প্রসারণ
**এই সংস্করণে সব AI-সংক্রান্ত অধ্যায় জুড়ে `azd ai`, `azd extension`, এবং `azd mcp` কমান্ড কভারেজ যোগ হয়েছে, agents.md এর ভাঙা লিঙ্ক ও অব্যবহিত কোড সংশোধিত হয়েছে, চিট শিট আপডেট হয়েছে, এবং বৈধকৃত বিবরণ ও নতুন Azure AI AZD টেম্পলেট নিয়ে উদাহরণ টেম্পলেট অংশ পুনর্গঠন করা হয়েছে।**

#### যোগ করা হয়েছে
- **🤖 AZD AI CLI কভারেজ** ৭টি ফাইলে (আগে শুধু অধ্যায় ৮ এ ছিল):
  - `docs/chapter-01-foundation/azd-basics.md` — নতুন "এক্সটেনশনস ও AI কমান্ডস" বিভাগে `azd extension`, `azd ai agent init`, এবং `azd mcp` পরিচয় করানো হয়েছে
  - `docs/chapter-02-ai-development/agents.md` — অপশন ৪: `azd ai agent init` তুলনামূলক টেবিল (টেম্পলেট বনাম ম্যানিফেস্ট পদ্ধতি) সহ
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "Foundry জন্য AZD এক্সটেনশনস" এবং "Agent-First ডিপ্লয়মেন্ট" উপবিভাগসমূহ

  - `docs/chapter-05-multi-agent/README.md` — কুইক স্টার্ট এখন টেমপ্লেট এবং মেনিফেস্ট-ভিত্তিক ডিপ্লয়মেন্ট পথ উভয় দেখায়
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — ডিপ্লয় সেকশনে এখন `azd ai agent init` অপশন অন্তর্ভুক্ত
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "ডায়াগনস্টিকের জন্য AZD AI এক্সটেনশন কমান্ড" উপ-সেকশন
  - `resources/cheat-sheet.md` — নতুন "AI & এক্সটেনশন কমান্ড" সেকশন যা অন্তর্ভুক্ত `azd extension`, `azd ai agent init`, `azd mcp`, এবং `azd infra generate`
- **📦 নতুন AZD AI উদাহরণ টেমপ্লেটসমূহ** `microsoft-foundry-integration.md`-এ:
  - **azure-search-openai-demo-csharp** — .NET RAG চ্যাট উইথ ব্লেজার ওয়েবঅ্যাসেম্বলি, সেম্যান্টিক কার্নেল, এবং ভয়েস চ্যাট সাপোর্ট
  - **azure-search-openai-demo-java** — জাভা RAG চ্যাট Langchain4J ব্যবহার করে ACA/AKS ডিপ্লয়মেন্ট অপশনসহ
  - **contoso-creative-writer** — মাল্টি-এজেন্ট ক্রিয়েটিভ রাইটিং অ্যাপ যা Azure AI Agent Service, Bing Grounding, এবং Prompty ব্যবহার করে
  - **serverless-chat-langchainjs** — সার্ভারলেস RAG Azure Functions + LangChain.js + Cosmos DB সহ Ollama লোকাল ডেভ সাপোর্ট
  - **chat-with-your-data-solution-accelerator** — এন্টারপ্রাইজ RAG অ্যাক্সিলারেটর অ্যাডমিন পোর্টাল, Teams ইন্টিগ্রেশন এবং PostgreSQL/Cosmos DB অপশনসহ
  - **azure-ai-travel-agents** — মাল্টি-এজেন্ট MCP অর্কেস্ট্রেশন রেফারেন্স অ্যাপ .NET, পাইথন, জাভা, এবং টাইপস্ক্রিপ্ট সার্ভারসহ
  - **azd-ai-starter** — মিনিমাল Azure AI ইনফ্রাস্ট্রাকচার বিসেপ স্টার্টার টেমপ্লেট
  - **🔗 অসাধারণ AZD AI গ্যালারি লিঙ্ক** — [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (৮০+ টেমপ্লেট) এর রেফারেন্স

#### সংশোধিত
- **🔗 agents.md নেভিগেশন**: আগের/পরবর্তী লিঙ্ক এখন চ্যাপ্টার ২ README পাঠ-ক্রম অনুসারে (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md ভাঙা লিঙ্ক**: `production-ai-practices.md` সংশোধন করে `../chapter-08-production/production-ai-practices.md` (৩ বার)
- **📦 agents.md অব্যবহৃত কোড**: `opencensus` প্রতিস্থাপিত হয়েছে `azure-monitor-opentelemetry` + OpenTelemetry SDK দিয়ে
- **🐛 agents.md অবৈধ API**: `max_tokens` `create_agent()` থেকে সরিয়ে `create_run()`-এ `max_completion_tokens` হিসেবে স্থানান্তরিত
- **🔢 agents.md টোকেন গণনা**: আনুমানিক `len//4` পরিবর্তে `tiktoken.encoding_for_model()` ব্যবহার
- **azure-search-openai-demo**: সার্ভিসগুলো "Cognitive Search + App Service" থেকে "Azure AI Search + Azure Container Apps" এ সংশোধিত (ডিফল্ট হোস্ট পরিবর্তিত অক্টোবর ২০২৪)
- **contoso-chat**: বর্ণনা আপডেট করে Azure AI Foundry + Prompty সহ, রিপো-এর প্রকৃত শিরোনাম এবং প্রযুক্তিগত স্ট্যাকের সাথে মিলায়

#### অপসারণ করা হয়েছে
- **ai-document-processing**: অকার্যকর টেমপ্লেট রেফারেন্স অপসারণ (রিপোটি AZD টেমপ্লেট হিসেবে পাবলিকলি অ্যাক্সেসযোগ্য নয়)

#### উন্নত
- **📝 agents.md ব্যায়ামসমূহ**: ব্যায়াম ১ এবার আশা অনুযায়ী আউটপুট এবং `azd monitor` ধাপ দেখায়; ব্যায়াম ২-এ পুরো `FunctionTool` রেজিস্ট্রেশন কোড অন্তর্ভুক্ত; ব্যায়াম ৩ এ অস্পষ্ট নির্দেশনা পরিবর্তিত হয়ে স্পষ্ট `prepdocs.py` কমান্ড দিয়ে
- **📚 agents.md রিসোর্সসমূহ**: ডকুমেন্টেশন লিঙ্কগুলো আপডেট করে সাম্প্রতিক Azure AI Agent Service ডকুমেন্টেশান এবং কুইকস্টার্ট
- **📋 agents.md পরবর্তী ধাপের টেবিল**: সম্পূর্ণ চ্যাপ্টার কভারেজের জন্য AI ওয়ার্কশপ ল্যাব লিঙ্ক যুক্ত

#### ফাইল আপডেট হয়েছে
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### কোর্স নেভিগেশন উন্নয়ন
**এই সংস্করণ README.md চ্যাপ্টার নেভিগেশন উন্নত করেছে একটি উন্নত টেবিল ফরম্যাটের মাধ্যমে।**

#### পরিবর্তিত
- **কোর্স ম্যাপ টেবিল**: সরাসরি পাঠ লিঙ্ক, সময়কাল অনুমান, এবং জটিলতার রেটিং সহ উন্নত
- **ফোল্ডার পরিষ্কার**: পুরাতন অপ্রয়োজনীয় ফোল্ডারসমূহ সরানো হয়েছে (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **লিঙ্ক যাচাইকরণ**: কোর্স ম্যাপ টেবিলের ২১+ অভ্যন্তরীণ লিঙ্ক যাচাই সম্পন্ন

### [v3.16.0] - 2026-02-05

#### পণ্য নাম আপডেট
**এই সংস্করণ বর্তমান Microsoft ব্র্যান্ডিং অনুসারে পণ্য রেফারেন্স আপডেট করেছে।**

#### পরিবর্তিত
- **Microsoft Foundry → Microsoft Foundry**: সকল রেফারেন্স অনুবাদ-বিহীন ফাইল জুড়ে আপডেট করা হয়েছে
- **Azure AI Agent Service → Foundry Agents**: সার্ভিস নাম বর্তমান ব্র্যান্ডিং প্রতিফলিত করে আপডেট

#### ফাইল আপডেট হয়েছে
- `README.md` - প্রধান কোর্স ল্যান্ডিং পেজ
- `changelog.md` - সংস্করণ ইতিহাস
- `course-outline.md` - কোর্স কাঠামো
- `docs/chapter-02-ai-development/agents.md` - AI এজেন্ট গাইড
- `examples/README.md` - উদাহরণ ডকুমেন্টেশন
- `workshop/README.md` - ওয়ার্কশপ ল্যান্ডিং পেজ
- `workshop/docs/index.md` - ওয়ার্কশপ সূচিপত্র
- `workshop/docs/instructions/*.md` - সকল ওয়ার্কশপ নির্দেশনা ফাইল

---

### [v3.15.0] - 2026-02-05

#### প্রধান রিপোজিটরি পুনর্গঠন: অধ্যায়-ভিত্তিক ফোল্ডার নামকরণ
**এই সংস্করণ ডকুমেন্টেশনকে স্পষ্ট নেভিগেশনের জন্য নিবেদিত অধ্যায় ফোল্ডারে পুনর্গঠন করেছে।**

#### ফোল্ডার নাম পরিবর্তন
পুরাতন ফোল্ডারগুলো অধ্যায়-সংখ্যা সহ ফোল্ডারে প্রতিস্থাপিত হয়েছে:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- নতুন যোগ করা হয়েছে: `docs/chapter-05-multi-agent/`

#### ফাইল স্থানান্তর
| ফাইল | থেকে | জায়গায় |
|------|-------|--------|
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
- **📚 অধ্যায় README ফাইলসমূহ**: প্রতিটি অধ্যায় ফোল্ডারে README.md তৈরি করা হয়েছে যেখানে রয়েছে:
  - শেখার উদ্দেশ্য এবং সময়কাল
  - বর্ণনা সহ পাঠ সূচী
  - দ্রুত শুরু নির্দেশাবলী
  - অন্যান্য অধ্যায়ে নেভিগেশনের লিঙ্ক

#### পরিবর্তন করা হয়েছে
- **🔗 সব অভ্যন্তরীণ লিঙ্ক হালনাগাদ**: সমস্ত ডকুমেন্টেশন ফাইলে ৭৮+ পথ হালনাগাদ করা হয়েছে
- **🗺️ প্রধান README.md**: নবীন অধ্যায় কাঠামো সহ কোর্স মানচিত্র হালনাগাদ হয়েছে
- **📝 examples/README.md**: অধ্যায় ফোল্ডারগুলোর ক্রস-রেফারেন্স হালনাগাদ করা হয়েছে

#### সরানো হয়েছে
- পুরানো ফোল্ডার কাঠামো (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - ২০২৬-০২-০৫

#### রিপোজিটরি পুনর্গঠন: অধ্যায় নেভিগেশন
**এই সংস্করণে অধ্যায় নেভিগেশন README ফাইল যোগ করা হয়েছে (v3.15.0 দ্বারা প্রতিস্থাপিত)।**

---

### [v3.13.0] - ২০২৬-০২-০৫

#### নতুন AI এজেন্ট গাইড
**এই সংস্করণে Azure Developer CLI ব্যবহার করে AI এজেন্ট ডিপ্লয়মেন্টের ব্যাপক গাইড যুক্ত হয়েছে।**

#### যোগ করা হয়েছে
- **🤖 docs/microsoft-foundry/agents.md**: সম্পূর্ণ গাইড যেখানে অন্তর্ভুক্ত:
  - AI এজেন্ট কি এবং তারা কিভাবে চ্যাটবট থেকে আলাদা
  - তিনটি দ্রুত শুরু এজেন্ট টেমপ্লেট (Foundry Agents, Prompty, RAG)
  - এজেন্ট আর্কিটেকচার প্যাটার্ন (একক এজেন্ট, RAG, মাল্টি-এজেন্ট)
  - টুল কনফিগারেশন এবং কাস্টমাইজেশন
  - মনিটরিং এবং মেট্রিক্স ট্র্যাকিং
  - খরচ বিবেচনা এবং অপ্টিমাইজেশন
  - সাধারণ সমস্যা সমাধান পরিস্থিতি
  - তিনটি ব্যবহারিক ব্যায়াম সহ সফলতার মানদণ্ড

#### বিষয়বস্তু কাঠামো
- **পরিচিতি**: শিক্ষানবীদের জন্য এজেন্ট ধারণা
- **দ্রুত শুরু**: `azd init --template get-started-with-ai-agents` দিয়ে এজেন্ট ডিপ্লয় করা
- **আর্কিটেকচার প্যাটার্ন**: এজেন্ট প্যাটার্নের ভিজ্যুয়াল ডায়াগ্রাম
- **কনফিগারেশন**: টুল সেটআপ এবং পরিবেশ ভেরিয়েবল
- **মনিটরিং**: অ্যাপ্লিকেশন ইনসাইট ইন্টিগ্রেশন
- **ব্যায়াম**: ক্রমবর্ধমান ব্যবহারিক শেখা (প্রতি টি ২০-৪৫ মিনিট)

---

### [v3.12.0] - ২০২৬-০২-০৫

#### ডেভকন্টেইনার পরিবেশ আপডেট
**এই সংস্করণে ডেভেলপমেন্ট কন্টেইনার কনফিগারেশন আধুনিক টুল এবং উন্নত ডিফল্ট সহ AZD শেখার অভিজ্ঞতার জন্য আপডেট করা হয়েছে।**

#### পরিবর্তন করা হয়েছে
- **🐳 বেস ইমেজ**: `python:3.12-bullseye` থেকে `python:3.12-bookworm` (সর্বশেষ Debian স্থিতিশীল) এ আপডেট
- **📛 কনটেইনার নাম**: স্পষ্টতার জন্য "Python 3" থেকে "AZD for Beginners" এ নাম পরিবর্তন

#### যোগ করা হয়েছে
- **🔧 নতুন ডেভ কনটেইনার ফিচারসমূহ**:
  - `azure-cli` সহ Bicep সমর্থন সক্রিয়
  - `node:20` (AZD টেমপ্লেটের জন্য LTS সংস্করণ)
  - টেমপ্লেট ব্যবস্থাপনার জন্য `github-cli`
  - কনটেইনার অ্যাপ ডিপ্লয়মেন্টের জন্য `docker-in-docker`

- **🔌 পোর্ট ফরোয়ার্ডিং**: সাধারণ ডেভেলপমেন্টের জন্য প্রাক-কনফিগার্ড পোর্ট:
  - ৮০০০ (MkDocs প্রিভিউ)
  - ৩০০০ (ওয়েব অ্যাপস)
  - ৫০০০ (Python Flask)
  - ৮০৮০ (API গুলি)

- **🧩 নতুন VS কোড এক্সটেনশনসমূহ**:
  - `ms-python.vscode-pylance` - উন্নত পাইথন ইন্টেলিসেন্স
  - `ms-azuretools.vscode-azurefunctions` - Azure ফাংশনস সমর্থন
  - `ms-azuretools.vscode-docker` - Docker সমর্থন
  - `ms-azuretools.vscode-bicep` - Bicep ভাষার সমর্থন
  - `ms-azure-devtools.azure-resource-groups` - Azure রিসোর্স ব্যবস্থাপনা
  - `yzhang.markdown-all-in-one` - Markdown সম্পাদনা
  - `DavidAnson.vscode-markdownlint` - Markdown লিন্টিং
  - `bierner.markdown-mermaid` - Mermaid ডায়াগ্রাম সমর্থন
  - `redhat.vscode-yaml` - YAML সমর্থন (azure.yaml এর জন্য)
  - `eamodio.gitlens` - Git ভিজ্যুয়ালাইজেশন
  - `mhutchie.git-graph` - Git ইতিহাস

- **⚙️ VS কোড সেটিংস**: পাইথন ইন্টারপ্রেটার, ফরম্যাট অন সেভ, এবং হোয়াইটস্পেস ট্রিমিংয়ের জন্য ডিফল্ট সেটিংস যোগ করা হয়েছে

- **📦 requirements-dev.txt হালনাগাদ**:
  - MkDocs মিনিফাই প্লাগইন যোগ করা হয়েছে
  - কোড গুণমানের জন্য pre-commit যোগ করা হয়েছে
  - Azure SDK প্যাকেজ (azure-identity, azure-mgmt-resource) যোগ করা হয়েছে

#### মেরামত করা হয়েছে
- **পোস্ট-ক্রিয়েট কমান্ড**: এখন কন্টেইনার শুরুতে AZD এবং Azure CLI ইনস্টলেশন যাচাই করে

---

### [v3.11.0] - ২০২৬-০২-০৫

#### শিক্ষানবীших জন্য README ব্যাপক পরিবর্তন
**এই সংস্করণে README.md নাটকীয়ভাবে উন্নত করা হয়েছে যাতে তা নতুনদের জন্য আরও সহজবোধ্য হয় এবং AI ডেভেলপারদের প্রয়োজনীয় সম্পদ যোগ করা হয়েছে।**

#### যোগ করা হয়েছে
- **🆚 Azure CLI ও AZD তুলনা**: প্রতিটি টুল কখন ব্যবহার করবেন তা বাস্তব উদাহরণের সহিত স্পষ্টভাবে ব্যাখ্যা
- **🌟 অসাধারণ AZD লিঙ্কসমূহ**: কমিউনিটি টেমপ্লেট গ্যালারী ও অবদানের সরাসরি লিঙ্ক:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - ২০০+ ডিপ্লয়মেন্ট টেমপ্লেট প্রস্তুত
  - [একটি টেমপ্লেট জমা দিন](https://github.com/Azure/awesome-azd/issues) - কমিউনিটি অবদান
- **🎯 দ্রুত শুরু গাইড**: সরলীকৃত ৩-ধাপ শুরু বিভাগ (ইনস্টল → লগইন → ডিপ্লয়)
- **📊 অভিজ্ঞতাভিত্তিক নেভিগেশন টেবিল**: ডেভেলপার অভিজ্ঞতার ভিত্তিতে কোথায় শুরু করবেন তার স্পষ্ট নির্দেশনা

#### পরিবর্তন করা হয়েছে
- **README কাঠামো**: প্রগ্রেসিভ ডিসক্লোজারের জন্য পুনর্গঠন - প্রথমে মূল তথ্য
- **প্রবর্তনা বিভাগ**: নতুনদের জন্য "azd up এর জাদু" ব্যাখ্যা সহ পুনর্লিখন
- **ডুপ্লিকেট বিষয়বস্তু সরানো হয়েছে**: ডুপ্লিকেট ট্রাবলশুটিং বিভাগ নির্মূল

- **সমস্যা সমাধানের কমান্ডসমূহ**: সঠিক `azd monitor --logs` ব্যবহার করার জন্য `azd logs` রেফারেন্স সংশোধন করা হয়েছে

#### সংশোধিত

- **🔐 প্রমাণীকরণ কমান্ড**: `azd auth login` এবং `azd auth logout` cheat-sheet.md এ যোগ করা হয়েছে
- **অবৈধ কমান্ড রেফারেন্স**: README র troubleshooting অংশ থেকে বাকি `azd logs` সরানো হয়েছে

#### নোটস
- **স্কোপ**: প্রধান README.md এবং resources/cheat-sheet.md তে পরিবর্তন প্রয়োগ করা হয়েছে
- **লক্ষ্য শ্রোতা**: AZD তে নতুন ডেভেলপারদের জন্য বিশেষভাবে উন্নতিসাধন

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI কমান্ড নির্ভুলতা আপডেট
**এই সংস্করণ ডকুমেন্টেশনের সমস্ত অবৈধ AZD কমান্ড সংশোধন করে, যাতে সব কোড উদাহরণ বৈধ Azure Developer CLI সিনট্যাক্স ব্যবহার করে।**

#### সংশোধিত
- **🔧 অবৈধ AZD কমান্ড সরানো হয়েছে**: অবৈধ কমান্ডের ব্যাপক পরিদর্শন ও সংশোধন:
  - `azd logs` (অস্তিত্বহীন) → `azd monitor --logs` বা Azure CLI বিকল্প দিয়ে প্রতিস্থাপন
  - `azd service` উপকমান্ড (অস্তিত্বহীন) → `azd show` এবং Azure CLI দিয়ে প্রতিস্থাপন
  - `azd infra import/export/validate` (অস্তিত্বহীন) → সরানো হয়েছে বা বৈধ বিকল্প দ্বারা প্রতিস্থাপিত হয়েছে
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` ফ্ল্যাগ (অস্তিত্বহীন) → সরানো হয়েছে
  - `azd provision --what-if/--rollback` ফ্ল্যাগ (অস্তিত্বহীন) → `--preview` ব্যবহার করার জন্য আপডেট করা হয়েছে
  - `azd config validate` (অস্তিত্বহীন) → `azd config list` দিয়ে প্রতিস্থাপিত হয়েছে
  - `azd info`, `azd history`, `azd metrics` (অস্তিত্বহীন) → সরানো হয়েছে

- **📚 কমান্ড সংশোধন সহ ফাইল আপডেট**:
  - `resources/cheat-sheet.md`: কমান্ড রেফারেন্সের বড় সংস্কার
  - `docs/deployment/deployment-guide.md`: রোলব্যাক ও ডিপ্লয়মেন্ট কৌশল সংশোধিত
  - `docs/troubleshooting/debugging.md`: লগ বিশ্লেষণ বিভাগ সংশোধিত
  - `docs/troubleshooting/common-issues.md`: ট্রাবলশুটিং কমান্ড আপডেট করা হয়েছে
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD ডিবাগিং সেকশন সংশোধিত
  - `docs/getting-started/azd-basics.md`: মনিটরিং কমান্ড সঠিক করা হয়েছে
  - `docs/getting-started/first-project.md`: মনিটরিং ও ডিবাগিং উদাহরণ আপডেট করা হয়েছে
  - `docs/getting-started/installation.md`: সাহায্য ও সংস্করণ উদাহরণ সংশোধিত
  - `docs/pre-deployment/application-insights.md`: লগ দেখার কমান্ড সঠিক করা হয়েছে
  - `docs/pre-deployment/coordination-patterns.md`: এজেন্ট ডিবাগিং কমান্ড সংশোধিত

- **📝 সংস্করণ রেফারেন্স আপডেট**:
  - `docs/getting-started/installation.md`: হার্ডকোডেড `1.5.0` সংস্করণ সাধারণীকৃত `1.x.x` এ পরিবর্তন এবং রিলিজ লিঙ্ক যুক্ত

#### পরিবর্তিত
- **রোলব্যাক কৌশল**: ডকুমেন্টেশনকে Git-ভিত্তিক রোলব্যাক ব্যবহারের জন্য আপডেট করা হয়েছে (AZD-এর নিজস্ব রোলব্যাক নেই)
- **লগ দেখা**: `azd logs` রেফারেন্স পরিবর্তে `azd monitor --logs`, `azd monitor --live`, এবং Azure CLI কমান্ড ব্যবহার করা হয়েছে
- **পারফরমেন্স সেকশন**: অবৈধ parallel/incremental ডিপ্লয়মেন্ট ফ্ল্যাগ সরানো হয়েছে, বৈধ বিকল্প প্রদান করা হয়েছে

#### প্রযুক্তিগত বিবরণ
- **বৈধ AZD কমান্ডসমূহ**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **বৈধ azd monitor ফ্ল্যাগ**: `--live`, `--logs`, `--overview`
- **সরানো হয়েছে**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### নোটস
- **যাচাই**: কমান্ডগুলো Azure Developer CLI v1.23.x এর সাথে যাচাই করা হয়েছে

---

### [v3.9.0] - 2026-02-05

#### ওয়ার্কশপ সমাপ্তি ও ডকুমেন্টেশন গুণগতমান আপডেট
**এই সংস্করণ ইন্টার‍্যাকটিভ ওয়ার্কশপ মডিউল সম্পূর্ণ করেছে, সকল ভাঙ্গা ডকুমেন্টেশন লিঙ্ক ঠিক করেছে এবং Microsoft AZD ব্যবহারকারী AI ডেভেলপারদের জন্য সামগ্রিক কন্টেন্ট গুণগতমান উন্নত করেছে।**

#### যোগ করা হয়েছে
- **📝 CONTRIBUTING.md**: নতুন অবদান নির্দেশিকা ডকুমেন্ট:
  - সমস্যা রিপোর্ট ও পরিবর্তনের প্রস্তাবের পরিষ্কার নির্দেশনা
  - নতুন বিষয়বস্তুর জন্য ডকুমেন্টেশন মানদণ্ড
  - কোড উদাহরণ নীতি এবং কনফার্মেশন মেসেজ কনভেনশনস
  - কমিউনিটি এনগেজমেন্ট তথ্য

#### সম্পন্ন
- **🎯 ওয়ার্কশপ মডিউল ৭ (সমাপ্তি)**: সম্পূর্ণ সমাপ্তি মডিউল:
  - ওয়ার্কশপ অর্জনের বিস্তৃত সারাংশ
  - AZD, টেমপ্লেট এবং Microsoft Foundry সম্পর্কিত গুরুত্বপূর্ণ ধারণাগুলো
  - শিক্ষা যাত্রা অব্যাহত রাখার সুপারিশ
  - ওয়ার্কশপ চ্যালেঞ্জ অনুশীলন ডিফিকাল্টি রেটিংসহ
  - কমিউনিটি প্রতিক্রিয়া এবং সহায়তা লিংকসমূহ

- **📚 ওয়ার্কশপ মডিউল ৩ (ডিকনস্ট্রাক্ট)**: শিক্ষার উদ্দেশ্য আপডেট:
  - MCP সার্ভার সহ GitHub Copilot চালু করার গাইডলাইন
  - AZD টেমপ্লেট ফোল্ডার স্ট্রাকচার বোঝার জন্য
  - ইনফ্রাস্ট্রাকচার-আস-কোড (Bicep) সংগঠন প্যাটার্ন
  - হ্যান্ডস-অন ল্যাব নির্দেশনা

- **🔧 ওয়ার্কশপ মডিউল ৬ (টিয়ারডাউন)**: সম্পন্ন হয়েছে:
  - রিসোর্স পরিস্কার এবং খরচ ব্যবস্থাপনা লক্ষ্য
  - নিরাপদ অবকাঠামো ডীপ্রোভিশনিং এর জন্য `azd down` ব্যবহার
  - সফট-ডিলিটেড কগনিটিভ সার্ভিস রিকভারি নির্দেশনা
  - GitHub Copilot এবং Azure পোর্টাল অন্বেষণের বোনাস প্রম্পট

#### সংশোধিত
- **🔗 ভাঙ্গা লিঙ্ক সংশোধন**: ১৫+ ভাঙ্গা অভ্যন্তরীণ ডকুমেন্টেশন লিঙ্ক ঠিক করা হয়েছে:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md এর পাথ ঠিক করা হয়েছে
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md এবং production-ai-practices.md এর পাথ সংশোধন
  - `docs/getting-started/first-project.md`: অস্তিত্বহীন cicd-integration.md এর পরিবর্তে deployment-guide.md ব্যবহার
  - `examples/retail-scenario.md`: FAQ ও ট্রাবলশুটিং গাইড পথ সংশোধন
  - `examples/container-app/microservices/README.md`: কোর্স হোম ও ডিপ্লয়মেন্ট গাইড পাথ সংশোধন
  - `resources/faq.md` এবং `resources/glossary.md`: AI অধ্যায় রেফারেন্স আপডেট করেছে
  - `course-outline.md`: ইন্সট্রাক্টর গাইড এবং AI ওয়ার্কশপ ল্যাব রেফারেন্স সংশোধন

- **📅 ওয়ার্কশপ স্ট্যাটাস ব্যানার**: "Under Construction" থেকে সক্রিয় ওয়ার্কশপ স্ট্যাটাসে আপডেট, ২০২৬ সালের ফেব্রুয়ারি তারিখ সহ

- **🔗 ওয়ার্কশপ নেভিগেশন**: workshop README.md-তে ভাঙ্গা নেভিগেশন লিঙ্ক ঠিক করা হয়েছে যা অস্তিত্বহীন lab-1-azd-basics ফোল্ডার নির্দেশ করছিল

#### পরিবর্তিত
- **ওয়ার্কশপ প্রদর্শনী**: "under construction" সতর্কতা সরানো হয়েছে, ওয়ার্কশপ এখন সম্পূর্ণ এবং ব্যবহারের জন্য প্রস্তুত
- **নেভিগেশন সামঞ্জস্য**: সকল ওয়ার্কশপ মডিউলের যথাযথ আন্তঃমডিউল নেভিগেশন নিশ্চিত করা হয়েছে
- **শিক্ষা পথ রেফারেন্স**: অধ্যায়ের মাঝে সঠিক microsoft-foundry পথ ব্যবহার করে আপডেট করা হয়েছে

#### যাচাই
- ✅ সকল ইংরেজি মার্কডাউন ফাইলের অভ্যন্তরীণ লিঙ্ক বৈধ
- ✅ ওয়ার্কশপ মডিউল ০-৭ সম্পূর্ণ ও শিক্ষার উদ্দেশ্যসহ
- ✅ অধ্যায় ও মডিউলের মধ্যে নেভিগেশন সঠিকভাবে কাজ করে
- ✅ কন্টেন্ট Microsoft AZD ব্যবহারকারী AI ডেভেলপারদের জন্য উপযুক্ত
- ✅ শুরুতে সহজ ভাষা ও কাঠামো বজায় রাখা হয়েছে
- ✅ CONTRIBUTING.md স্পষ্ট নির্দেশনা প্রদান করে সমাজের অবদানকারীদের জন্য

#### প্রযুক্তিগত বাস্তবায়ন
- **লিঙ্ক যাচাইকরণ**: স্বয়ংক্রিয় পাওয়ারশেল স্ক্রিপ্ট সব .md অভ্যন্তরীণ লিঙ্ক যাচাই করেছে
- **কন্টেন্ট অডিট**: ওয়ার্কশপ সম্পূর্ণতা ও শুরু করার উপযোগিতা হাতেখড়ি পর্যালোচনা
- **নেভিগেশন সিস্টেম**: নিবিড় অধ্যায় ও মডিউল নেভিগেশন প্যাটার্ন প্রয়োগ

#### নোটস
- **স্কোপ**: পরিবর্তন শুধুমাত্র ইংরেজি ডকুমেন্টেশনে প্রয়োগ
- **অনুবাদ**: এই সংস্করণে অনুবাদ ফোল্ডার আপডেট হয়নি (স্বয়ংক্রিয় অনুবাদ পরে সিংক্রোনাইজ হবে)
- **ওয়ার্কশপ সময়কাল**: সম্পূর্ণ ওয়ার্কশপ এখন ৩-৪ ঘণ্টার হ্যান্ডস-অন শেখার সুযোগ দেয়

---

### [v3.8.0] - 2025-11-19

#### উন্নত ডকুমেন্টেশন: মনিটরিং, নিরাপত্তা, ও মাল্টি-এজেন্ট প্যাটার্ন
**এই সংস্করণ অ্যাপ্লিকেশন ইনসাইটস ইন্টিগ্রেশন, প্রমাণীকরণ প্যাটার্ন এবং উৎপাদন ডিপ্লয়মেন্টের জন্য মাল্টি-এজেন্ট সমন্বয় বিষয়ক বিস্তৃত A-লেভেল পাঠ যুক্ত করে।**

#### যোগ করা হয়েছে
- **📊 অ্যাপ্লিকেশন ইনসাইটস ইন্টিগ্রেশন পাঠ**: `docs/pre-deployment/application-insights.md`:
  - AZD-কেন্দ্রিক ডিপ্লয়মেন্ট সহ স্বয়ংক্রিয় প্রোভিশনিং
  - অ্যাপ্লিকেশন ইনসাইটস + লগ অ্যানালিটিক্সের সম্পূর্ণ Bicep টেমপ্লেট
  - কাস্টম টেলিমেট্রি সহ কাজ করা পাইথন অ্যাপ্লিকেশন (১২০০+ লাইন)
  - AI/LLM মনিটরিং প্যাটার্ন (Microsoft Foundry Models টোকেন/খরচ ট্র্যাকিং)
  - ৬ টি মারমেইড ডায়াগ্রাম (আর্কিটেকচার, বিতরণ ট্রেসিং, টেলিমেট্রি ফ্লো)
  - ৩ টি হ্যান্ডস-অন অনুশীলন (সতর্কতা, ড্যাশবোর্ড, AI মনিটরিং)
  - কুস্টো কোয়েরি উদাহরণ ও খরচ অপ্টিমাইজেশন কৌশল
  - লাইভ মেট্রিক্স স্ট্রীমিং এবং রিয়েল-টাইম ডিবাগিং
  - ৪০-৫০ মিনিট শেখার সময় প্রোডাকশন-রেডি প্যাটার্ন সহ

- **🔐 প্রমাণীকরণ ও নিরাপত্তা প্যাটার্ন পাঠ**: `docs/getting-started/authsecurity.md`:
  - ৩টি প্রমাণীকরণ প্যাটার্ন (কানেকশন স্ট্রিংস, কী ভল্ট, ম্যানেজড আইডেন্টিটি)
  - নিরাপদ ডিপ্লয়মেন্টের জন্য সম্পূর্ণ Bicep ইনফ্রাস্ট্রাকচার টেমপ্লেট
  - Azure SDK ইন্টিগ্রেশন সহ Node.js অ্যাপ্লিকেশন কোড
  - ৩টি সম্পূর্ণ অনুশীলন (ম্যানেজড আইডেন্টিটি সক্রিয়করণ, ইউজার-অ্যাসাইনড আইডেন্টিটি, কী ভল্ট রোটেশন)
  - নিরাপত্তার সেরা পদ্ধতি ও RBAC কনফিগারেশন
  - ট্রাবলশুটিং গাইড ও খরচ বিশ্লেষণ
  - উৎপাদন-প্রস্তুত পাসওয়ার্ডহীন প্রমাণীকরণ প্যাটার্ন

- **🤖 মাল্টি-এজেন্ট সমন্বয় প্যাটার্ন পাঠ**: `docs/pre-deployment/coordination-patterns.md`:
  - ৫টি সমন্বয় প্যাটার্ন (ক্রমসন্ধান, সমান্তরাল, শ্রেণীবদ্ধ, ইভেন্ট-চালিত, সম্মতিক্রমে)
  - সম্পূর্ণ অর্কেস্ট্রেটর সার্ভিস বাস্তবায়ন (Python/Flask, ১৫০০+ লাইন)
  - ৩টি বিশেষায়িত এজেন্ট বাস্তবায়ন (গবেষণা, লেখক, সম্পাদক)
  - মেসেজ কিউয়ের জন্য সার্ভিস বাস ইন্টিগ্রেশন
  - বিতরণকৃত সিস্টেমের জন্য Cosmos DB স্টেট ম্যানেজমেন্ট
  - ৬টি মারমেইড ডায়াগ্রাম যা এজেন্ট ইন্টারঅ্যাকশন প্রদর্শন করে
  - ৩টি উন্নত অনুশীলন (টাইমআউট হ্যান্ডলিং, রিট্রাই লজিক, সার্কিট ব্রেকার)
  - খরচ বিশ্লেষণ ($২৪০-৫৬৫/মাস) সহ অপ্টিমাইজেশন কৌশল
  - মনিটরিংয়ের জন্য অ্যাপ্লিকেশন ইনসাইটস ইন্টিগ্রেশন

#### উন্নত
- **প্রি-ডিপ্লয়মেন্ট অধ্যায়**: এখন ব্যাপক মনিটরিং ও সমন্বয় প্যাটার্ন অন্তর্ভুক্ত
- **গেটিং স্টার্টেড অধ্যায়**: পেশাদার প্রমাণীকরণ প্যাটার্ন সহ উন্নত
- **প্রোডাকশন প্রস্তুতি**: নিরাপত্তা থেকে পর্যবেক্ষণ পর্যন্ত সম্পূর্ণ কাভারেজ
- **কোর্স আউটলাইন**: অধ্যায় ৩ এবং ৬ তে নতুন পাঠের জন্য আপডেট

#### পরিবর্তিত
- **শিক্ষার অগ্রগতি**: কোর্সের জুড়ে নিরাপত্তা ও মনিটরিং উন্নত সংযুক্তি
- **ডকুমেন্টেশন গুণগতমান**: নতুন পাঠে ধারাবাহিক A-গ্রেড মানদণ্ড (৯৫-৯৭%)
- **প্রোডাকশন প্যাটার্ন**: এন্টারপ্রাইজ ডিপ্লয়মেন্টের জন্য সম্পূর্ণ সমাধান

#### উন্নত
- **ডেভেলপার অভিজ্ঞতা**: উন্নয়ন থেকে প্রোডাকশন মনিটরিং পর্যন্ত পরিষ্কার পথ
- **নিরাপত্তা মান**: প্রমাণীকরণ এবং সিক্রেটস ব্যবস্থাপনার পেশাদার প্যাটার্ন
- **পর্যবেক্ষণযোগ্যতা**: AZD-সহ সম্পূর্ণ অ্যাপ্লিকেশন ইনসাইটস ইন্টিগ্রেশন
- **AI ওয়ার্কলোড**: Microsoft Foundry Models এবং মাল্টি-এজেন্ট সিস্টেমের জন্য বিশেষায়িত মনিটরিং

#### যাচাই
- ✅ সকল পাঠে সম্পূর্ণ কাজ করা কোড অন্তর্ভুক্ত (নির্যাস নয়)
- ✅ ভিজ্যুয়াল শিক্ষার জন্য মারমেইড ডায়াগ্রাম (মোট ১৯টি, ৩টি পাঠে)
- ✅ যাচাইকরণ ধাপসহ হ্যান্ডস-অন অনুশীলন (মোট ৯টি)
- ✅ `azd up` দ্বারা ডিপ্লয়াযোগ্য প্রোডাকশন-প্রস্তুত Bicep টেমপ্লেট
- ✅ খরচ বিশ্লেষণ এবং অপ্টিমাইজেশন কৌশল
- ✅ ট্রাবলশুটিং গাইড ও সেরা চর্চা
- ✅ যাচাইকরণ কমান্ডসহ জ্ঞান পর্যায়পত্র

#### ডকুমেন্টেশন গ্রেডিং ফলাফল
- **docs/pre-deployment/application-insights.md**: - বিস্তৃত মনিটরিং গাইড
- **docs/getting-started/authsecurity.md**: - পেশাদার নিরাপত্তা প্যাটার্ন
- **docs/pre-deployment/coordination-patterns.md**: - উন্নত মাল্টি-এজেন্ট আর্কিটেকচার
- **সামগ্রিক নতুন বিষয়বস্তু**: - ধারাবাহিক উচ্চমানের মানসম্পন্ন

#### প্রযুক্তিগত বাস্তবায়ন
- **অ্যাপ্লিকেশন ইনসাইটস**: লগ অ্যানালিটিক্স + কাস্টম টেলিমেট্রি + বিতরণ ট্রেসিং
- **প্রমাণীকরণ**: ম্যানেজড আইডেন্টিটি + কী ভল্ট + RBAC প্যাটার্ন
- **মাল্টি-এজেন্ট**: সার্ভিস বাস + Cosmos DB + কনটেইনার অ্যাপ + অর্কেস্ট্রেশন
- **মনিটরিং**: লাইভ মেট্রিক্স + কুস্টো কোয়েরি + সতর্কতা + ড্যাশবোর্ড
- **খরচ ব্যবস্থাপনা**: স্যাম্পলিং কৌশল, রিটেনশন নীতি, বাজেট নিয়ন্ত্রণ

### [v3.7.0] - 2025-11-19

#### ডকুমেন্টেশন গুণগতমান উন্নতি ও নতুন Microsoft Foundry Models উদাহরণ
**এই সংস্করণ রেপোজিটরির ডকুমেন্টেশন গুণগতমান উন্নত করে এবং gpt-4.1 চ্যাট ইন্টারফেস সহ Microsoft Foundry Models এর সম্পূর্ণ ডিপ্লয়মেন্ট উদাহরণ যুক্ত করে।**

#### যোগ করা হয়েছে
- **🤖 Microsoft Foundry Models চ্যাট উদাহরণ**: সম্পূর্ণ gpt-4.1 ডিপ্লয়মেন্ট `examples/azure-openai-chat/` এ:
  - সম্পূর্ণ Microsoft Foundry Models অবকাঠামো (gpt-4.1 মডেল ডিপ্লয়মেন্ট)
  - সংলাপ ইতিহাস সহ পাইথন কমান্ড-লাইন চ্যাট ইন্টারফেস
  - নিরাপদ API কী সংরক্ষণে কী ভল্ট ইন্টিগ্রেশন
  - টোকেন ব্যবহারের ট্র্যাকিং ও খরচ অনুমান
  - রেট সীমাবদ্ধকরণ এবং ত্রুটি হ্যান্ডলিং
  - ৩৫-৪৫ মিনিট ডিপ্লয়মেন্ট গাইডসহ বিস্তৃত README
  - ১১টি প্রোডাকশন-প্রস্তুত ফাইল (Bicep টেমপ্লেট, পাইথন অ্যাপ, কনফিগারেশন)
- **📚 ডকুমেন্টেশন অনুশীলন**: কনফিগারেশন গাইডে হ্যান্ডস-অন অনুশীলন যুক্ত:
  - অনুশীলন ১: মাল্টি-এনভায়রনমেন্ট কনফিগারেশন (১৫ মিনিট)
  - অনুশীলন ২: সিক্রেট ম্যানেজমেন্ট অনুশীলন (১০ মিনিট)
  - পরিষ্কার সফলতার মানদণ্ড এবং যাচাইকরণ ধাপ
- **✅ ডিপ্লয়মেন্ট যাচাইকরণ**: ডিপ্লয়মেন্ট গাইডে যাচাইকরণ সেকশন যোগ:
  - স্বাস্থ্য পরীক্ষা পদ্ধতি
  - সফলতা মানদণ্ড চেকলিস্ট
  - সকল ডিপ্লয়মেন্ট কমান্ডের প্রত্যাশিত আউটপুট
  - ট্রাবলশুটিং দ্রুত রেফারেন্স

#### উন্নত
- **examples/README.md**: A-গ্রেড গুণগতমান (৯৩%) এ আপডেট:
  - সব প্রাসঙ্গিক বিভাগে azure-openai-chat যোগ করা হয়েছে
  - স্থানীয় উদাহরণ সংখ্যা ৩ থেকে ৪ এ আপডেট
  - AI অ্যাপ্লিকেশন উদাহরণ টেবিল যুক্ত
  - মধ্যবর্তী ব্যবহারকারীদের জন্য কুইক স্টার্টে সংযুক্ত
  - Microsoft Foundry টেমপ্লেট বিভাগে যোগ করা হয়েছে
  - তুলনা ম্যাট্রিক্স ও প্রযুক্তি আবিষ্কার বিভাগ আপডেট
- **ডকুমেন্টেশন গুণগতমান**: docs ফোল্ডারে B+ (৮৭%) থেকে A- (৯২%) পর্যন্ত উন্নীত

  - গুরুত্বপূর্ণ কমান্ড উদাহরণগুলিতে প্রত্যাশিত আউটপুট যোগ করা হয়েছে
  - কনফিগারেশন পরিবর্তনের জন্য যাচাইকরণ ধাপ যুক্ত করা হয়েছে
  - ব্যবহারিক অনুশীলনসহ হাতে-কলমে শেখার উন্নতি ঘটানো হয়েছে

#### পরিবর্তিত হয়েছে
- **শিক্ষা অগ্রগতি**: মধ্যবর্তী শিক্ষার্থীদের জন্য AI উদাহরণগুলোর আরও ভাল সমন্বয়
- **দস্তাবেজ কাঠামো**: স্পষ্ট ফলাফল সহ আরও কার্যকর অনুশীলন
- **যাচাইকরণ প্রক্রিয়া**: মূল ওয়ার্কফ্লো-এ স্পষ্ট সফলতার মানদণ্ড যোগ করা হয়েছে

#### উন্নত হয়েছে
- **ডেভেলপার অভিজ্ঞতা**: Microsoft Foundry Models ডিপ্লয়মেন্ট এখন ৩৫-৪৫ মিনিটে হয়ে থাকে (জটিল বিকল্পের জন্য ৬০-৯০ মিনিটের বিপরীতে)
- **খরচ স্বচ্ছতা**: Microsoft Foundry Models উদাহরণের জন্য স্পষ্ট খরচ অনুমান ($৫০-২০০/মাস)
- **শেখার পথ**: AI ডেভেলপারদের জন্য azure-openai-chat এর মাধ্যমে স্পষ্ট প্রবেশ পথ
- **দস্তাবেজ মানদণ্ড**: ধারাবাহিক প্রত্যাশিত আউটপুট এবং যাচাইকরণ ধাপ

#### যাচাই করা হয়েছে
- ✅ Microsoft Foundry Models উদাহরণ `azd up` দিয়ে সম্পূর্ণ কার্যকরী
- ✅ সমস্ত ১১টি ইমপ্লিমেন্টেশন ফাইল সিনট্যাক্টিক্যালি সঠিক
- ✅ README নির্দেশাবলী প্রকৃত ডিপ্লয়মেন্ট অভিজ্ঞতার সঙ্গে মেলে
- ✅ দস্তাবেজ লিঙ্কগুলি ৮+ অবস্থানে আপডেট করা হয়েছে
- ✅ উদাহরণ সূচক সঠিকভাবে ৪টি স্থানীয় উদাহরণ প্রতিফলিত করে
- ✅ টেবিলগুলিতে কোনও দ্বৈত বাহ্যিক লিঙ্ক নেই
- ✅ সমস্ত নেভিগেশন রেফারেন্স সঠিক

#### প্রযুক্তিগত বাস্তবায়ন
- **Microsoft Foundry Models আর্কিটেকচার**: gpt-4.1 + Key Vault + Container Apps প্যাটার্ন
- **সুরক্ষা**: ম্যানেজড আইডেন্টিটি রেডি, Key Vault-এ সিক্রেটস
- **মনিটরিং**: অ্যাপ্লিকেশন ইনসাইটস ইন্টিগ্রেশন
- **খরচ ব্যবস্থাপনা**: টোকেন ট্র্যাকিং এবং ব্যবহার অপটিমাইজেশন
- **ডিপ্লয়মেন্ট**: পূর্ণ সেটআপের জন্য একক `azd up` কমান্ড

### [v3.6.0] - ২০২৫-১১-১৯

#### প্রধান আপডেট: কন্টেইনার অ্যাপ ডিপ্লয়মেন্ট উদাহরণসমূহ
**এই সংস্করণটি Azure Developer CLI (AZD) ব্যবহার করে সম্পূর্ণ, প্রোডাকশন-রেডি কন্টেইনার অ্যাপ্লিকেশন ডিপ্লয়মেন্ট উদাহরণসমূহ এবং পূর্ণাঙ্গ দস্তাবেজসহ শিক্ষার পথে সংহত করে।**

#### যোগ করা হয়েছে
- **🚀 কন্টেইনার অ্যাপ উদাহরণসমূহ**: `examples/container-app/` -এ নতুন স্থানীয় উদাহরণ:
  - [মাস্টার গাইড](examples/container-app/README.md): কন্টেইনারাইজড ডিপ্লয়মেন্টের সম্পূর্ণ ওভারভিউ, দ্রুত শুরু, প্রোডাকশন, এবং উন্নত প্যাটার্নগুলি
  - [সহজ Flask API](../../examples/container-app/simple-flask-api): শিখতে সহজ REST API যার মধ্যে স্কেল-টু-জিরো, হেলথ প্রোবস, মনিটরিং, এবং সমস্যার সমাধান অন্তর্ভুক্ত
  - [মাইক্রোসার্ভিস আর্কিটেকচার](../../examples/container-app/microservices): প্রোডাকশন-রেডি মাল্টি-সার্ভিস ডিপ্লয়মেন্ট (API গেটওয়ে, প্রোডাক্ট, অর্ডার, ব্যবহারকারী, নোটিফিকেশন), অ্যাসিঙ্ক মেসেজিং, সার্ভিস বাস, কসমস ডিবি, আজুর এসকিউএল, বিতরণকৃত ট্রেসিং, ব্লু-গ্রিন/ক্যানারি ডিপ্লয়মেন্ট
- **সেরা অনুশীলনসমূহ**: কন্টেইনারাইজড ওয়ার্কলোডের জন্য সুরক্ষা, মনিটরিং, ব্যয় অপ্টিমাইজেশন এবং CI/CD নির্দেশনা
- **কোড নমুনা**: সম্পূর্ণ `azure.yaml`, Bicep টেমপ্লেট, এবং মাল্টি-ল্যাঙ্গুয়েজ সার্ভিস ইমপ্লিমেন্টেশন (Python, Node.js, C#, Go)
- **পরীক্ষা ও সমস্যা সমাধান**: শুরু থেকে শেষ পর্যন্ত পরীক্ষার পরিস্থিতি, মনিটরিং কমান্ড, এবং সমস্যা সমাধানের নির্দেশিকা

#### পরিবর্তিত হয়েছে
- **README.md**: নতুন কন্টেইনার অ্যাপ উদাহরণসমূহ "Local Examples - Container Applications" এর অধীনে বৈশিষ্ট্য এবং লিঙ্ক সহ আপডেট করা হয়েছে
- **examples/README.md**: কন্টেইনার অ্যাপ উদাহরণসমূহকে হাইলাইট করতে, তুলনা ম্যাট্রিক্স এন্ট্রি যোগ করতে, এবং প্রযুক্তি/সংস্থাপনা রেফারেন্স আপডেট করতে হয়েছে
- **কোর্স আউটলাইন ও স্টাডি গাইড**: নতুন কন্টেইনার অ্যাপ উদাহরণ এবং ডিপ্লয়মেন্ট প্যাটার্নগুলি উল্লেখ করার জন্য সংশ্লিষ্ট অধ্যায়সমূহ আপডেট করা হয়েছে

#### যাচাই করা হয়েছে
- ✅ নতুন সমস্ত উদাহরণ `azd up` দিয়ে ডিপ্লয়মেন্টযোগ্য এবং সেরা অনুশীলন অনুসরণ করে
- ✅ দস্তাবেজ ক্রস-লিঙ্ক এবং নেভিগেশন আপডেট হয়েছে
- ✅ উদাহরণগুলি প্রাথমিক থেকে উন্নত পরিস্থিতি, প্রোডাকশন মাইক্রোসার্ভিসসহ অন্তর্ভুক্ত করে

#### মন্তব্য
- **ব্যাপকতা**: কেবল ইংরেজি দস্তাবেজ এবং উদাহরণসমূহ
- **পরবর্তী ধাপ**: ভবিষ্যত সংস্করণে অতিরিক্ত উন্নত কন্টেইনার প্যাটার্ন এবং CI/CD অটোমেশন জোড়া হবে

### [v3.5.0] - ২০২৫-১১-১৯

#### পণ্য পুনঃব্র্যান্ডিং: Microsoft Foundry
**এই সংস্করণটি "Microsoft Foundry" থেকে "Microsoft Foundry" নামে ব্যাপক পণ্য নাম পরিবর্তন প্রয়োগ করেছে সমস্ত ইংরেজি দস্তাবেজে, যা Microsoft এর অফিসিয়াল পুনঃব্র্যান্ডিং প্রতিফলিত করে।**

#### পরিবর্তিত হয়েছে
- **🔄 পণ্যের নাম আপডেট**: সম্পূর্ণ পুনঃব্র্যান্ডিং "Microsoft Foundry" থেকে "Microsoft Foundry"
  - `docs/` ফোল্ডারে সমস্ত রেফারেন্স আপডেট করা হয়েছে
  - ফোল্ডার নাম পরিবর্তন: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - ফাইল নাম পরিবর্তন: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - মোট: ৭টি দস্তাবেজ ফাইলে ২৩টি কন্টেন্ট রেফারেন্স আপডেট

- **📁 ফোল্ডার কাঠামো পরিবর্তন**:
  - `docs/ai-foundry/` → `docs/microsoft-foundry/` নামকরণ করা হয়েছে
  - নতুন ফোল্ডার কাঠামো প্রতিফলিত করতে সমস্ত ক্রস-রেফারেন্স আপডেট করা হয়েছে
  - সমস্ত নেভিগেশন লিঙ্ক যাচাই করা হয়েছে

- **📄 ফাইল নাম পরিবর্তন**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - নতুন ফাইল নামের জন্য সমস্ত অভ্যন্তরীণ লিঙ্ক আপডেট করা হয়েছে

#### আপডেট হওয়া ফাইলসমূহ
- **অধ্যায় দস্তাবেজ** (৭টি ফাইল):
  - `docs/microsoft-foundry/ai-model-deployment.md` - ৩টি নেভিগেশন লিঙ্ক আপডেট
  - `docs/microsoft-foundry/ai-workshop-lab.md` - ৪টি পণ্য নাম রেফারেন্স আপডেট
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - পূর্ববর্তী আপডেট থেকে ইতিমধ্যেই Microsoft Foundry ব্যবহার করছে
  - `docs/microsoft-foundry/production-ai-practices.md` - ৩টি রেফারেন্স আপডেট (ওভারভিউ, কমিউনিটি ফিডব্যাক, দস্তাবেজাদি)
  - `docs/getting-started/azd-basics.md` - ৪টি ক্রস-রেফারেন্স লিঙ্ক আপডেট
  - `docs/getting-started/first-project.md` - ২টি অধ্যায় নেভিগেশন লিঙ্ক আপডেট
  - `docs/getting-started/installation.md` - ২টি পরবর্তী অধ্যায় লিঙ্ক আপডেট
  - `docs/troubleshooting/ai-troubleshooting.md` - ৩টি রেফারেন্স আপডেট (নেভিগেশন, Discord কমিউনিটি)
  - `docs/troubleshooting/common-issues.md` - ১টি নেভিগেশন লিঙ্ক আপডেট
  - `docs/troubleshooting/debugging.md` - ১টি নেভিগেশন লিঙ্ক আপডেট

- **কোর্স কাঠামো ফাইলসমূহ** (২টি ফাইল):
  - `README.md` - ১৭টি রেফারেন্স আপডেট (কোর্স ওভারভিউ, অধ্যায় শিরোনাম, টেমপ্লেট বিভাগ, কমিউনিটি অন্তর্দৃষ্টি)
  - `course-outline.md` - ১৪টি রেফারেন্স আপডেট (ওভারভিউ, শেখার উদ্দেশ্য, অধ্যায় সম্পদ)

#### যাচাই করা হয়েছে
- ✅ ইংরেজি দস্তাবেজে "ai-foundry" ফোল্ডার পথ রেফারেন্স শূন্য
- ✅ ইংরেজি দস্তাবেজে "Microsoft Foundry" পণ্যের নাম রেফারেন্স শূন্য
- ✅ নতুন ফোল্ডার কাঠামো সহ সমস্ত নেভিগেশন লিঙ্ক কার্যকর
- ✅ ফাইল ও ফোল্ডার নাম পরিবর্তন সফলভাবে সম্পন্ন
- ✅ অধ্যায়গুলির মধ্যে ক্রস-রেফারেন্স যাচাই

#### মন্তব্য
- **ব্যাপকতা**: পরিবর্তনগুলি কেবল `docs/` ফোল্ডারে ইংরেজি দস্তাবেজে প্রয়োগ করা হয়েছে
- **অনুবাদ**: অনুবাদ ফোল্ডারসমূহ (`translations/`) এই সংস্করণে আপডেট করা হয়নি
- **ওয়ার্কশপ**: ওয়ার্কশপ উপকরণ (`workshop/`) এই সংস্করণে আপডেট হয়নি
- **উদাহরণসমূহ**: উদাহরণ ফাইলগুলো এখনও পুরানো নাম উল্লেখ করতে পারে (ভবিষ্যৎ আপডেটে সমাধান হবে)
- **বাহ্যিক লিঙ্কসমূহ**: বাহ্যিক URL এবং GitHub রিপোজিটরি রেফারেন্স অপরিবর্তিত রয়েছে

#### অবদানকারীদের জন্য মাইগ্রেশন গাইড
যদি আপনার স্থানীয় ব্রাঞ্চ বা দস্তাবেজে পুরানো কাঠামো উল্লেখ থাকে:
১. ফোল্ডার রেফারেন্স আপডেট করুন: `docs/ai-foundry/` → `docs/microsoft-foundry/`
২. ফাইল রেফারেন্স আপডেট করুন: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
৩. পণ্যের নাম পরিবর্তন করুন: "Microsoft Foundry" → "Microsoft Foundry"
৪. সমস্ত অভ্যন্তরীণ দস্তাবেজ লিঙ্ক এখনও কাজ করে যাচাই করুন

---

### [v3.4.0] - ২০২৫-১০-২৪

#### অবকাঠামোগত প্রিভিউ এবং যাচাইকরণ উন্নতি
**এই সংস্করণটি Azure Developer CLI প্রিভিউ ফিচারের জন্য ব্যাপক সমর্থন এবং ওয়ার্কশপ ব্যবহারকারীর অভিজ্ঞতা উন্নত করে।**

#### যোগ করা হয়েছে
- **🧪 azd provision --preview ফিচার ডকুমেন্টেশন**: নতুন অবকাঠামো প্রিভিউ ক্ষমতার ব্যাপক কভারেজ
  - কমান্ড রেফারেন্স এবং ব্যবহার উদাহরণসমূহ চিটশিটে
  - প্রোভিশনিং গাইডে বিস্তারিত সংযোজন, ব্যবহারের ক্ষেত্র এবং সুবিধাসহ
  - নিরাপদ ডিপ্লয়মেন্ট যাচাইকরণের জন্য প্রি-ফ্লাইট চেক সংহতকরণ
  - সেফটি-ফার্স্ট ডিপ্লয়মেন্ট অনুশীলনের জন্য গেটিং স্টার্টেড গাইড আপডেট
- **🚧 ওয়ার্কশপ স্থিতি ব্যানার**: ওয়ার্কশপ উন্নয়ন অবস্থান নির্দেশক প্রোফেশনাল HTML ব্যানার
  - স্পষ্ট ব্যবহারকারী যোগাযোগের জন্য গ্রেডিয়েন্ট ডিজাইন এবং নির্মাণ সূচকসহ
  - স্বচ্ছতার জন্য সর্বশেষ সংশোধিত সময়সীমা
  - সমস্ত ডিভাইসের জন্য মোবাইল-রেসপন্সিভ ডিজাইন

#### উন্নত হয়েছে
- **অবকাঠামো সুরক্ষা**: ডিপ্লয়মেন্ট দস্তাবেজ জুড়ে প্রিভিউ কার্যকারিতা সংহত
- **পূর্ব ডিপ্লয়মেন্ট যাচাইকরণ**: স্বয়ংক্রিয় স্ক্রিপ্টে এখন অবকাঠামো প্রিভিউ পরীক্ষাও অন্তর্ভুক্ত
- **ডেভেলপার ওয়ার্কফ্লো**: সেরা অনুশীলনের অংশ হিসেবে প্রিভিউ অন্তর্ভুক্ত করে কমান্ড সিকোয়েন্স আপডেট
- **ওয়ার্কশপ অভিজ্ঞতা**: বিষয়বস্তু উন্নয়নের অবস্থা সম্পর্কে ব্যবহারকারীদের জন্য স্পষ্ট প্রত্যাশা নির্ধারণ

#### পরিবর্তিত হয়েছে
- **ডিপ্লয়মেন্ট সেরা অনুশীলন**: এখন প্রিভিউ-প্রথম ওয়ার্কফ্লো সুপারিশকৃত পদ্ধতি
- **দস্তাবেজ প্রবাহ**: অবকাঠামো যাচাইকরণ শেখার প্রক্রিয়ায় পূর্ববর্তী ধাপে স্থানান্তরিত
- **ওয়ার্কশপ উপস্থাপনা**: স্পষ্ট উন্নয়ন সময়রেখা সহ পেশাদার স্থিতি যোগাযোগ

#### উন্নত হয়েছে
- **সেফটি-ফার্স্ট পদ্ধতি**: ডিপ্লয়মেন্টের আগে এখন অবকাঠামোর পরিবর্তন যাচাই করা যায়
- **দলগত সহযোগিতা**: পর্যালোচনা ও অনুমোদনের জন্য প্রিভিউ ফলাফল শেয়ার করা যায়
- **ব্যয় সচেতনতা**: রিসোর্স খরচ পূর্ব ডিপ্লয়মেন্টে ভালভাবে বোঝা যায়
- **ঝুঁকি কমানো**: আগাম যাচাইকরণের মাধ্যমে ডিপ্লয়মেন্ট ব্যর্থতার ঝুঁকি কমেছে

#### প্রযুক্তিগত বাস্তবায়ন
- **একাধিক দস্তাবেজ সংহতকরণ**: ৪টি প্রধান ফাইলে প্রিভিউ ফিচার ডকুমেন্টেশন
- **কমান্ড প্যাটার্ন**: দস্তাবেজ জুড়ে ধারাবাহিক সিনট্যাক্স ও উদাহরণ
- **সেরা অনুশীলন সংহতকরণ**: যাচাইকরণ ওয়ার্কফ্লো এবং স্ক্রিপ্টে প্রিভিউ অন্তর্ভুক্ত
- **দৃশ্যমান সূচক**: নতুন ফিচার চিহ্নিতকরণের জন্য স্পষ্ট চিহ্ন

#### ওয়ার্কশপ অবকাঠামো
- **স্থিতি যোগাযোগ**: গ্রেডিয়েন্ট স্টাইল সহ পেশাদার HTML ব্যানার
- **ব্যবহারকারীর অভিজ্ঞতা**: স্পষ্ট উন্নয়ন অবস্থা বিভ্রান্তি প্রতিরোধ করে
- **পেশাদার উপস্থাপনা**: প্রত্যাশা নির্ধারণের সময় রিপোজিটরির ক্রেডিবিলিটি বজায় রাখে
- **সময়রেখার স্বচ্ছতা**: অক্টোবর ২০২৫ সর্বশেষ আপডেট সময়সীমা জন্য দায়িত্বশীলতা

### [v3.3.0] - ২০২৫-০৯-২৪

#### উন্নত ওয়ার্কশপ উপকরণ এবং ইন্টারেক্টিভ শেখার অভিজ্ঞতা
**এই সংস্করণটি ব্রাউজার-ভিত্তিক ইন্টারেক্টিভ গাইড এবং কাঠামোবদ্ধ শেখার পথসহ ব্যাপক ওয়ার্কশপ উপকরণ পরিচয় করায়।**

#### যোগ করা হয়েছে
- **🎥 ইন্টারেক্টিভ ওয়ার্কশপ গাইড**: MkDocs প্রিভিউ ক্ষমতা সহ ব্রাউজার-ভিত্তিক ওয়ার্কশপ অভিজ্ঞতা
- **📝 কাঠামোবদ্ধ ওয়ার্কশপ নির্দেশনা**: অনুসন্ধান থেকে কাস্টমাইজেশন পর্যন্ত ৭-ধাপের নির্দেশিত শেখার পথ
  - ০-পরিচিতি: ওয়ার্কশপ ওভারভিউ এবং সেটআপ
  - ১-AI-টেমপ্লেট নির্বাচন: টেমপ্লেট অনুসন্ধান ও নির্বাচন প্রক্রিয়া
  - ২-AI-টেমপ্লেট যাচাই: ডিপ্লয়মেন্ট ও যাচাইকরণ পদ্ধতি
  - ৩-AI-টেমপ্লেট অবকাঠামো বর্ণনা: টেমপ্লেট আর্কিটেকচার বোঝা
  - ৪-AI-টেমপ্লেট কনফিগারেশন: কনফিগারেশন ও কাস্টমাইজেশন
  - ৫-AI-টেমপ্লেট কাস্টমাইজেশন: উন্নত পরিবর্তন ও পুনরাবৃত্তি
  - ৬-ইনফ্রাস্ট্রাকচার পরিষ্কারকরণ: ক্লিনআপ ও রিসোর্স ব্যবস্থাপনা
  - ৭-সমাপ্তি: সারাংশ ও পরবর্তী ধাপসমূহ
- **🛠️ ওয়ার্কশপ টুলিং**: উন্নত শেখার অভিজ্ঞতার জন্য MkDocs কনফিগারেশন এবং Material থিম
- **🎯 হাতে-কলমে শেখার পথ**: ৩-ধাপ পদ্ধতি (অনুসন্ধান → ডিপ্লয়মেন্ট → কাস্টমাইজেশন)
- **📱 GitHub Codespaces ইন্টিগ্রেশন**: নির্বিঘ্ন ডেভেলপমেন্ট এনভায়রনমেন্ট সেটআপ

#### উন্নত হয়েছে
- **AI ওয়ার্কশপ ল্যাব**: ব্যাপক ২-৩ ঘণ্টার কাঠামোবদ্ধ শেখার অভিজ্ঞতার সঙ্গে বর্ধিত
- **ওয়ার্কশপ দস্তাবেজ**: পেশাদার উপস্থাপনা, নেভিগেশন এবং ভিজ্যুয়াল সহায়তা
- **শেখার অগ্রগতি**: টেমপ্লেট নির্বাচন থেকে প্রোডাকশন ডিপ্লয়মেন্ট পর্যন্ত স্পষ্ট ধাপে ধাপে নির্দেশনা
- **ডেভেলপার অভিজ্ঞতা**: স্ট্রিমলাইনকৃত ডেভেলপমেন্ট ওয়ার্কফ্লো জন্য সংহত টুলিং

#### উন্নত হয়েছে
- **অ্যাক্সেসিবিলিটি**: অনুসন্ধান, কপি কার্যকারিতা, এবং থিম টগল সহ ব্রাউজার-ভিত্তিক ইন্টারফেস
- **স্ব-গতিশীল শেখা**: বিভিন্ন শেখার গতি অনুযায়ী নমনীয় ওয়ার্কশপ কাঠামো
- **প্রায়োগিক ব্যবহার**: বাস্তব-জগতের AI টেমপ্লেট ডিপ্লয়মেন্ট পরিস্থিতি
- **কমিউনিটি ইন্টিগ্রেশন**: ওয়ার্কশপ সমর্থন ও সহযোগিতার জন্য Discord ইন্টিগ্রেশন

#### ওয়ার্কশপ বৈশিষ্ট্যসমূহ
- **অ্যাড-ইন সার্চ**: দ্রুত কীওয়ার্ড এবং লেসন অনুসন্ধান
- **কোড ব্লক কপি ফিচার**: হোভার করে সমস্ত কোড উদাহরণ কপি করার সুবিধা
- **থিম টগল**: ভিন্ন পছন্দের জন্য ডার্ক/লাইট মোড সাপোর্ট
- **ভিজ্যুয়াল উপকরণ**: উন্নত বোঝাপড়ার জন্য স্ক্রিনশট ও ডায়াগ্রাম
- **হেল্প ইন্টিগ্রেশন**: কমিউনিটি সমর্থনের জন্য সরাসরি Discord অ্যাক্সেস

### [v3.2.0] - ২০২৫-০৯-১৭

#### প্রধান নেভিগেশন পুনর্গঠন ও অধ্যায়-ভিত্তিক শেখার ব্যবস্থা
**এই সংস্করণে পুরো রিপোজিটরি জুড়ে উন্নত নেভিগেশনসহ বিস্তৃত অধ্যায়ভিত্তিক শেখার কাঠামো পরিচয় করানো হয়েছে।**

#### যোগ করা হয়েছে
- **📚 অধ্যায়-ভিত্তিক শেখার ব্যবস্থা**: ৮টি প্রগ্রেসিভ শেখার অধ্যায়ে পুরো কোর্স পুনর্গঠন
  - অধ্যায় ১: ভিত্তি ও দ্রুত শুরু (⭐ - ৩০-৪৫ মিনিট)
  - অধ্যায় ২: AI-ফার্স্ট ডেভেলপমেন্ট (⭐⭐ - ১-২ ঘণ্টা)
  - অধ্যায় ৩: কনফিগারেশন ও প্রমাণীকরণ (⭐⭐ - ৪৫-৬০ মিনিট)
  - অধ্যায় ৪: অবকাঠামো কোড ও ডিপ্লয়মেন্ট (⭐⭐⭐ - ১-১.৫ ঘণ্টা)
  - অধ্যায় ৫: মাল্টি-এজেন্ট AI সমাধান (⭐⭐⭐⭐ - ২-৩ ঘণ্টা)
  - অধ্যায় ৬: ডিপ্লয়মেন্ট পূর্ব যাচাইকরণ ও পরিকল্পনা (⭐⭐ - ১ ঘণ্টা)
  - অধ্যায় ৭: সমস্যার সমাধান ও ডিবাগিং (⭐⭐ - ১-১.৫ ঘণ্টা)
  - অধ্যায় ৮: প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্ন (⭐⭐⭐⭐ - ২-৩ ঘণ্টা)
- **📚 ব্যাপক নেভিগেশন ব্যবস্থা**: সমস্ত দস্তাবেজে ধারাবাহিক নেভিগেশন হেডার ও ফুটার
- **🎯 অগ্রগতি ট্র্যাকিং**: কোর্স সম্পন্নকরণের চেকলিস্ট ও শেখার যাচাই ব্যবস্থা
- **🗺️ শেখার পথ নির্দেশনা**: বিভিন্ন অভিজ্ঞতার স্তর ও লক্ষ্য অনুযায়ী স্পষ্ট প্রবেশ পয়েন্ট
- **🔗 ক্রস-রেফারেন্স নেভিগেশন**: সংশ্লিষ্ট অধ্যায় ও পূর্বশর্ত স্পষ্টভাবে লিঙ্ক করা হয়েছে

#### উন্নত হয়েছে
- **README কাঠামো**: অধ্যায়-ভিত্তিক সংগঠনের সঙ্গে কাঠামোবদ্ধ শেখার প্ল্যাটফর্মে রূপান্তরিত
- **দস্তাবেজ নেভিগেশন**: প্রতিটি পৃষ্ঠায় এখন অধ্যায়ের প্রসঙ্গ এবং অগ্রগতি নির্দেশনা অন্তর্ভুক্ত
- **টেমপ্লেট সংগঠন**: উদাহরণ ও টেমপ্লেট সংশ্লিষ্ট শেখার অধ্যায়ে মানচিত্রিত

- **রিসোর্স ইন্টিগ্রেশন**: সংশ্নিষ্ট অধ্যায়গুলির সাথে যুক্ত চিট শীট, FAQ এবং স্টাডি গাইড
- **ওয়ার্কশপ ইন্টিগ্রেশন**: একাধিক অধ্যায় শেখার উদ্দেশ্যের সাথে মানায় এমন হাতেকলমে ল্যাব

#### পরিবর্তিত
- **শেখার প্রগতি**: সরল ডকুমেন্টেশন থেকে নমনীয় অধ্যায়ভিত্তিক শিক্ষায় স্থানান্তরিত
- **কনফিগারেশন প্লেসমেন্ট**: উন্নত শেখার প্রবাহের জন্য কনফিগারেশন গাইডের অবস্থান অধ্যায় ৩ এ স্থানান্তরিত
- **AI কন্টেন্ট ইন্টিগ্রেশন**: শেখার যাত্রায় AI-বিশেষ বিষয়বস্তু আরও ভালোভাবে যুক্তকরণ
- **প্রোডাকশন কনটেন্ট**: এন্টারপ্রাইজ শিক্ষার্থীদের জন্য অধ্যায় ৮ এ উন্নত প্যাটার্ন সংহতকরণ

#### উন্নত
- **ব্যবহারকারীর অভিজ্ঞতা**: পরিষ্কার নেভিগেশন ব্রেডক্রাম্ব এবং অধ্যায়গত প্রগতি সূচক
- **অ্যাক্সেসিবিলিটি**: কোর্স পরিভ্রমণের জন্য সঙ্গতিপূর্ণ নেভিগেশন প্যাটার্ন
- **পেশাদার উপস্থাপনা**: একাডেমিক ও কর্পোরেট প্রশিক্ষণের জন্য বিশ্ববিদ্যালয়শৈলী কোর্স কাঠামো
- **শেখার দক্ষতা**: উন্নত সংগঠনের মাধ্যমে প্রাসঙ্গিক বিষয়বস্তু খুঁজে পাওয়ার জন্য সময় কমানো

#### প্রযুক্তিগত বাস্তবায়ন
- **নেভিগেশন হেডারস**: ৪০+ ডকুমেন্টেশন ফাইলে অধ্যায় নেভিগেশন স্বরূপকরণ
- **ফুটার নেভিগেশন**: সঙ্গতিপূর্ণ প্রগতি নির্দেশনা এবং অধ্যায় সম্পন্ন সূচক
- **ক্রস-লিংকিং**: সংশ্নিষ্ট ধারণাগুলিকে সংযুক্ত করার বিস্তৃত অভ্যন্তরীণ লিংকিং সিস্টেম
- **অধ্যায় ম্যাপিং**: টেমপ্লেট এবং উদাহরণগুলি স্পষ্টভাবে শেখার উদ্দেশ্যের সাথে যুক্ত

#### স্টাডি গাইড উন্নয়ন
- **📚 ব্যাপক শেখার উদ্দেশ্য**: ৮-অধ্যায়ের সিস্টেমের সাথে সামঞ্জস্যপূর্ণ স্টাডি গাইড পুনর্গঠন
- **🎯 অধ্যায়ভিত্তিক মূল্যায়ন**: প্রতিটি অধ্যায়ে নির্দিষ্ট শেখার উদ্দেশ্য এবং ব্যবহারিক অনুশীলন অন্তর্ভুক্ত
- **📋 অগ্রগতি ট্র্যাকিং**: সাপ্তাহিক শেখার সূচি যার মাধ্যমে পরিমাপযোগ্য ফলাফল ও সম্পন্নতার চেকলিস্ট
- **❓ মূল্যায়ন প্রশ্ন**: প্রতিটি অধ্যায়ের জন্য জ্ঞান যাচাই করার প্রশ্ন ও পেশাদার ফলাফল
- **🛠️ ব্যবহারিক অনুশীলন**: বাস্তব ডিপ্লয়মেন্ট সিনারিও এবং সমস্যার সমাধানসহ হাতেকলমে কার্যক্রম
- **📊 দক্ষতা উন্নতি**: বুনিয়াদি থেকে এন্টারপ্রাইজ প্যাটার্ন পর্যন্ত পরিষ্কার অগ্রগতি, ক্যারিয়ার উন্নয়নে কেন্দ্রীভূত
- **🎓 সার্টিফিকেশন ফ্রেমওয়ার্ক**: পেশাদার উন্নয়ন ফলাফল এবং কমিউনিটি স্বীকৃতি ব্যবস্থা
- **⏱️ সময়সীমার ব্যবস্থাপনা**: পর্যায়ক্রমিক যাচাইকরণ সহ গঠিত ১০ সপ্তাহের শেখার পরিকল্পনা

### [v3.1.0] - 2025-09-17

#### উন্নত বহু-এজেন্ট AI সমাধান
**এই সংস্করণটি বহু-এজেন্ট রিটেইল সমাধান উন্নত করেছে এবং এজেন্ট নামকরণ ও ডকুমেন্টেশন উন্নত করেছে।**

#### পরিবর্তিত
- **বহু-এজেন্ট টার্মিনোলজি**: রিটেইল বহু-এজেন্ট সমাধানে “Cora এজেন্ট” পরিবর্তে “Customer এজেন্ট” ব্যবহার করা হয়েছে স্পষ্টতার জন্য
- **এজেন্ট আর্কিটেকচার**: সব ডকুমেন্টেশন, ARM টেমপ্লেট ও কোড উদাহরণে সঙ্গতিপূর্ণ “Customer এজেন্ট” নামকরণ প্রয়োগ
- **কনফিগারেশন উদাহরণ**: আপডেটকৃত নামকরণের সাথে আধুনিক এজেন্ট কনফিগারেশন প্যাটার্ন
- **ডকুমেন্টেশন সামঞ্জস্যতা**: সব উল্লেখ পেশাদার, বর্ণনামূলক এজেন্ট নামকরণ নিশ্চিতকরণ

#### উন্নত
- **ARM টেমপ্লেট প্যাকেজ**: Customer এজেন্ট রেফারেন্স সহ retail-multiagent-arm-template আপডেট
- **আর্কিটেকচার ডায়াগ্রাম**: আপডেটকৃত এজেন্ট নামকরণের সাথে Mermaid ডায়াগ্রাম রিফ্রেশ
- **কোড উদাহরণ**: পাইথন ক্লাস ও বাস্তবায়ন উদাহরণ এখন CustomerAgent নামকরণ ব্যবহার করে
- **পরিবেশ পরিবর্তনশীল**: CUSTOMER_AGENT_NAME প্যাটার্ন ব্যবহার করে সব ডিপ্লয়মেন্ট স্ক্রিপ্ট আপডেট

#### উন্নত
- **ডেভেলপার অভিজ্ঞতা**: ডকুমেন্টেশনে আরও পরিষ্কার এজেন্ট ভূমিকা ও দায়িত্বগুলি
- **প্রোডাকশন রেডিনেস**: এন্টারপ্রাইজ নামকরণ প্যাটার্নের সাথে উন্নত সামঞ্জস্য
- **শিক্ষণসামগ্রী**: শিক্ষাগত উদ্দেশ্যে আরও স্বজ্ঞাত এজেন্ট নামকরণ
- **টেমপ্লেট ব্যবহারযোগ্যতা**: এজেন্ট ফাংশন এবং ডিপ্লয়মেন্ট প্যাটার্নের সহজবোধ্য বোধগম্যতা

#### প্রযুক্তিগত বিবরণ
- CustomerAgent রেফারেন্স সহ Mermaid আর্কিটেকচার ডায়াগ্রাম আপডেট করা হয়েছে
- পাইথন উদাহরণে CoraAgent ক্লাস নামগুলো CustomerAgent দ্বারা প্রতিস্থাপন করা হয়েছে
- "customer" এজেন্ট টাইপ ব্যবহারের জন্য ARM টেমপ্লেট JSON কনফিগারেশন পরিবর্তন করা হয়েছে
- পরিবেশ পরিবর্তনশীলগুলো CORA_AGENT_* থেকে CUSTOMER_AGENT_* প্যাটার্নে আপডেট করা হয়েছে
- সকল ডিপ্লয়মেন্ট কমান্ড এবং কনটেইনার কনফিগারেশন রিফ্রেশ করা হয়েছে

### [v3.0.0] - 2025-09-12

#### প্রধান পরিবর্তন - AI ডেভেলপার ফোকাস এবং Microsoft Foundry ইন্টিগ্রেশন
**এই সংস্করণটি Microsoft Foundry ইন্টিগ্রেশনের মাধ্যমে একটি বিস্তৃত AI-কেন্দ্রিক শেখার রিসোর্সে রেপোজিটোরি রূপান্তর করে।**

#### যোগ করা হয়েছে
- **🤖 AI-প্রথম শেখার পথ**: AI ডেভেলপার ও ইঞ্জিনিয়ারদের অগ্রাধিকার দিয়ে সম্পূর্ণ পুনর্গঠন
- **Microsoft Foundry ইন্টিগ্রেশন গাইড**: AZD কে Microsoft Foundry পরিষেবার সাথে সংযুক্ত করার ব্যাপক ডকুমেন্টেশন
- **AI মডেল ডিপ্লয়মেন্ট প্যাটার্ন**: মডেল নির্বাচন, কনফিগারেশন ও প্রোডাকশন ডিপ্লয়মেন্ট কৌশল নিয়ে বিস্তারিত গাইড
- **AI ওয়ার্কশপ ল্যাব**: AI অ্যাপ্লিকেশনকে AZD-ডিপ্লয়েবল সলিউশনে রূপান্তরের ২-৩ ঘণ্টার হাতেকলমে ওয়ার্কশপ
- **প্রোডাকশন AI বেস্ট প্র্যাকটিস**: AI ওয়ার্কলোড স্কেলিং, মনিটরিং এবং সুরক্ষার জন্য এন্টারপ্রাইজ-উপযোগী প্যাটার্ন
- **AI-বিশেষ ট্রাবলশুটিং গাইড**: Microsoft Foundry মডেল, Cognitive সার্ভিস ও AI ডিপ্লয়মেন্ট সমস্যা সমাধানের ব্যাপক গাইড
- **AI টেমপ্লেট গ্যালারি**: Microsoft Foundry টেমপ্লেট সমৃদ্ধ সংগ্রহ এবং জটিলতা রেটিং সহ
- **ওয়ার্কশপ উপকরণ**: হাতে-কলমে ল্যাব ও রেফারেন্স ম্যাটেরিয়ালসহ সম্পূর্ণ ওয়ার্কশপ কাঠামো

#### উন্নত
- **README কাঠামো**: Microsoft Foundry Discord থেকে ৪৫% কমিউনিটি ইন্টারেস্ট ডেটাসহ AI-ডেভেলপার ফোকাসড
- **শেখার পথ**: AI ডেভেলপার যাত্রা সহ ছাত্র এবং DevOps ইঞ্জিনিয়ারদের জন্য প্রচলিত পথ
- **টেমপ্লেট সুপারিশ**: azure-search-openai-demo, contoso-chat, এবং openai-chat-app-quickstart সহ AI টেমপ্লেট বৈশিষ্ট্যপূর্ণ
- **কমিউনিটি ইন্টিগ্রেশন**: AI-ভিত্তিক চ্যানেল এবং আলোচনা সহ উন্নত Discord কমিউনিটি সাপোর্ট

#### সুরক্ষা ও প্রোডাকশন ফোকাস
- **Managed Identity প্যাটার্ন**: AI-বিশেষ প্রমাণীকরণ এবং সুরক্ষা কনফিগারেশন
- **ব্যয় অপ্টিমাইজেশন**: টোকেন ব্যবহারের ট্র্যাকিং ও বাজেট নিয়ন্ত্রণ AI ওয়ার্কলোডের জন্য
- **মাল্টি-রিজিয়ন ডিপ্লয়মেন্ট**: বৈশ্বিক AI অ্যাপ্লিকেশন ডিপ্লয়মেন্ট কৌশল
- **পারফরম্যান্স মনিটরিং**: AI-স্পেসিফিক মেট্রিকস এবং অ্যাপ্লিকেশন ইনসাইটস ইন্টিগ্রেশন

#### ডকুমেন্টেশন গুণমান
- **রৈখিক কোর্স কাঠামো**: শুরু থেকে উন্নত AI ডিপ্লয়মেন্ট প্যাটার্ন সরল ও যৌক্তিক অগ্রগতি
- **যাচাইকৃত URL**: সব বহিরাগত রেপোজিটোরি লিংক যাচাই করা ও প্রবেশযোগ্য
- **সম্পূর্ণ রেফারেন্স**: সব অভ্যন্তরীণ ডকুমেন্টেশন লিংক যাচাই ও কার্যকর
- **প্রোডাকশন রেডি**: বাস্তব উদাহরণসহ এন্টারপ্রাইজ ডিপ্লয়মেন্ট প্যাটার্ন

### [v2.0.0] - 2025-09-09

#### প্রধান পরিবর্তন - রেপোজিটোরি পুনর্গঠন ও পেশাদার উন্নতি
**এই সংস্করণটি রেপোজিটোরির কাঠামো ও বিষয়বস্তুর উপস্থাপনার একটি গুরুত্বপূর্ণ সংস্কার।**

#### যোগ করা হয়েছে
- **গঠিত শেখার ফ্রেমওয়ার্ক**: সব ডকুমেন্টেশন পৃষ্ঠায় পরিচিতি, শেখার লক্ষ্য ও ফলাফল বিভাগ অন্তর্ভুক্ত
- **নেভিগেশন সিস্টেম**: নির্দেশিত শেখার জন্য সব ডকুমেন্টেশনে পূর্ববর্তী/পরবর্তী পাঠ লিঙ্ক যোগ
- **স্টাডি গাইড**: শেখার উদ্দেশ্য, অনুশীলন ও মূল্যায়ন সামগ্রী সহ ব্যাপক study-guide.md
- **পেশাদার উপস্থাপনা**: উন্নত অ্যাক্সেসিবিলিটিবের জন্য সব ইমোজি আইকন সরানো হয়েছে
- **উন্নত বিষয়বস্তু কাঠামো**: শেখার সামগ্রীর সংগঠন ও প্রবাহে উন্নতি

#### পরিবর্তিত
- **ডকুমেন্টেশন ফরম্যাট**: সব ডকুমেন্টেশন সামঞ্জস্যপূর্ণ শেখন-কেন্দ্রিক কাঠামো অনুসারে স্ট্যান্ডার্ডাইজ
- **নেভিগেশন প্রবাহ**: সব শেখার সামগ্রীতে যৌক্তিক অগ্রগতি বাস্তবায়ন
- **বিষয়বস্তুর উপস্থাপনা**: স্পষ্ট ও পেশাদার ফরম্যাটিংয়ের জন্য অলঙ্করণকারক উপাদান অপসারণ
- **লিঙ্ক কাঠামো**: নতুন নেভিগেশন সিস্টেম সমর্থনে সমস্ত অভ্যন্তরীণ লিঙ্ক আপডেট

#### উন্নত
- **অ্যাক্সেসিবিলিটি**: উন্নত স্ক্রিন রিডার সামঞ্জস্যতার জন্য ইমোজি নির্ভরতাগুলো সরানো হয়েছে
- **পেশাদার চেহারা**: পরিষ্কার, একাডেমিক-শৈলীর উপস্থাপনা এন্টারপ্রাইজ শেখার জন্য উপযুক্ত
- **শেখার অভিজ্ঞতা**: প্রত্যেক পাঠের জন্য স্পষ্ট উদ্দেশ্য ও ফলাফলের মাধ্যমে গঠিত পদ্ধতি
- **বিষয়বস্তু সংস্থা**: সম্পর্কিত বিষয়ের মধ্যে ভাল যৌক্তিক প্রবাহ ও সংযোগ

### [v1.0.0] - 2025-09-09

#### প্রাথমিক প্রকাশনা - বিস্তৃত AZD শেখার রেপোজিটোরি

#### যোগ করা হয়েছে
- **কোর ডকুমেন্টেশন কাঠামো**
  - সম্পূর্ণ গেটিং-স্টার্টেড গাইড সিরিজ
  - ব্যাপক ডিপ্লয়মেন্ট ও প্রোভিশনিং ডকুমেন্টেশন
  - বিস্তারিত ট্রাবলশুটিং রিসোর্স ও ডিবাগিং গাইড
  - প্রি-ডিপ্লয়মেন্ট যাচাইকরণ টুল ও পদ্ধতি

- **গেটিং স্টার্টেড মডিউল**
  - AZD মূল ধারণা ও শব্দাত্তর্ক
  - ইনস্টলেশন গাইড: প্ল্যাটফর্ম-নির্দিষ্ট সেটআপ নির্দেশনা
  - কনফিগারেশন গাইড: পরিবেশ সেটআপ ও প্রমাণীকরণ
  - প্রথম প্রকল্প টিউটোরিয়াল: ধাপে ধাপে হাতে-কলমে শেখা

- **ডিপ্লয়মেন্ট ও প্রোভিশনিং মডিউল**
  - ডিপ্লয়মেন্ট গাইড: সম্পূর্ণ কর্মপ্রবাহ ডকুমেন্টেশন
  - প্রোভিশনিং গাইড: Bicep দ্বারা ইনফ্রাস্ট্রাকচার অ্যাজ কোড
  - প্রোডাকশনের সর্বোত্তম অভ্যাস
  - মাল্টি-সার্ভিস আর্কিটেকচার প্যাটার্ন

- **প্রি-ডিপ্লয়মেন্ট ভ্যালিডেশন মডিউল**
  - ক্ষমতা পরিকল্পনা: Azure রিসোর্স উপলভ্যতা যাচাইকরণ
  - SKU নির্বাচন: ব্যাপক সার্ভিস স্তর নির্দেশিকা
  - প্রি-ফ্লাইট চেক: স্বয়ংক্রিয় যাচাইকরণ স্ক্রিপ্ট (PowerShell এবং Bash)
  - ব্যয় অনুমান এবং বাজেট পরিকল্পনা টুল

- **ট্রাবলশুটিং মডিউল**
  - সাধারণ সমস্যা: প্রায়শই দেখা সমস্যা ও সমাধান
  - ডিবাগিং গাইড: সিস্টেম্যাটিক সমস্যা সমাধান পদ্ধতি
  - উন্নত নির্ণায়ক কৌশল ও টুল
  - কার্যক্ষমতা মনিটরিং ও অপ্টিমাইজেশন

- **রিসোর্স ও রেফারেন্স**
  - কমান্ড চিট শীট: প্রয়োজনীয় কমান্ডের দ্রুত রেফারেন্স
  - গ্লোসারি: ব্যাপক শব্দ ও সংক্ষিপ্ত রূপ সংজ্ঞা
  - FAQ: সাধারণ প্রশ্নের বিস্তারিত উত্তর
  - বহিরাগত রিসোর্স লিংক ও কমিউনিটি সংযোগ

- **উদাহরণ ও টেমপ্লেট**
  - সহজ ওয়েব অ্যাপ্লিকেশন উদাহরণ
  - স্ট্যাটিক ওয়েবসাইট ডিপ্লয়মেন্ট টেমপ্লেট
  - কনটেইনার অ্যাপ্লিকেশন কনফিগারেশন
  - ডাটাবেস ইন্টিগ্রেশন প্যাটার্ন
  - মাইক্রোসার্ভিসেস আর্কিটেকচার উদাহরণ
  - সার্ভারলেস ফাংশন বাস্তবায়ন

#### বৈশিষ্ট্যসমূহ
- **বহু-প্ল্যাটফর্ম সাপোর্ট**: Windows, macOS, Linux ইনস্টলেশন ও কনফিগারেশন গাইড
- **বহু দক্ষতা স্তর**: ছাত্র থেকে পেশাদার ডেভেলপারের জন্য বিষয়বস্তু ডিজাইন
- **প্রায়োগিক দৃষ্টি**: হাতেকলমে উদাহরণ ও বাস্তব জগতের সিনারিও
- **ব্যাপক কাভারেজ**: বুনিয়াদি ধারণা থেকে উন্নত এন্টারপ্রাইজ প্যাটার্ন পর্যন্ত
- **সুরক্ষা-প্রথম পদ্ধতি**: সুরক্ষা সর্বোত্তম অভ্যাস সমগ্র বিষয়ে অন্তর্ভুক্ত
- **ব্যয় অপ্টিমাইজেশন**: খরচ-সাশ্রয়ী ডিপ্লয়মেন্ট এবং রিসোর্স ব্যবস্থাপনার নির্দেশিকা

#### ডকুমেন্টেশন গুণগত মান
- **বিস্তারিত কোড উদাহরণ**: ব্যবহারিক, পরীক্ষা করা কোড নমুনা
- **ধাপে ধাপে নির্দেশনা**: স্পষ্ট, কার্যকরী দিকনির্দেশনা
- **ব্যাপক ত্রুটি ব্যবস্থাপনা**: সাধারণ সমস্যার ট্রাবলশুটিং
- **সর্বোত্তম অভ্যাস সমন্বয়**: শিল্প মান ও সুপারিশ
- **ভার্সন সামঞ্জস্যতা**: সর্বশেষ Azure পরিষেবা এবং azd ফিচার সহ হালনাগাদ

## ভবিষ্যৎ উন্নয়নের পরিকল্পনা

### ভার্সন ৩.১.০ (পরিকল্পিত)
#### AI প্ল্যাটফর্ম সম্প্রসারণ
- **বহু-মডেল সাপোর্ট**: Hugging Face, Azure Machine Learning, এবং কাস্টম মডেল ইন্টিগ্রেশন প্যাটার্ন
- **AI এজেন্ট ফ্রেমওয়ার্ক**: LangChain, Semantic Kernel, এবং AutoGen ডিপ্লয়মেন্ট টেমপ্লেট
- **অ্যাডভান্সড RAG প্যাটার্ন**: Azure AI Search ছাড়াও Pinecone, Weaviate সহ ভেক্টর ডাটাবেস বিকল্প
- **AI পর্যবেক্ষণযোগ্যতা**: মডেল পারফরম্যান্স, টোকেন ব্যবহার, ও প্রতিক্রিয়া গুণ নিরীক্ষণে উন্নতি

#### ডেভেলপার অভিজ্ঞতা
- **VS কোড এক্সটেনশন**: সমন্বিত AZD + Microsoft Foundry ডেভেলপমেন্ট অভিজ্ঞতা
- **GitHub Copilot ইন্টিগ্রেশন**: AI-সহায়িত AZD টেমপ্লেট তৈরির সুবিধা
- **ইন্টারেক্টিভ টিউটোরিয়াল**: স্বয়ংক্রিয় যাচাইকরণ সহ AI সিনারিওর জন্য হাতেকলমে কোডিং অনুশীলন
- **ভিডিও কন্টেন্ট**: ভিজ্যুয়াল শিক্ষার্থীদের জন্য AI ডিপ্লয়মেন্ট ফোকাসড অতিরিক্ত ভিডিও টিউটোরিয়াল

### ভার্সন ৪.০.০ (পরিকল্পিত)
#### এন্টারপ্রাইজ AI প্যাটার্ন
- **শাসন কাঠামো**: AI মডেল শাসন, সম্মতি ও নিরীক্ষা ট্রেইল
- **বহু-টেন্যান্ট AI**: পৃথক AI পরিষেবা দিয়ে একাধিক গ্রাহক সেবা প্যাটার্ন
- **এজ AI ডিপ্লয়মেন্ট**: Azure IoT Edge এবং কনটেইনার ইনস্ট্যান্সের সাথে ইন্টিগ্রেশন
- **হাইব্রিড ক্লাউড AI**: AI ওয়ার্কলোডের মাল্টি-ক্লাউড ও হাইব্রিড ডিপ্লয়মেন্ট প্যাটার্ন

#### উন্নত বৈশিষ্ট্যসমূহ
- **AI পাইপলাইন অটোমেশন**: Azure Machine Learning পাইপলাইনের সাথে MLOps ইন্টিগ্রেশন
- **অ্যাডভান্সড সুরক্ষা**: জিরো-ট্রাস্ট প্যাটার্ন, প্রাইভেট এন্ডপয়েন্ট, এবং উন্নত হুমকি সুরক্ষা
- **পারফরম্যান্স অপ্টিমাইজেশন**: উচ্চ-থ্রুপুট AI অ্যাপ্লিকেশনগুলোর জন্য টিউনিং ও স্কেলিং কৌশল
- **গ্লোবাল বিতরণ**: AI অ্যাপ্লিকেশন জন্য কনটেন্ট ডেলিভারি এবং এজ ক্যাশিং প্যাটার্ন

### ভার্সন ৩.০.০ (পরিকল্পিত) - বর্তমান রিলিজ দ্বারা প্রতিস্থাপিত
#### প্রস্তাবিত সংযোজন - এখন v3.0.0 তে প্রয়োগ করা হয়েছে
- ✅ **AI-কেন্দ্রিক বিষয়বস্তু**: Microsoft Foundry ব্যাপক ইন্টিগ্রেশন (সম্পন্ন)
- ✅ **ইন্টারেক্টিভ টিউটোরিয়াল**: হাতেকলমে AI ওয়ার্কশপ ল্যাব (সম্পন্ন)
- ✅ **উন্নত সুরক্ষা মডিউল**: AI-বিশেষ সুরক্ষা প্যাটার্ন (সম্পন্ন)
- ✅ **পারফরম্যান্স অপ্টিমাইজেশন**: AI ওয়ার্কলোড টিউনিং কৌশল (সম্পন্ন)

### ভার্সন ২.১.০ (পরিকল্পিত) - আংশিকভাবে v3.0.0 এ প্রয়োগিত
#### ছোটখাটো উন্নয়ন - কিছু বর্তমান রিলিজে সম্পন্ন
- ✅ **অতিরিক্ত উদাহরণসমূহ**: AI-কেন্দ্রিক ডিপ্লয়মেন্ট সিনারিও (সম্পন্ন)
- ✅ **বর্ধিত FAQ**: AI-বিশেষ প্রশ্ন ও ট্রাবলশুটিং (সম্পন্ন)
- **টুল ইন্টিগ্রেশন**: উন্নত IDE ও এডিটর ইন্টিগ্রেশন গাইড
- ✅ **মনিটরিং সম্প্রসারণ**: AI-বিশেষ মনিটরিং ও সতর্কতা প্যাটার্ন (সম্পন্ন)

#### ভবিষ্যত রিলিজের জন্য এখনো পরিকল্পিত
- **মোবাইল-সুবিধাজনক ডকুমেন্টেশন**: মোবাইল শিক্ষার জন্য প্রতিক্রিয়াশীল ডিজাইন
- **অফলাইন অ্যাক্সেস**: ডাউনলোডযোগ্য ডকুমেন্টেশন প্যাকেজ
- **উন্নত IDE ইন্টিগ্রেশন**: AZD + AI ওয়ার্কফ্লোর জন্য VS কোড এক্সটেনশন
- **কমিউনিটি ড্যাশবোর্ড**: রিয়েল-টাইম কমিউনিটি মেট্রিক্স এবং অবদান ট্র্যাকিং

## চেঞ্জলগে অবদান রাখা

### পরিবর্তন রিপোর্ট করা
এই রেপোজিটোরিতে অবদান রাখার সময়, দয়া করে নিশ্চিত করুন চেঞ্জলগ এন্ট্রিগুলো অন্তর্ভুক্ত:

১. **ভার্সন নম্বর**: সেমান্টিক ভার্সনিং অনুসরণ করে (মেজর.মাইনর.প্যাচ)
২. **তারিখ**: মুক্তি বা আপডেটের দিনলিপি YYYY-MM-DD ফরম্যাটে
৩. **বিভাগ**: যোগ করা হয়েছে, পরিবর্তিত, অবসান, সরানো হয়েছে, সংশোধিত, সুরক্ষা
৪. **পরিষ্কার বর্ণনা**: কি পরিবর্তিত হয়েছে সংক্ষিপ্ত বর্ণনা
৫. **প্রভাব মূল্যায়ন**: পরিবর্তন কিভাবে বিদ্যমান ব্যবহারকারীদের প্রভাবিত করে

### পরিবর্তন বিভাগের ধরন

#### যোগ করা হয়েছে
- নতুন বৈশিষ্ট্য, ডকুমেন্টেশন বিভাগ বা সক্ষমতা
- নতুন উদাহরণ, টেমপ্লেট বা শেখার রিসোর্স
- অতিরিক্ত টুল, স্ক্রিপ্ট বা ইউটিলিটি

#### পরিবর্তিত
- বিদ্যমান কার্যকারিতা বা ডকুমেন্টেশনে পরিবর্তন
- স্পষ্টতা বা নির্ভুলতা উন্নত করার জন্য আপডেট
- বিষয়বস্তু বা সংগঠনের পুনর্গঠন

#### অবসান
- বাদ দেওয়া হচ্ছে এমন বৈশিষ্ট্য বা পদ্ধতি
- ডকুমেন্টেশন বিভাগগুলো যা সরানো হবে
- যেসব পদ্ধতির বিকল্প ভালোভাবে উপলব্ধ

#### সরানো হয়েছে
- আর প্রাসঙ্গিক নয় এমন বৈশিষ্ট্য, ডকুমেন্টেশন বা উদাহরণ
- পুরানো তথ্য বা অবসান হওয়া পদ্ধতি
- পুনরাবৃত্ত বা সংহত বিষয়বস্তু

#### সংশোধিত
- ডকুমেন্টেশন বা কোডের ত্রুটি সংশোধন
- রিপোর্টকৃত সমস্যা বা সমস্যার সমাধান
- নির্ভুলতা বা কার্যকারিতা উন্নতি


#### নিরাপত্তা
- নিরাপত্তা সম্পর্কিত উন্নতি বা সংশোধন
- নিরাপত্তার সর্বোত্তম অনুশীলনের আপডেট
- নিরাপত্তা দুর্বলতার সমাধান

### সেমান্টিক সংস্করণ নির্দেশিকা

#### প্রধান সংস্করণ (X.0.0)
- ব্যবহারকারীর পদক্ষেপের প্রয়োজন এমন বড় পরিবর্তন
- বিষয়বস্তু বা সংগঠনের উল্লেখযোগ্য পুনরায় গঠন
- মৌলিক পদ্ধতি বা পদ্ধতিতে পরিবর্তন

#### ক্ষুদ্র সংস্করণ (X.Y.0)
- নতুন ফিচার বা বিষয়বস্তু সংযোজন
- ব্যাকওয়ার্ড সামঞ্জস্য বজায় রেখে উন্নতি
- অতিরিক্ত উদাহরণ, টুলস বা সম্পদ

#### প্যাচ সংস্করণ (X.Y.Z)
- বাগ সংশোধন এবং শোধরানো
- বিদ্যমান বিষয়বস্তুতে ক্ষুদ্র উন্নতি
- স্পষ্টীকরণ এবং ছোটখাটো উন্নতি

## সম্প্রদায় প্রতিক্রিয়া এবং প্রস্তাবনা

আমরা এই শিক্ষণ উৎস উন্নত করতে সম্প্রদায়ের প্রতিক্রিয়াকে সক্রিয়ভাবে উৎসাহিত করি:

### প্রতিক্রিয়া কীভাবে প্রদান করবেন
- **GitHub Issues**: সমস্যা প্রতিবেদন করুন বা উন্নতির প্রস্তাব দিন (AI-সংক্রান্ত সমস্যাও স্বাগত)
- **Discord Discussions**: Microsoft Foundry সম্প্রদায়ের সাথে ধারণা শেয়ার করুন এবং আলোচনা করুন
- **Pull Requests**: বিষয়বস্তুতে সরাসরি উন্নতি নিয়ে আসুন, বিশেষ করে AI টেমপ্লেট এবং গাইডে
- **Microsoft Foundry Discord**: AZD + AI আলোচনার জন্য #Azure চ্যানেলে অংশগ্রহণ করুন
- **Community Forums**: বিস্তৃত Azure ডেভেলপার আলোচনায় অংশ নিন

### প্রতিক্রিয়া বিভাগসমূহ
- **AI বিষয়বস্তু সঠিকতা**: AI সার্ভিস ইন্টিগ্রেশন এবং ডিপ্লয়মেন্ট তথ্য সংশোধন
- **শিক্ষণ অভিজ্ঞতা**: উন্নত AI ডেভেলপার শেখার প্রবাহের প্রস্তাবনা
- **অনুপস্থিত AI বিষয়বস্তু**: অতিরিক্ত AI টেমপ্লেট, প্যাটার্ন বা উদাহরণের অনুরোধ
- **অ্যাক্সেসিবিলিটি**: বিভিন্ন শিখন চাহিদার জন্য উন্নতি
- **AI টুল ইন্টিগ্রেশন**: উন্নত AI ডেভেলপমেন্ট ওয়ার্কফ্লো ইন্টিগ্রেশনের প্রস্তাবনা
- **প্রোডাকশন AI প্যাটার্ন**: এন্টারপ্রাইজ AI ডিপ্লয়মেন্ট প্যাটার্ন অনুরোধ

### প্রতিক্রিয়া অঙ্গীকার
- **সমস্যা প্রতিক্রিয়া**: রিপোর্টকৃত সমস্যার জন্য ৪৮ ঘন্টার মধ্যে
- **ফিচার অনুরোধ**: এক সপ্তাহের মধ্যে মূল্যায়ন
- **সম্প্রদায় অবদান**: এক সপ্তাহের মধ্যে পর্যালোচনা
- **নিরাপত্তা সমস্যা**: তাৎক্ষণিক অগ্রাধিকার ও দ্রুত প্রতিক্রিয়া

## রক্ষণাবেক্ষণ সময়সূচী

### নিয়মিত আপডেট
- **মাসিক পর্যালোচনা**: বিষয়বস্তু সঠিকতা এবং লিঙ্ক যাচাই
- **ত্রৈমাসিক আপডেট**: প্রধান বিষয়বস্তু সংযোজন এবং উন্নতি
- **অর্ধবার্ষিক পর্যালোচনা**: ব্যাপক পুনর্গঠন এবং উন্নয়ন
- **বার্ষিক প্রকাশনা**: উল্লেখযোগ্য উন্নতির সাথে প্রধান সংস্করণ আপডেট

### মনিটরিং এবং গুণগত নিশ্চয়তা
- **স্বয়ংক্রিয় পরীক্ষা**: নিয়মিত কোড উদাহরণ ও লিঙ্কের যাচাই
- **সম্প্রদায় প্রতিক্রিয়া একীকরণ**: নিয়মিত ব্যবহারকারী প্রস্তাবনা অন্তর্ভুক্তকরণ
- **প্রযুক্তি আপডেট**: সর্বশেষ Azure সার্ভিস ও azd প্রকাশনার সাথে সামঞ্জস্য
- **অ্যাক্সেসিবিলিটি অডিট**: অন্তর্ভুক্তিমূলক ডিজাইন নীতিমালা নিয়মিত পর্যালোচনা

## সংস্করণ সমর্থন নীতি

### বর্তমান সংস্করণ সমর্থন
- **সর্বশেষ প্রধান সংস্করণ**: সম্পূর্ণ সমর্থন ও নিয়মিত আপডেট
- **পূর্ববর্তী প্রধান সংস্করণ**: ১২ মাসের জন্য নিরাপত্তা আপডেট এবং গুরুত্বপূর্ণ সংশোধন
- **পুরাতন সংস্করণ**: শুধুমাত্র সম্প্রদায় সমর্থন, কোন অফিসিয়াল আপডেট নেই

### স্থানান্তর নির্দেশিকা
যখন প্রধান সংস্করণ প্রকাশ পায়, আমরা প্রদান করি:
- **স্থানান্তর গাইড**: ধাপে ধাপে ট্রানজিশন নির্দেশনা
- **সামঞ্জস্য নোট**: ভাঙ্গনমূলক পরিবর্তনের বিবরণ
- **টুল সাপোর্ট**: স্থানান্তরে সাহায্যের জন্য স্ক্রিপ্ট বা ইউটিলিটি
- **সম্প্রদায় সমর্থন**: স্থানান্তর প্রশ্নের জন্য নিবেদিত ফোরাম

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [Study Guide](resources/study-guide.md)
- **পরবর্তী পাঠ**: ফিরে যান [Main README](README.md)

**আপডেট থাকুন**: এই রেপোজিটরিটি মনিটর করুন নতুন রিলিজ এবং শেখার সামগ্রীর গুরুত্বপূর্ণ আপডেটের নোটিফিকেশনের জন্য।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->