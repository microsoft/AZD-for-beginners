# 2. Validate a Template

> Validated against `azd 1.25.6` in June 2026.

!!! tip "এই মডিউলের শেষে আপনি সক্ষম হবেন"

    - [ ] AI সলিউশন আর্কিটেকচার বিশ্লেষণ করা
    - [ ] AZD ডিপ্লয়মেন্ট ওয়ার্কফ্লো বুঝা
    - [ ] AZD ব্যবহারের উপর সাহায্যের জন্য GitHub Copilot ব্যবহার করা
    - [ ] **Lab 2:** AI Agents টেমপ্লেট ডিপ্লয় ও যাচাই করা

---


## 1. Introduction

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) or `azd` হল একটি ওপেন-সোর্স কমান্ডলাইন টুল যা Azure-এ অ্যাপ্লিকেশন তৈরি এবং ডিপ্লয় করার সময় ডেভেলপার ওয়ার্কফ্লোকে সরল করে। 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) হল স্ট্যান্ডার্ডাইজড রেপোজিটরি যা স্যাম্পল অ্যাপ্লিকেশন কোড, _infrastructure-as-code_ অ্যাসেট, এবং একটি সমন্বিত সলিউশন আর্কিটেকচারের জন্য `azd` কনফিগারেশন ফাইলগুলোকে অন্তর্ভুক্ত করে। ইনফ্রাস্ট্রাকচার প্রোভিশন করা একটি `azd provision` কমান্ডের মতো সহজ হয়ে যায় - আর `azd up` ব্যবহার করলে একবারে ইনফ্রাস্ট্রাকচার প্রোভিশন এবং আপনার অ্যাপ্লিকেশন ডিপ্লয় দুটোই করা যায়!

ফল স্বরূপ, আপনার অ্যাপ্লিকেশন ডেভেলপমেন্ট শুরু করা মাত্রই সঠিক _AZD Starter template_ খুঁজে বের করা যেটা আপনার অ্যাপ্লিকেশন ও ইনফ্রাসট্রাকচারের প্রয়োজনের কাছাকাছি — তারপর সেই রেপোটি আপনার চাহিদা অনুযায়ী কাস্টমাইজ করুন।

শুরু করার আগে, নিশ্চিত করুন যে আপনার কাছে Azure Developer CLI ইনস্টল আছে।

1. একটি VS Code টার্মিনাল খুলুন এবং এই কমান্ডটি টাইপ করুন:

      ```bash title="" linenums="0"
      azd version
      ```

1. আপনি এরকম কিছু দেখতে পাবেন!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**এখন আপনি azd দিয়ে একটি টেমপ্লেট নির্বাচন এবং ডিপ্লয় করার জন্য প্রস্তুত**

---

## 2. Template Selection

Microsoft Foundry প্ল্যাটফর্মে [প্রস্তাবিত AZD টেমপ্লেটের একটি সেট](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) রয়েছে যা জনপ্রিয় সলিউশন সীনারিওগুলো ঢেকে—যেমন _multi-agent workflow automation_ এবং _multi-modal content processing_। আপনি Microsoft Foundry পোর্টাল ভিজিট করেও এই টেমপ্লেটগুলো আবিষ্কার করতে পারেন।

1. ভিজিট করুন [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. প্রম্পট দিলে Microsoft Foundry পোর্টালে লগ ইন করুন - আপনি এরকম কিছু দেখতে পাবেন।

![টেমপ্লেট নির্বাচন](../../../../../translated_images/bn/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** অপশনগুলো আপনার স্টার্টার টেমপ্লেট:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) যা একটি বেসিক চ্যাট অ্যাপ্লিকেশন _আপনার ডেটা সহ_ Azure Container Apps-এ ডিপ্লয় করে। এটি একটি বেসিক AI চ্যাটবট সীনারিও অন্বেষণ করার জন্য ব্যবহার করুন।
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) যা একটি স্ট্যান্ডার্ড AI Agent (Foundry Agents সহ) ডিপ্লয় করে। টুল এবং মডেল জড়িত agentic AI সলিউশনগুলোতে অভ্যস্ত হতে এটি ব্যবহার করুন।

দ্বিতীয় লিঙ্কটি একটি নতুন ব্রাউজার ট্যাবে খুলুন (অথবা সংশ্লিষ্ট কার্ডের জন্য `Open in GitHub` ক্লিক করুন)। আপনি এই AZD টেমপ্লেটের রেপোজিটরি দেখতে পারবেন। README এক মিনিট ঘেঁটে দেখুন। অ্যাপ্লিকেশন আর্কিটেকচার এরকম দেখতে:

![আর্কিটেকচার](../../../../../translated_images/bn/architecture.8cec470ec15c65c7.webp)

---

## 3. Template Activation

চলুন এই টেমপ্লেটটি ডিপ্লয় করে দেখি এবং নিশ্চিত করি এটি বৈধ। আমরা [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) সেকশনের নির্দেশনা অনুসরণ করব।

1. টেমপ্লেট রেপো জন্য একটি কাজের পরিবেশ নির্বাচন করুন:

      - **GitHub Codespaces**: এই লিঙ্কটি ক্লিক করুন [https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents] এবং `Create codespace` নিশ্চিত করুন
      - **Local clone or dev container**: `Azure-Samples/get-started-with-ai-agents` ক্লোন করে VS Code-এ খুলুন

1. VS Code টার্মিনাল প্রস্তুত হওয়ার জন্য অপেক্ষা করুন, তারপর নিম্নোক্ত কমান্ডটি টাইপ করুন:

   ```bash title="" linenums="0"
   azd up
   ```

এই কমান্ডটি ট্রিগার করবে এমন ওয়ার্কফ্লো ধাপগুলো সম্পন্ন করুন:

1. আপনাকে Azure-এ লগ ইন করার জন্য বলা হবে - প্রমাণীকরণের নির্দেশনা অনুসরণ করুন
1. আপনার জন্য একটি ইউনিক environment নাম প্রবেশ করান - উদাহরণস্বরূপ, আমি ব্যবহার করেছি `nitya-mshack-azd`
1. এটি একটি `.azure/` ফোল্ডার তৈরি করবে - আপনি env নামের সাবফোল্ডার দেখতে পাবেন
1. আপনাকে একটি subscription নাম নির্বাচন করতে বলা হবে - ডিফল্টটি নির্বাচন করুন
1. আপনাকে একটি লোকেশন নির্বাচন করতে বলা হবে - `East US 2` ব্যবহার করুন

এখন, প্রোভিশনিং সম্পন্ন হওয়া পর্যন্ত অপেক্ষা করুন। **এতে 10-15 মিনিট সময় লাগে**

1. শেষ হলে, আপনার কনসোলে একটি SUCCESS মেসেজ দেখাবে, যা এরকম হবে:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. আপনার Azure Portal-এ এখন ঐ env নাম সহ একটি প্রোভিশন্ড রিসোর্স গ্রুপ থাকবে:

      ![প্রোভিশন্ড ইনফ্রা](../../../../../translated_images/bn/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **আপনি এখন ডিপ্লয়কৃত ইনফ্রাস্ট্রাকচার এবং অ্যাপ্লিকেশন যাচাই করার জন্য প্রস্তুত**।

---

## 4. Template Validation

1. Azure Portal-এ [Resource Groups](https://portal.azure.com/#browse/resourcegroups) পেজে যান - প্রম্পট দিলে লগ ইন করুন
1. আপনার environment নামের RG-এ ক্লিক করুন - উপরের পেজটি দেখবেন

      - Azure Container Apps রিসোর্সে ক্লিক করুন
      - _Essentials_ সেকশনের (উপরে ডান দিকে) Application Url-এ ক্লিক করুন

1. আপনি এরকম একটি হোস্টেড অ্যাপ্লিকেশন ফ্রন্ট-এন্ড UI দেখতে পাবেন:

   ![অ্যাপ্লিকেশন](../../../../../translated_images/bn/03-test-application.471910da12c3038e.webp)

1. কয়েকটি [নমুনা প্রশ্ন](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) জিজ্ঞাসা করে দেখুন

      1. জিজ্ঞাসা করুন: ```What is the capital of France?``` 
      1. জিজ্ঞাসা করুন: ```What's the best tent under $200 for two people, and what features does it include?```

1. আপনি নিচে দেখানোর মতো উত্তর পাবেন। _কিন্তু এটি কীভাবে কাজ করে?_ 

      ![অ্যাপ প্রশ্ন](../../../../../translated_images/bn/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Agent Validation

Azure Container App একটি এন্ডপয়েন্ট ডিপ্লয় করে যা এই টেমপ্লেটের জন্য Microsoft Foundry প্রজেক্টে প্রোভিশন্ড AI Agent-এর সাথে সংযুক্ত থাকে। চলুন দেখি সেটা কী 의미।

1. আপনার রিসোর্স গ্রুপের জন্য Azure Portal _Overview_ পেজে ফিরে যান

1. সেই তালিকায় `Microsoft Foundry` রিসোর্সে ক্লিক করুন

1. আপনি এটি দেখতে পাবেন। `Go to Microsoft Foundry Portal` বোতামে ক্লিক করুন। 
   ![Foundry পোর্টাল নির্দেশক](../../../../../translated_images/bn/04-view-foundry-project.fb94ca41803f28f3.webp)

1. আপনি আপনার AI অ্যাপ্লিকেশনের Foundry Project পেজ দেখতে পাবেন
   ![প্রজেক্ট পেজ](../../../../../translated_images/bn/05-visit-foundry-portal.d734e98135892d7e.webp)

1. `Agents` এ ক্লিক করুন - আপনি আপনার প্রজেক্টে ডিফল্টভাবে প্রোভিশন্ড Agent দেখতে পাবেন
   ![এজেন্ট তালিকা](../../../../../translated_images/bn/06-visit-agents.bccb263f77b00a09.webp)

1. এটিকে সিলেক্ট করুন - এবং আপনি Agent-এর বিবরণ দেখতে পাবেন। নিচের বিষয়গুলো নজর দিন:

      - এজেন্ট ডিফল্টভাবে File Search ব্যবহার করে (সবসময়)
      - এজেন্টের `Knowledge` দেখায় যে এতে 32টি ফাইল আপলোড করা আছে (file search-এর জন্য)
      ![এজেন্ট বিবরণ](../../../../../translated_images/bn/07-view-agent-details.0e049f37f61eae62.webp)

1. বাম মেনুতে `Data+indexes` অপশন খুঁজে বের করে বিস্তারিত দেখতে ক্লিক করুন। 

      - আপনি জ্ঞান হিসাবে আপলোড করা 32টি ডেটা ফাইল দেখতে পাবেন।
      - এগুলো `src/files`-এর অধীনে থাকা 12টি customer ফাইল এবং 20টি product ফাইলের সাথে মিলবে 
      ![ডেটা ও ইনডেক্স](../../../../../translated_images/bn/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**আপনি এজেন্ট অপারেশন যাচাই করেছেন!** 

1. এজেন্টের প্রতিক্রিয়াগুলো ঐ ফাইলগুলোর জ্ঞানে ভিত্তি করে গ্রাউন্ড করা থাকে। 
1. এখন আপনি ঐ ডেটার সাথে সম্পর্কিত প্রশ্ন জিজ্ঞাসা করতে পারেন এবং গ্রাউন্ডেড উত্তর পেতে পারেন।
1. উদাহরণ: `customer_info_10.json` ফাইলে "Amanda Perez" কর্তৃক করা 3টি ক্রয়ের বর্ণনা আছে

Container App এন্ডপয়েন্টের ব্রাউজার ট্যাবে ফিরে যোগ করুন এবং জিজ্ঞাসা করুন: `What products does Amanda Perez own?`. আপনি এরকম কিছু দেখতে পাবেন:

![প্রশ্নের উত্তর ACA-তে](../../../../../translated_images/bn/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Microsoft Foundry-এর ক্ষমতা সম্পর্কে একটু আরও ধারণা তৈরি করতে, Agents Playground-এ এজেন্টটিকে চালিয়ে দেখি। 

1. Microsoft Foundry-এ `Agents` পেজে ফিরে যান - ডিফল্ট এজেন্ট সিলেক্ট করুন
1. `Try in Playground` অপশনে ক্লিক করুন - আপনি এরকম একটি Playground UI দেখতে পাবেন
1. একই প্রশ্ন জিজ্ঞাসা করুন: `What products does Amanda Perez own?`

    ![প্লেগ্রাউন্ডে প্রশ্ন](../../../../../translated_images/bn/09-ask-in-playground.a1b93794f78fa676.webp)

আপনি একই (বা অনুরূপ) প্রতিক্রিয়া পাবেন - কিন্তু আপনি আরও অতিরিক্ত তথ্য পাবেন যা আপনার agentic অ্যাপের মান, খরচ, এবং কর্মক্ষমতা বোঝার জন্য ব্যবহার করতে পারবেন। উদাহরণস্বরূপ:

1. লক্ষ্য করুন যে প্রতিক্রিয়াটি গ্রাউন্ড করতে ব্যবহৃত ডেটা ফাইলগুলোকে উদ্ধৃত করে
1. এই ফাইল লেবেলগুলোর উপর হোভার করলে—ডেটা কি আপনার কুয়েরি এবং প্রদর্শিত প্রতিক্রিয়ার সাথে মেলে?

আপনি প্রতিক্রিয়ার নিচে একটি _স্ট্যাটস_ সারি দেখতে পাবেন। 

1. যে কোনো মেট্রিকের উপর হোভার করুন - যেমন Safety। আপনি এরকম কিছু দেখতে পাবেন
1. মূল্যায়িত রেটিংটি কি আপনার প্রতিক্রিয়ার নিরাপত্তা স্তরের জন্য আপনার অনুভূতির সাথে মিলে?

      ![রান ইনফো মিটার দেখুন](../../../../../translated_images/bn/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Built-in Observability

Observability হল আপনার অ্যাপ্লিকেশনকে ইন্সট্রুমেন্ট করা যাতে এটি অপারেশনগুলো বোঝা, ডিবাগ করা, এবং অপ্টিমাইজ করার জন্য ডেটা জেনারেট করে। এটার একটা ধারণা পেতে:

1. `View Run Info` বোতামে ক্লিক করুন - আপনি এই ভিউ দেখতে পাবেন। এটি [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) এর একটি উদাহরণ। _আপনি এই ভিউটিকে Thread Logs-এ ক্লিক করেও পেতে পারেন_।

   - রান ধাপগুলো এবং এজেন্ট দ্বারা ব্যবহার হওয়া টুলগুলো সম্পর্কে ধারণা নিন
   - প্রতিক্রিয়ার জন্য মোট Token গণনা (ওপুট টোকেন ব্যবহারের বিপরীতে) বুঝুন
   - লেটেন্সি এবং কোথায় সময় ব্যয় হচ্ছে তা বুঝুন

      ![রান ইনফো](../../../../../translated_images/bn/10-view-run-info.b20ebd75fef6a1cc.webp)

1. `Metadata` ট্যাবে ক্লিক করে রানটির অতিরিক্ত অ্যাট্রিবিউটগুলো দেখুন, যা পরে ডিবাগিং কেসগুলোর জন্য গুরুত্বপূর্ণ প্রসঙ্গ সরবরাহ করতে পারে।   

      ![রান মেটাডাটা](../../../../../translated_images/bn/11-view-run-info-metadata.7966986122c7c2df.webp)


1. `Evaluations` ট্যাবে ক্লিক করে এজেন্ট প্রতিক্রিয়ায় করা অটো-মূল্যায়নগুলো দেখুন। এতে সেফটি মূল্যায়ন (উদাহরণ: Self-harm) এবং এজেন্ট-নির্দিষ্ট মূল্যায়ন (উদাহরণ: Intent resolution, Task adherence) অন্তর্ভুক্ত থাকতে পারে।

      ![এভালুেশন্স](../../../../../translated_images/bn/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. শেষ কিন্তু গুরুত্বপূর্ণ, সাইডবার মেনুতে `Monitoring` ট্যাবে ক্লিক করুন।

      - প্রদর্শিত পেজে `Resource usage` ট্যাব নির্বাচন করুন - এবং মেট্রিকগুলো দেখুন।
      - খরচ (টোকেন) এবং লোড (রিকোয়েস্ট) অনুযায়ী অ্যাপ্লিকেশন ব্যবহার ট্র্যাক করুন।
      - প্রথম বাইটে লেটেন্সি (ইনপুট প্রসেসিং) এবং শেষ বাইটে লেটেন্সি (আউটপুট) ট্র্যাক করুন।

      ![মনিটরিং রিসোর্স](../../../../../translated_images/bn/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Environment Variables

এখন পর্যন্ত, আমরা ব্রাউজারে ডিপ্লয়মেন্টটি অনুসরণ করেছি - এবং যাচাই করেছি যে আমাদের ইনফ্রাস্ট্রাকচার প্রোভিশন্ড এবং অ্যাপ্লিকেশন কাজ করছে। কিন্তু কড-ফার্স্টভাবে অ্যাপ্লিকেশন নিয়ে কাজ하려면 আমাদের লোকাল ডেভেলপমেন্ট পরিবেশকে ঐ রিসোর্সগুলোর সাথে কাজ করার জন্য প্রাসঙ্গিক ভেরিয়েবলগুলো কনফিগার করতে হবে। `azd` ব্যবহার করে এটি সহজ।

1. Azure Developer CLI [environment variables ব্যবহার করে](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) অ্যাপ্লিকেশন ডিপ্লয়মেন্টগুলোর জন্য কনফিগারেশন সেটিংস সংরক্ষণ এবং পরিচালনা করে।

1. Environment ভেরিয়েবলগুলো `.azure/<env-name>/.env`-এ সংরক্ষিত থাকে - এটি তাদের সেই `env-name` পরিবেশের মধ্যে সীমাবদ্ধ করে যেটি ডিপ্লয়মেন্টের সময় ব্যবহৃত হয়েছে এবং একই রেপোতে বিভিন্ন ডিপ্লয়মেন্ট টার্গেটের মধ্যে পরিবেশ আলাদা রাখতে সাহায্য করে।

1. Environment ভেরিয়েবলগুলো `azd` কমান্ড যখনই একটি নির্দিষ্ট কমান্ড চালায় (উদাহরণ: `azd up`) তখন স্বয়ংক্রিয়ভাবে লোড করা হয়। লক্ষ্য করুন যে `azd` স্বয়ংক্রিয়ভাবে _OS-level_ এনভায়রনমেন্ট ভেরিয়েবলগুলো পড়ে না (যেমন শেলে সেট করা) - এর বদলে স্ক্রিপ্টগুলোর মধ্যে তথ্য স্থানান্তরের জন্য `azd set env` এবং `azd get env` ব্যবহার করুন।


চলুন কয়েকটি কমান্ড চেষ্টা করি:

1. `azd`-এর জন্য এই পরিবেশে সেট করা সমস্ত environment ভেরিয়েবলগুলো পান:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      আপনি এরকম কিছু দেখতে পাবেন:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. একটি নির্দিষ্ট মান পান - উদাহরণস্বরূপ, আমি জানতে চাই যদি আমরা `AZURE_AI_AGENT_MODEL_NAME` মানটি সেট করে থাকি

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      আপনি এরকম কিছু দেখতে পাবেন - এটি ডিফল্টভাবে সেট ছিল না!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. `azd`-এর জন্য একটি নতুন environment ভেরিয়েবল সেট করুন। এখানে, আমরা এজেন্ট মডেল নাম আপডেট করছি। _নোট: করা কোনো পরিবর্তন তৎক্ষণাৎ `.azure/<env-name>/.env` ফাইলে প্রতিফলিত হবে।_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      এখন, আমরা দেখতে পাব যে মানটি সেট হয়েছে:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. মনে রাখবেন যে কিছু রিসোর্স স্থায়ী (উদাহরণ: মডেল ডিপ্লয়মেন্ট) এবং সেগুলো পুনঃপ্রভিশন করার জন্য শুধুমাত্র `azd up`-এর চেয়ে বেশি কিছু প্রয়োজন হতে পারে। চলুন মূল ডিপ্লয়মেন্টটি টিয়ারডাউন করে পরিবর্তিত env vars দিয়ে পুনরায় ডিপ্লয় করি।

1. **Refresh** যদি আপনি পূর্বে azd টেমপ্লেট ব্যবহার করে ইনফ্রাস্ট্রাকচার ডিপ্লয় করে থাকেন - আপনি এই কমান্ড ব্যবহার করে আপনার লোকাল environment ভেরিয়েবলগুলোর স্টেটটি আপনার Azure ডিপ্লয়মেন্টের বর্তমান স্টেটের ভিত্তিতে _রিফ্রেশ_ করতে পারেন:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      এটি দুই বা তার বেশি লোকাল ডেভেলপমেন্ট পরিবেশে পরিবেশ ভেরিয়েবলগুলো _সমন্বয়_ করার একটি শক্তিশালী উপায় (উদাহরণস্বরূপ, একাধিক ডেভেলপার থাকা একটি দল) - এমনভাবে যাতে ডিপ্লয় হওয়া ইনফ্রাস্ট্রাকচার পরিবেশ ভেরিয়েবল অবস্থার জন্য বাস্তব সত্য হিসেবে কাজ করে। টিম সদস্যরা কেবল ভেরিয়েবলগুলো _রিফ্রেশ_ করে আবার সমন্বয়ে ফিরে আসে।

---

## 9. অভিনন্দন 🏆

আপনি মাত্রই একটি শুরু থেকে শেষ পর্যন্ত ওয়ার্কফ্লো সম্পন্ন করেছেন যেখানে আপনি:

- [X] আপনি যে AZD Template ব্যবহার করতে চান তা নির্বাচন করেছেন
- [X] টেমপ্লেটটি একটি সমর্থিত ডেভেলপমেন্ট পরিবেশে খুলেছেন
- [X] টেমপ্লেটটি ডিপ্লয় করেছেন এবং এটি কাজ করে তা যাচাই করেছেন

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->