# 2. টেমপ্লেট যাচাই করুন

!!! tip "এই মডিউলের শেষে আপনি সক্ষম হবেন"

    - [ ] AI সমাধান স্থাপত্য বিশ্লেষণ করা
    - [ ] AZD ডিপ্লয়মেন্ট ওয়ার্কফ্লো বুঝতে পারা
    - [ ] GitHub Copilot ব্যবহার করে AZD ব্যবহারে সহায়তা নেওয়া
    - [ ] **Lab 2:** AI Agents টেমপ্লেট ডিপ্লয় এবং যাচাই করা

---


## 1. পরিচিতি

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) or `azd` is an open-source commandline tool that streamlines the developer workflow when building and deploying applications to Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) are standardized repositories that include sample application code, _infrastructure-as-code_ assets, and `azd` configuration files for a cohesive solution architecture. Provisioning the infrastructure becomes as simple as an `azd provision` command - while using `azd up` allows you to provision infrastructure **and** deploy your application at one shot!

ফলস্বরূপ, আপনার অ্যাপ্লিকেশন ডেভেলপমেন্ট প্রক্রিয়া শুরু করা এতটাই সহজ হতে পারে যে আপনি সঠিক _AZD Starter template_ খুঁজে বের করবেন যা আপনার অ্যাপ্লিকেশন এবং ইনফ্রাস্ট্রাকচার চাহিদার কাছাকাছি আসে - তারপর রিপোজিটরিটি আপনার সিনারিও অনুকূলে কাস্টমাইজ করবেন।

শুরু করার আগে, চলুন নিশ্চিত করি যে আপনার কাছে Azure Developer CLI ইনস্টল করা আছে।

1. একটি VS Code টার্মিনাল খুলুন এবং এই কমান্ডটি টাইপ করুন:

      ```bash title="" linenums="0"
      azd version
      ```

1. আপনি এরকম কিছু দেখতে পাবেন!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**এখন আপনি azd ব্যবহার করে একটি টেমপ্লেট নির্বাচন ও ডিপ্লয় করার জন্য প্রস্তুত**

---

## 2. টেমপ্লেট নির্বাচন

Microsoft Foundry প্ল্যাটফর্মে একটি [set of recommended AZD templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) রয়েছে যা জনপ্রিয় সলিউশন সিনারিও যেমন _multi-agent workflow atomation_ এবং _multi-modal content processing_ কভার করে। আপনি Microsoft Foundry পোর্টাল থেকেও এই টেমপ্লেটগুলো আবিষ্কার করতে পারেন।

1. Visit [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. লগইন করুন Microsoft Foundry পোর্টালে যখন অনুরোধ করা হবে - আপনি এরকম কিছু দেখতে পাবেন।

![নির্বাচন](../../../../../translated_images/bn/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** অপশনগুলো আপনার স্টার্টার টেমপ্লেট:

1. [ ] [AI Chat দিয়ে শুরু করুন](https://github.com/Azure-Samples/get-started-with-ai-chat) যা একটি বেসিক চ্যাট অ্যাপ্লিকেশন _আপনার ডেটা সহ_ Azure Container Apps-এ ডিপ্লয় করে। এটি একটি বেসিক AI চ্যাটবট সিনারিও অন্বেষণ করতে ব্যবহার করুন।
1. [X] [AI Agents দিয়ে শুরু করুন](https://github.com/Azure-Samples/get-started-with-ai-agents) যা এটিও একটি স্ট্যান্ডার্ড AI Agent (Foundry Agents সহ) ডিপ্লয় করে। টুল এবং মডেল জড়িত এজেন্টিক AI সলিউশনগুলোর সাথে পরিচিত হতে এটি ব্যবহার করুন।

দ্বিতীয় লিংকটি একটি নতুন ব্রাউজার ট্যাবে খুলুন (অথবা সংশ্লিষ্ট কার্ডের জন্য `Open in GitHub` ক্লিক করুন)। আপনি এই AZD টেমপ্লেটের রিপোজিটরি দেখতে পাবেন। README এক মিনিট পরীক্ষা করে দেখুন। অ্যাপ্লিকেশন আর্কিটেকচার এইরকম দেখাচ্ছে:

![স্থাপত্য](../../../../../translated_images/bn/architecture.8cec470ec15c65c7.webp)

---

## 3. টেমপ্লেট সক্রিয়করণ

চলুন এই টেমপ্লেটটি ডিপ্লয় করার চেষ্টা করি এবং নিশ্চিত করি এটি বৈধ। আমরা [শুরু করা](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) অংশের নির্দেশিকা অনুসরণ করবো।

1. Click [এই লিঙ্ক](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - ডিফল্ট অ্যাকশন `Create codespace` নিশ্চিত করুন
1. এটি একটি নতুন ব্রাউজার ট্যাব খুলবে - GitHub Codespaces সেশন লোডিং সম্পূর্ণ হওয়া পর্যন্ত অপেক্ষা করুন
1. Codespaces-এ VS Code টার্মিনাল খুলুন - নিম্নলিখিত কমান্ডটি টাইপ করুন:

   ```bash title="" linenums="0"
   azd up
   ```

Complete the workflow steps that this will trigger:

1. আপনাকে Azure-এ লগইন করার জন্য অনুরোধ করা হবে - অথেন্টিকেশন নির্দেশনা অনুসরণ করুন
1. আপনার জন্য একটি ইউনিক এনভায়রনমেন্ট নাম লিখুন - উদাহরণস্বরূপ, আমি ব্যবহার করেছি `nitya-mshack-azd`
1. এটি একটি `.azure/` ফোল্ডার তৈরি করবে - আপনি এনভি নামসহ একটি সাবফোল্ডার দেখতে পাবেন
1. আপনাকে একটি সাবস্ক্রিপশন নাম নির্বাচন করতে বলা হবে - ডিফল্ট নির্বাচন করুন
1. আপনাকে একটি লোকেশন নির্বাচন করতে বলা হবে - `East US 2` ব্যবহার করুন

এখন, আপনি প্রোভিশনিং সম্পূর্ণ হওয়া পর্যন্ত অপেক্ষা করবেন। **এটি 10-15 মিনিট সময় নেবে**

1. শেষ হলে, আপনার কনসোলে একটি SUCCESS বার্তা দেখা যাবে যেমনটি নীচে:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. আপনার Azure পোর্টালে এখন ঐ env নাম সহ একটি প্রোভিশন করা রিসোর্স গ্রুপ থাকবে:

      ![ইনফ্রা](../../../../../translated_images/bn/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **এখন আপনি ডিপ্লয় করা ইনফ্রাস্ট্রাকচার এবং অ্যাপ্লিকেশন যাচাই করার জন্য প্রস্তুত**।

---

## 4. টেমপ্লেট যাচাই

1. Azure Portal এ [Resource Groups](https://portal.azure.com/#browse/resourcegroups) পেজে যান - লগইন করুন যখন অনুরোধ করা হবে
1. আপনার এনভায়রনমেন্ট নামের RG-এ ক্লিক করুন - আপনি উপরের পেজটি দেখতে পাবেন

      - Azure Container Apps রিসোর্সে ক্লিক করুন
      - _Essentials_ সেকশনের Application Url এ ক্লিক করুন (উপরের ডানদিকে)

1. আপনি এমন একটি হোস্ট করা অ্যাপ্লিকেশন ফ্রন্ট-এন্ড UI দেখতে পাবেন:

   ![অ্যাপ](../../../../../translated_images/bn/03-test-application.471910da12c3038e.webp)

1. কিছু [নমুনা প্রশ্ন](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) জিজ্ঞাসা করে দেখুন

      1. জিজ্ঞাসা করুন: ```What is the capital of France?``` 
      1. জিজ্ঞাসা করুন: ```What's the best tent under $200 for two people, and what features does it include?```

1. আপনি নীচে দেখানো অনুরূপ উত্তর পাবেন। _কিন্তু এটি কিভাবে কাজ করে?_ 

      ![অ্যাপ](../../../../../translated_images/bn/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  এজেন্ট যাচাই

Azure Container App একটি এন্ডপয়েন্ট ডিপ্লয় করে যা এই টেমপ্লেটের জন্য Microsoft Foundry প্রকল্পে প্রোভিশন করা AI Agent-এর সাথে সংযুক্ত হয়। এটা কী বোঝায় তা দেখা যাক।

1. আপনার রিসোর্স গ্রুপের জন্য Azure Portal _Overview_ পেজে ফিরে যান

1. তালিকায় `Microsoft Foundry` রিসোর্সে ক্লিক করুন

1. আপনি এটি দেখতে পাবেন। `Go to Microsoft Foundry Portal` বাটনে ক্লিক করুন। 
   ![Foundry](../../../../../translated_images/bn/04-view-foundry-project.fb94ca41803f28f3.webp)

1. আপনি আপনার AI অ্যাপ্লিকেশনের জন্য Foundry Project পেজ দেখতে পাবেন
   ![প্রকল্প](../../../../../translated_images/bn/05-visit-foundry-portal.d734e98135892d7e.webp)

1. `Agents`-এ ক্লিক করুন - আপনি আপনার প্রকল্পে প্রোভিশন করা ডিফল্ট এজেন্টটি দেখবেন
   ![এজেন্টস](../../../../../translated_images/bn/06-visit-agents.bccb263f77b00a09.webp)

1. এটিকে সিলেক্ট করুন - এবং আপনি এজেন্টের বিবরণ দেখেন। নিম্নলিখিতগুলো নোট করুন:

      - এজেন্ট ডিফল্টভাবে (সবসময়) File Search ব্যবহার করে
      - এজেন্টের `Knowledge` দেখায় এতে 32টি ফাইল আপলোড করা আছে (file search-এর জন্য)
      ![এজেন্টস](../../../../../translated_images/bn/07-view-agent-details.0e049f37f61eae62.webp)

1. বাম মেনুতে `Data+indexes` অপশনটি খুঁজুন এবং বিস্তারিত দেখতে ক্লিক করুন। 

      - আপনি knowledge এর জন্য আপলোড করা 32টি ডেটা ফাইল দেখতে পাবেন।
      - এগুলো `src/files` এর অধীনে থাকা 12টি কাস্টমার ফাইল এবং 20টি প্রোডাক্ট ফাইলের সাথে সম্পর্কিত হবে
      ![ডাটা](../../../../../translated_images/bn/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**আপনি এজেন্ট অপারেশন যাচাই করেছেন!** 

1. এজেন্টের প্রতিক্রিয়া ওই ফাইলগুলোর knowledge-এ ভিত্তি করে তৈরি।
1. এখন আপনি ঐ ডেটার সাথে সম্পর্কিত প্রশ্ন জিজ্ঞাসা করতে পারবেন এবং grounded উত্তর পেতে পারবেন।
1. উদাহরণ: `customer_info_10.json` এ "Amanda Perez" দ্বারা করা 3টি ক্রয়ের বর্ণনা আছে

ব্রাউজার ট্যাবে Container App এন্ডপয়েন্টে ফিরে যান এবং জিজ্ঞাসা করুন: `What products does Amanda Perez own?`. আপনি এরকম কিছু দেখতে পাবেন:

![ডাটা](../../../../../translated_images/bn/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Microsoft Foundry-এর ক্ষমতা সম্পর্কে আরও কিছু ধারণা গড়তে চলুন, Agents Playground-এ এজেন্টটিকে একটু চালিয়ে দেখি। 

1. Microsoft Foundry-এ `Agents` পেজে ফিরে যান - ডিফল্ট এজেন্টটি সিলেক্ট করুন
1. `Try in Playground` অপশনে ক্লিক করুন - আপনি এমন একটি Playground UI পাবেন
1. একই প্রশ্ন করুন: `What products does Amanda Perez own?`

    ![ডাটা](../../../../../translated_images/bn/09-ask-in-playground.a1b93794f78fa676.webp)

আপনি একই (বা অনুরূপ) প্রতিক্রিয়া পাবেন - তবে আপনি অতিরিক্ত তথ্যও পাবেন যা ব্যবহার করে আপনার এজেন্টিক অ্যাপের গুণমান, খরচ এবং কর্মক্ষমতা বুঝতে পারবেন। উদাহরণস্বরূপ:

1. লক্ষ্য করুন যে প্রতিক্রিয়াটি "ground" করার জন্য ব্যবহৃত ডেটা ফাইলগুলো উদ্ধৃত করে
1. যে কোন একটি ফাইল লেবেলের উপর হোভার করুন - ডেটা কি আপনার কুয়েরি এবং প্রদর্শিত প্রতিক্রিয়ার সাথে মিল ঘটায়?

আপনি প্রতিক্রিয়ার নিচে একটি _stats_ সারি ও দেখতে পাবেন। 

1. যে কোন একটি মেট্রিকের উপর হোভার করুন - উদাহরণস্বরূপ, Safety। আপনি এরকম কিছু দেখতে পাবেন
1. মূল্যায়িত রেটিং কি আপনার প্রতিক্রিয়ার সেফটি লেভেল সম্পর্কে আপনার অনুভূতির সাথে মেলে?

      ![ডাটা](../../../../../translated_images/bn/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Built-in Observability

Observability মানে আপনার অ্যাপ্লিকেশনকে ইন্সট্রুমেন্ট করা যাতে তা ডাটা জেনারেট করে যা ব্যবহার করে এর অপারেশন বুঝা, ডিবাগ করা এবং অপটিমাইজ করা যায়। এর ধারণা পাওয়ার জন্য:

1. `View Run Info` বাটনে ক্লিক করুন - আপনি এই ভিউটি দেখতে পাবেন। এটি অ্যাকশনে [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) এর একটি উদাহরণ। _আপনি এই ভিউটি টপ-লেভেল মেনুতে Thread Logs ক্লিক করেও পেতে পারেন_।

   - রান স্টেপস এবং এজেন্টের দ্বারা ব্যবহৃত টুলগুলো সম্পর্কে ধারনা পান
   - প্রতিক্রিয়ার জন্য মোট Token গণনা (বর্ধিত আউটপুট টোকেন ব্যবহার বনাম) বুঝুন
   - ল্যাটেন্সি এবং এক্সিকিউশনে সময় কোথায় খরচ হচ্ছে তা বুঝুন

      ![এজেন্ট](../../../../../translated_images/bn/10-view-run-info.b20ebd75fef6a1cc.webp)

1. রানটির অতিরিক্ত অ্যাট্রিবিউট দেখতে `Metadata` ট্যাবে ক্লিক করুন, যা পরে সমস্যা নির্ণয়ের জন্য দরকারী প্রসঙ্গ দিতে পারে।   

      ![এজেন্ট](../../../../../translated_images/bn/11-view-run-info-metadata.7966986122c7c2df.webp)


1. এজেন্ট প্রতিক্রিয়ার উপর করা অটো-অ্যাসেসমেন্টগুলো দেখতে `Evaluations` ট্যাবে ক্লিক করুন। এগুলোর মধ্যে সেফটি মূল্যায়ন (যেমন, Self-harm) এবং এজেন্ট-নির্দিষ্ট মূল্যায়ন (যেমন, Intent resolution, Task adherence) অন্তর্ভুক্ত থাকবে।

      ![এজেন্ট](../../../../../translated_images/bn/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. সর্বশেষ কিন্তু গুরুত্বপূর্ণ, সাইডবার মেনুতে `Monitoring` ট্যাবে ক্লিক করুন।

      - প্রদর্শিত পেজে `Resource usage` ট্যাব সিলেক্ট করুন - এবং মেট্রিক্সগুলি দেখুন।
      - খরচ (টোকেন) এবং লোড (রিকুয়েস্ট) এর দিক থেকে অ্যাপ্লিকেশন ব্যবহার ট্র্যাক করুন।
      - প্রথম বাইট (ইনপুট প্রক্রিয়াকরণ) এবং শেষ বাইট (আউটপুট) পর্যন্ত অ্যাপ্লিকেশনের ল্যাটেন্সি ট্র্যাক করুন।

      ![এজেন্ট](../../../../../translated_images/bn/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Environment Variables

এপর্যন্ত, আমরা ব্রাউজারে ডিপ্লয়মেন্টটি দেখেছি - এবং যাচাই করেছি যে আমাদের ইনফ্রাস্ট্রাকচার প্রোভিশন করা হয়েছে এবং অ্যাপ্লিকেশন কার্যকর। কিন্তু কোড-ফার্স্ট পদ্ধতিতে কাজ করতে হলে, আমাদের লোকাল ডেভেলপমেন্ট এনভায়রনমেন্টটি সেই প্রাসঙ্গিক ভেরিয়েবলগুলোর সাথে কনফিগার করতে হবে যা এই রিসোর্সগুলোর সাথে কাজ করার জন্য প্রয়োজন। `azd` ব্যবহার করলে এটি সহজ হয়।

1. The Azure Developer CLI [এনভায়রনমেন্ট ভেরিয়েবল ব্যবহার করে](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) অ্যাপ্লিকেশন ডিপ্লয়মেন্টের কনফিগারেশন সেটিংস সংরক্ষণ এবং পরিচালনা করতে।

1. এনভায়রনমেন্ট ভেরিয়েবলগুলি `.azure/<env-name>/.env` এ সংরক্ষিত হয় - এটি সেগুলোকে ডিপ্লয়মেন্ট কালে ব্যবহৃত `env-name` এনভায়রনমেন্টে সীমাবদ্ধ করে এবং একই রিপোতে বিভিন্ন ডিপ্লয়মেন্ট টার্গেটের মধ্যে এনভায়রনমেন্ট আলাদা রাখতে সাহায্য করে।

1. এনভায়রনমেন্ট ভেরিয়েবলগুলি নির্দিষ্ট কোনো কম্যান্ড (যেমন, `azd up`) এক্সিকিউট করার সময় `azd` কমান্ড দ্বারা স্বয়ংক্রিয়ভাবে লোড হয়ে যায়। লক্ষ্য করুন `azd` স্বয়ংক্রিয়ভাবে _OS-level_ এনভায়রনমেন্ট ভেরিয়েবলগুলি (উদাহরণস্বরূপ, শেলে সেট করা) পড়ে না - পরিবর্তে স্ক্রিপ্টের মধ্যে তথ্য স্থানান্তরের জন্য `azd set env` এবং `azd get env` ব্যবহার করুন।


চলুন কয়েকটি কমান্ড চেষ্টা করি:

1. এই এনভায়রনমেন্টে `azd` জন্য সেট করা সব এনভায়রনমেন্ট ভেরিয়েবলগুলি পান:

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

1. একটি নির্দিষ্ট ভ্যালু পান - উদাহরণস্বরূপ, আমি জানতে চাই যদি আমরা `AZURE_AI_AGENT_MODEL_NAME` মানটি সেট করেছি কি না

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      আপনি এরকম কিছু দেখতে পাবেন - এটি ডিফল্টভাবে সেট ছিল না!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. `azd`-এর জন্য একটি নতুন এনভায়রনমেন্ট ভেরিয়েবল সেট করুন। এখানে, আমরা এজেন্ট মডেল নাম আপডেট করছি। _নোট: করা কোনো পরিবর্তন `.azure/<env-name>/.env` ফাইলে তৎক্ষণাত প্রতিফলিত হবে।_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      এখন, আমরা দেখতে পাবো যে মান সেট হয়েছে:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. লক্ষ্য করুন যে কিছু রিসোর্স স্থায়ী (উদাহরণস্বরূপ, মডেল ডিপ্লয়মেন্ট) এবং সেগুলোকে পুনরায় ডিপ্লয় করতে শুধুমাত্র `azd up` যথেষ্ট হবে না। আসুন আমরা মূল ডিপ্লয়মেন্টটি teardown করি এবং পরিবর্তিত এনভি ভ্যারিয়েবলসহ পুনরায় ডিপ্লয় করি।

1. **Refresh** যদি আপনি পূর্বে একটি azd টেমপ্লেট ব্যবহার করে ইনফ্রাস্ট্রাকচার ডিপ্লয় করে থাকেন - আপনি আপনার লোকাল এনভায়রনমেন্ট ভেরিয়েবলগুলোর স্টেটকে আপনার Azure ডিপ্লয়মেন্টের বর্তমান স্টেটের ভিত্তিতে _refresh_ করতে পারবেন এই কমান্ডটি ব্যবহার করে:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      এটি দুই বা তার বেশি লোকাল ডেভেলপমেন্ট পরিবেশে পরিবেশ ভেরিয়েবলগুলো _সিঙ্ক_ করার একটি শক্তিশালী উপায় (উদাহরণ: একাধিক ডেভেলপারসহ টিম) - ডিপ্লয় করা অবকাঠামোকে env ভেরিয়েবল স্টেটের ভিত্তি হিসেবে কাজ করতে দেয়। টিমের সদস্যরা কেবল ভেরিয়েবলগুলো _রিফ্রেশ_ করে আবার সিঙ্কে আসে।

---

## 9. অভিনন্দন 🏆

আপনি এখন একটি end-to-end ওয়ার্কফ্লো সম্পন্ন করেছেন যেখানে আপনি:

- [X] আপনি ব্যবহারের জন্য যে AZD Templateটি নির্বাচন করেছেন
- [X] Templateটি GitHub Codespaces দিয়ে চালু করেছেন 
- [X] Templateটি ডিপ্লয় করেছেন এবং এটি কাজ করে তা যাচাই করেছেন

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকৃতি:
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। যদিও আমরা যথাসম্ভব সঠিকতার চেষ্টা করি, অনুগ্রহ করে মনে রাখুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার মূল ভাষায়ই আধিকারিক সূত্র হিসেবে গণ্য করা উচিত। গুরুত্বপূর্ণ তথ্যের ক্ষেত্রে পেশাদার মানব অনুবাদ প্রস্তাবিত। এই অনুবাদের ব্যবহারের কারণে উদ্ভূত কোনো ভুলবোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->