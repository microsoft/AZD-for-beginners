# 2. একটি টেমপ্লেট যাচাই করুন

!!! tip "এই মডিউলের শেষ নাগাদ আপনি সক্ষম হবেন"

    - [ ] AI সমাধান আর্কিটেকচার বিশ্লেষণ করুন
    - [ ] AZD ডিপ্লয়মেন্ট ওয়ার্কফ্লো বুঝুন
    - [ ] AZD ব্যবহারে সাহায্যের জন্য GitHub Copilot ব্যবহার করুন
    - [ ] **Lab 2:** AI Agents টেমপ্লেট ডিপ্লয় ও যাচাই করুন

---


## 1. ভূমিকা

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) or `azd` হল একটি ওপেন-সোর্স কমান্ডলাইন টুল যা Azure-এ অ্যাপ্লিকেশন তৈরি এবং ডিপ্লয় করার সময় ডেভেলপারদের ওয়ার্কফ্লোকে সরল করে। 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) হল স্ট্যান্ডার্ডাইজড রিপোজিটরিগুলি যেগুলো নমুনা অ্যাপ্লিকেশন কোড, _infrastructure-as-code_ অ্যাসেটস, এবং `azd` কনফিগারেশন ফাইলগুলো একটি সমন্বিত সলিউশন আর্কিটেকচারের জন্য অন্তর্ভুক্ত করে। ইনফ্রাস্ট্রাকচার provisioning করা হয়ে যায় একটি `azd provision` কমান্ডের মতোই সহজ - আর `azd up` ব্যবহার করলে আপনি এক্কেবারে একবারে ইনফ্রাস্ট্রাকচার provisioning **এবং** আপনার অ্যাপ্লিকেশন ডিপ্লয় করতে পারবেন!

ফলশ্বরূপ, আপনার অ্যাপ্লিকেশন ডেভেলপমেন্ট প্রক্রিয়া শুরু করা হতে পারে সহজভাবে সঠিক _AZD Starter template_ খুঁজে নিয়ে যা আপনার অ্যাপ্লিকেশন ও ইনফ্রাস্ট্রাকচার প্রয়োজনের সন্নিকট - তারপর সেই রিপোজিটরিটি আপনার সিচুয়েশনের প্রয়োজন অনুযায়ী কাস্টোমাইজ করুন।

শুরু করার আগে, চলুন নিশ্চিত করি আপনার কাছে Azure Developer CLI ইনস্টল করা আছে।

1. Open a VS Code terminal and type this command:

      ```bash title="" linenums="0"
      azd version
      ```

1. আপনি এ রকম কিছু দেখতে পাবেন!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**আপনি এখন azd ব্যবহার করে একটি টেমপ্লেট নির্বাচন ও ডিপ্লয় করার জন্য প্রস্তুত**

---

## 2. টেমপ্লেট নির্বাচন

The Microsoft Foundry platform comes with a [set of recommended AZD templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) যা জনপ্রিয় সলিউশন পরিস্থিতি যেমন _multi-agent workflow atomation_ এবং _multi-modal content processing_ কভার করে। আপনি Microsoft Foundry পোর্টাল ভিজিট করেও এই টেমপ্লেটগুলো আবিষ্কার করতে পারেন।

1. Visit [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Log into the Microsoft Foundry portal when prompted - you will see something like this.

![নির্বাচন](../../../../../translated_images/bn/01-pick-template.60d2d5fff5ebc374.webp)


The **Basic** options are your starter templates:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) যা একটি বেসিক চ্যাট অ্যাপ্লিকেশন _আপনার ডেটা সহ_ Azure Container Apps-এ ডিপ্লয় করে। এটি একটি বেসিক AI চ্যাটবট সিচুয়েশন অন্বেষণের জন্য ব্যবহার করুন।
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) যা একটি স্ট্যান্ডার্ড AI Agent (Foundry Agents সহ) ও ডিপ্লয় করে। টুল এবং মডেল জড়িত agentic AI সলিউশনগুলোর সাথে পরিচিত হতে এটি ব্যবহার করুন।

Visit the second link in a new browser tab (or click `Open in GitHub` for the related card). You should see the repository for this AZD Template. Take a minute to explore the README. The application architecture looks like this:

![আর্কিটেকচার](../../../../../translated_images/bn/architecture.8cec470ec15c65c7.webp)

---

## 3. টেমপ্লেট সক্রিয়করণ

Let's try to deploy this template and make sure it is valid. We'll follow the guidelines in the [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) section.

1. Click [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - confirm the default action to `Create codespace`
1. This opens a new browser tab - wait for the GitHub Codespaces session to complete loading
1. Open the VS Code terminal in Codespaces - type the following command:

   ```bash title="" linenums="0"
   azd up
   ```

Complete the workflow steps that this will trigger:

1. You will be prompted to log into Azure - follow instructions to authenticate
1. Enter a unique environment name for you - e.g., I used `nitya-mshack-azd`
1. This  will create a `.azure/` folder - you will see a subfolder with the env name
1. You will be prompted to select a subscription name - select the default
1. You will be prompted for a location - use `East US 2`

Now, you wait for the provisioning to complete. **This takes 10-15 minutes**

1. When done, your console will show a SUCCESS message like this:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. আপনার Azure পোর্টালে এখন ঐ env নামসহ একটি provision করা resource group থাকবে:

      ![ইনফ্রা](../../../../../translated_images/bn/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **আপনি এখন ডিপ্লয় করা ইনফ্রাস্ট্রাকচার এবং অ্যাপ্লিকেশন যাচাই করার জন্য প্রস্তুত**।

---

## 4. টেমপ্লেট যাচাই

1. Azure পোর্টালে [রিসোর্স গ্রুপসমূহ](https://portal.azure.com/#browse/resourcegroups) পেজে যান - প্রম্পট হলে লগ ইন করুন
1. Click on RG for your environment name - you see the page above

      - ক্লিক করুন Azure Container Apps রিসোর্সে
      - ক্লিক করুন Application Url-এ _Essentials_ সেকশনে (উপরে ডানদিকে)

1. আপনি এ রকম একটি হোস্ট করা অ্যাপ্লিকেশন ফ্রন্ট-এন্ড UI দেখতে পাবেন:

   ![অ্যাপ্লিকেশন](../../../../../translated_images/bn/03-test-application.471910da12c3038e.webp)

1. কয়েকটি [নমুনা প্রশ্নসমূহ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) জিজ্ঞাসা করে দেখুন

      1. জিজ্ঞাসা করুন: ```ফ্রান্সের রাজধানী কোনটি?``` 
      1. জিজ্ঞাসা করুন: ```দুজনের জন্য $200-এর নিচে কোন তাঁবিলটি সেরা, এবং এতে কোন বৈশিষ্ট্যগুলো আছে?```

1. আপনি নিচে দেখানোর মতো সমান ধরনের উত্তর পাবেন। _কিন্তু এটি কীভাবে কাজ করে?_

      ![অ্যাপ্লিকেশন](../../../../../translated_images/bn/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  এজেন্ট যাচাই

Azure Container App একটি এন্ডপয়েন্ট ডিপ্লয় করে যা এই টেমপ্লেটের জন্য Microsoft Foundry প্রজেক্টে provisioning করা AI Agent-এ সংযুক্ত হয়। চলুন দেখি এর মানে কী।

1. আপনার রিসোর্স গ্রুপের Azure Portal _Overview_ পেজে ফিরে যান

1. তালিকার মধ্যে `Microsoft Foundry` রিসোর্সে ক্লিক করুন

1. আপনি এটি দেখতে পাবেন। `Go to Microsoft Foundry Portal` বোতামে ক্লিক করুন। 
   ![ফাউন্ড্রি](../../../../../translated_images/bn/04-view-foundry-project.fb94ca41803f28f3.webp)

1. আপনি আপনার AI অ্যাপ্লিকেশনের Foundry Project পেজ দেখতে পাবেন
   ![প্রকল্প](../../../../../translated_images/bn/05-visit-foundry-portal.d734e98135892d7e.webp)

1. `Agents` এ ক্লিক করুন - আপনি আপনার প্রজেক্টে ডিফল্টভাবে provisioning হওয়া এজেন্টটি দেখতে পাবেন
   ![এজেন্টসমূহ](../../../../../translated_images/bn/06-visit-agents.bccb263f77b00a09.webp)

1. এটি সিলেক্ট করুন - এবং আপনি এজেন্টের বিস্তারিত দেখতে পাবেন। নিম্নলিখিত বিষয়গুলো লক্ষ্য করুন:

      - এজেন্টটি ডিফল্টভাবে File Search ব্যবহার করে (সবসময়)
      - এজেন্টের `Knowledge` দেখায় যে এতে ৩২টি ফাইল আপলোড করা আছে (ফাইল সার্চের জন্য)
      ![এজেন্টসমূহ](../../../../../translated_images/bn/07-view-agent-details.0e049f37f61eae62.webp)

1. বাম মেনুতে `Data+indexes` অপশনটি খুঁজে ক্লিক করে বিস্তারিত দেখুন। 

      - আপনি জ্ঞানের জন্য আপলোড করা ৩২টি ডেটা ফাইল দেখতে পাবেন।
      - এগুলো `src/files`-এর অধীনে থাকা ১২টি customer ফাইল এবং ২০টি product ফাইলের সাথে মিল থাকবে
      ![ডেটা](../../../../../translated_images/bn/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**আপনি এজেন্ট অপারেশন যাচাই করেছেন!**

1. এজেন্টের উত্তরগুলো ঐ ফাইলগুলোর জ্ঞানের ওপর ভিত্তি করে গ্রাউন্ড করা হয়। 
1. আপনি এখন ঐ ডেটা সম্পর্কিত প্রশ্ন করতে পারবেন এবং গ্রাউন্ডেড উত্তর পেতে পারবেন।
1. উদাহরণ: `customer_info_10.json` বর্ণনা করে "Amanda Perez" দ্বারা করা ৩টি ক্রয়

Browser ট্যাবে থাকা Container App এন্ডপয়েন্টটি পুনরায় দেখুন এবং জিজ্ঞাসা করুন: `What products does Amanda Perez own?`. আপনি এ রকম কিছু দেখতে পাবেন:

![ডেটা](../../../../../translated_images/bn/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. এজেন্ট প্লেগ্রাউন্ড

Microsoft Foundry-এর ক্ষমতা সম্পর্কে আরও কিছু অন্তর্যাম গড়ে তুলতে, এজেন্টটিকে Agents Playground-এ চালিয়ে দেখা যাক। 

1. Microsoft Foundry-এ `Agents` পেজে ফিরে যান - ডিফল্ট এজেন্টটি সিলেক্ট করুন
1. `Try in Playground` অপশনটি ক্লিক করুন - আপনি একটি Playground UI পাবেন যা এর মতো হবে
1. একই প্রশ্ন জিজ্ঞাসা করুন: `What products does Amanda Perez own?`

    ![ডেটা](../../../../../translated_images/bn/09-ask-in-playground.a1b93794f78fa676.webp)

আপনি একই (বা অনুরূপ) উত্তর পাবেন - কিন্তু আপনি আরও অতিরিক্ত তথ্যও পাবেন যা ব্যবহার করে আপনার এজেন্টিক অ্যাপের গুণমান, খরচ, এবং পারফরম্যান্স বুঝতে পারবেন। উদাহরণস্বরূপ:

1. লক্ষ্য করুন যে উত্তরটি যে ডেটা ফাইলগুলো ব্যবহার করে "ground" করা হয়েছে সেগুলো উদ্ধৃত করেছে
1. যে কোন ফাইল লেবেলের উপর হোভার করুন - কি ডেটা আপনার প্রশ্ন ও প্রদর্শিত উত্তরের সাথে মেলে?

আপনি উত্তরটির নিচে একটি _stats_ সারি দেখতে পাবেন। 

1. যে কোন মেট্রিকের উপর হোভার করুন - উদাহরণস্বরূপ, Safety। আপনি এ রকম কিছু দেখতে পাবেন
1. মূল্যায়িত রেটিংটি কি আপনার উত্তর নিরাপত্তা স্তরের জন্য আপনার অনুভূতির সাথে মেলে?

      ![এজেন্ট](../../../../../translated_images/bn/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. অন্তর্নির্মিত পর্যবেক্ষণযোগ্যতা

Observability হলো আপনার অ্যাপ্লিকেশনকে এমনভাবে ইন্সট্রুমেন্ট করা যাতে এটি ডাটা জেনারেট করে যা ব্যবহৃত হতে পারে অপারেশনগুলো বুঝতে, ডিবাগ করতে, এবং অপ্টিমাইজ করতে। এর একটি অনুভূতি পেতে:

1. `View Run Info` বোতামে ক্লিক করুন - আপনি এই ভিউটি দেখতে পাবেন। এটি [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) এর একটি উদাহরণ। _আপনি এই ভিউটি Thread Logs-এ ক্লিক করেও পেতে পারেন_।

   - এজেন্টের চালানো ধাপগুলো এবং যে টুলগুলো কাজে লিপ্ত হয়েছে সেগুলো সম্পর্কে ধারণা নিন
   - উত্তরটির জন্য মোট Token count বোঝার চেষ্টা করুন (আর আউটপুট টোকেন্স ব্যবহার বনাম)
   - লেটেন্সি এবং এক্সিকিউশনে সময় কোথায় কাটছে তা বুঝুন

      ![এজেন্ট](../../../../../translated_images/bn/10-view-run-info.b20ebd75fef6a1cc.webp)

1. `Metadata` ট্যাবে ক্লিক করে রানটির জন্য অতিরিক্ত অ্যাট্রিবিউটগুলো দেখুন, যা পরে সমস্যাগুলি ডিবাগ করার জন্য দরকারী কন্টেক্সট দিতে পারে।   

      ![এজেন্ট](../../../../../translated_images/bn/11-view-run-info-metadata.7966986122c7c2df.webp)


1. `Evaluations` ট্যাবে ক্লিক করে এজেন্টের উত্তরের উপর করা অটো-অ্যাসেসমেন্টগুলো দেখুন। এগুলোর মধ্যে রয়েছে নিরাপত্তা মূল্যায়ন (যেমন, Self-harm) এবং এজেন্ট-নির্দিষ্ট মূল্যায়ন (যেমন, Intent resolution, Task adherence)।

      ![এজেন্ট](../../../../../translated_images/bn/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. শেষ কিন্তু গুরুত্বপূর্ণ, সাইডবার মেনুতে থাকা `Monitoring` ট্যাবে ক্লিক করুন।

      - প্রদর্শিত পেজে `Resource usage` ট্যাব সিলেক্ট করুন - এবং মেট্রিকগুলো দেখুন।
      - খরচের (টোকেন) এবং লোড (রিকোয়েস্ট) দিক থেকে অ্যাপ্লিকেশন ব্যবহার ট্র্যাক করুন।
      - ইনপুট প্রসেসিং (প্রথম বাইট) এবং আউটপুট (শেষ বাইট) পর্যন্ত অ্যাপ্লিকেশন লেটেন্সি ট্র্যাক করুন।

      ![এজেন্ট](../../../../../translated_images/bn/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. পরিবেশ ভেরিয়েবল

এ পর্যন্ত, আমরা ব্রাউজারে ডিপ্লয়মেন্টটি পার করেছি - এবং যাচাই করেছি যে আমাদের ইনফ্রাস্ট্রাকচার provision হয়েছে এবং অ্যাপ্লিকেশন অপারেশনাল। কিন্তু অ্যাপ্লিকেশনের কোড-ফার্স্টভাবে কাজ করতে হলে আমাদের লোকাল ডেভেলপমেন্ট পরিবেশ কনফিগার করতে হবে ঐ রিসোর্সগুলোর সাথে কাজ করার জন্য প্রয়োজনীয় ভেরিয়েবলগুলো। `azd` ব্যবহার করলে এটি সহজ হয়।

1. The Azure Developer CLI [uses environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) কনফিগারেশন সেটিংগুলো অ্যাপ্লিকেশন ডিপ্লয়মেন্টের জন্য সংরক্ষণ ও ম্যানেজ করতে।

1. Environment variables গুলো `.azure/<env-name>/.env` এ স্টোর করা হয় - এটি এগুলোকে `env-name` পরিবেশের মধ্যে সীমাবদ্ধ করে যা ডিপ্লয়মেন্টের সময় ব্যবহৃত হয় এবং একই রিপোতে বিভিন্ন ডেপ্লয়মেন্ট টার্গেটের মধ্যে পরিবেশগুলো আলাদা রাখতে সাহায্য করে।

1. Environment variablesগুলো স্বয়ংক্রিয়ভাবে লোড হয় `azd` কমান্ড দ্বারা যখন এটি কোন নির্দিষ্ট কমান্ড কার্যকর করে (যেমন, `azd up`). লক্ষ্য করুন যে `azd` স্বয়ংক্রিয়ভাবে _OS-level_ environment variables (যেমন, shell-এ সেট করা) পড়ে না - পরিবর্তে স্ক্রিপ্টগুলোর মধ্যে তথ্য ট্রান্সফার করার জন্য `azd set env` এবং `azd get env` ব্যবহার করুন।


চলুন কয়েকটি কমান্ড চেষ্টা করে দেখি:

1. Get all the environment variables set for `azd` in this environment:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      আপনি এ রকম কিছু দেখতে পাবেন:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Get a specific value - e.g., I want to know if we set the `AZURE_AI_AGENT_MODEL_NAME` value

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      আপনি এ রকম কিছু দেখতে পাবেন - এটি ডিফল্টভাবে সেট ছিল না!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Set a new environment variable for `azd`. Here, we update the agent model name. _Note: any changes made will be immediately reflected in the `.azure/<env-name>/.env` file.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      এখন, আমরা দেখতে পাব যে মানটি সেট করা আছে:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Note that some resources are persistent (e.g., model deployments) and will require more than just an `azd up` to force the redeployment. Let's try tearing down the original deployment and redeploying with changed env vars.

1. **রিফ্রেশ** যদি আপনি পূর্বে azd টেমপ্লেট ব্যবহার করে ইনফ্রাস্ট্রাকচার ডিপ্লয় করে থাকেন - আপনি আপনার লোকাল environment variables-এর স্টেটকে আপনার Azure ডিপ্লয়মেন্টের বর্তমান স্টেটের উপর ভিত্তি করে _refresh_ করতে পারবেন এই কমান্ড ব্যবহার করে:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      এটি স্থানীয় দুটি বা ততোধিক ডেভেলপমেন্ট পরিবেশে পরিবেশ ভেরিয়েবলগুলি _সমন্বয়_ করার একটি শক্তিশালী উপায় (উদাহরণস্বরূপ, একাধিক ডেভেলপারসহ একটি টিম) - প্রয়োগ করা অবকাঠামোকে পরিবেশ ভেরিয়েবলের অবস্থার সত্য ভিত্তি হিসেবে কাজ করতে দেয়। টিমের সদস্যরা কেবল ভেরিয়েবলগুলো _রিফ্রেশ_ করে আবার সমন্বয়ে আসে।

---

## 9. অভিনন্দন 🏆

আপনি মাত্রই একটি শুরু-থেকে-শেষ পর্যন্ত কর্মপ্রবাহ সম্পন্ন করেছেন যেখানে আপনি:

- [X] আপনি ব্যবহার করতে চান এমন AZD টেমপ্লেটটি নির্বাচন করেছেন
- [X] GitHub Codespaces দিয়ে টেমপ্লেটটি চালু করেছেন 
- [X] টেমপ্লেটটি ডিপ্লয় করেছেন এবং এটি কাজ করছে তা যাচাই করেছেন

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
দায়-অস্বীকৃতি:
এই দলিলটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। যদিও আমরা যথাসম্ভব সঠিকতা নিশ্চিত করার চেষ্টা করি, অনুগ্রহ করে জানুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা ভুল থাকতে পারে। মূল ভাষায় থাকা আসল দলিলটিকেই কর্তৃপক্ষ হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ করার পরামর্শ দেওয়া হয়। এই অনুবাদ ব্যবহারের ফলে সৃষ্ট কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->