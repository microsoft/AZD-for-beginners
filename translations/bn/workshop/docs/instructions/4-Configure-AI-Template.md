# 4. টেমপ্লেট কনফিগার করুন

!!! tip "এই মডিউলটির শেষে আপনি সক্ষম হবেন"

    - [ ] `azure.yaml`-এর উদ্দেশ্য বুঝতে পারা
    - [ ] `azure.yaml`-এর গঠন বুঝতে পারা
    - [ ] azd লাইফসাইকেল `hooks`-এর গুরুত্ব বুঝতে পারা
    - [ ] **ল্যাব ৪:** পরিবেশ ভেরিয়েবল অন্বেষণ ও পরিবর্তন করা

---

!!! prompt "এই `azure.yaml` ফাইলটি কী কাজ করে? একটি কোডফেন্স ব্যবহার করে লাইন-বাই-লাইন ব্যাখ্যা করুন"

      `azure.yaml` ফাইলটি হলো **Azure Developer CLI (azd)-এর কনফিগারেশন ফাইল**। এটি সংজ্ঞায়িত করে যে আপনার অ্যাপ্লিকেশন কিভাবে Azure-এ ডিপ্লয় করা উচিত, যার মধ্যে রয়েছে ইনফ্রাস্ট্রাকচার, সার্ভিসসমূহ, ডিপ্লয়মেন্ট হুক, এবং পরিবেশ ভেরিয়েবলসমূহ।

---

## 1. উদ্দেশ্য ও কার্যকারিতা

এই `azure.yaml` ফাইলটি একটি AI এজেন্ট অ্যাপ্লিকেশনের জন্য **ডিপ্লয়মেন্ট ব্লুপ্রিন্ট** হিসেবে কাজ করে যা:

1. ডিপ্লয়ের পূর্বে **পরিবেশ যাচাই করে**
2. **Azure AI সার্ভিসসমূহ প্রোভিশন করে** (AI Hub, AI Project, Search, ইত্যাদি)
3. **Python অ্যাপ্লিকেশন ডিপ্লয় করে** Azure Container Apps-এ
4. চ্যাট এবং এমবেডিং উভয় কার্যকারিতার জন্য **AI মডেল কনফিগার করে**
5. AI অ্যাপ্লিকেশনের জন্য **মনিটরিং এবং ট্রেসিং সেটআপ করে**
6. **নতুন এবং বিদ্যমান উভয়** Azure AI প্রকল্প পরিস্থিতি পরিচালনা করে

ফাইলটি সঠিক যাচাইকরণ, প্রোভিশনিং এবং পোস্ট-ডিপ্লয়মেন্ট কনফিগারেশনসহ একটি সম্পূর্ণ AI এজেন্ট সলিউশনকে একক কমান্ডে ডিপ্লয় করতে সক্ষম করে (`azd up`)।

??? info "বিস্তার করে দেখুন: `azure.yaml`"

      `azure.yaml` ফাইলটি সংজ্ঞায়িত করে কিভাবে Azure Developer CLI এই AI Agent অ্যাপ্লিকেশনটি Azure-এ ডিপ্লয় ও পরিচালনা করবে। আসুন এটিকে লাইন-বাই-লাইন বিশ্লেষণ করি।

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: do we need hooks? 
      # TODO: do we need all of the variables?

      name: azd-get-started-with-ai-agents
      metadata:
      template: azd-get-started-with-ai-agents@1.0.2
      requiredVersions:
      azd: ">=1.14.0"

      hooks:
      preup:
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
            interactive: true
            continueOnError: false
      windows:
            shell: pwsh
            run: ./scripts/validate_env_vars.ps1
            interactive: true
            continueOnError: false      
      postprovision:
      windows:
            shell: pwsh
            run: ./scripts/write_env.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
            continueOnError: true
            interactive: true
      postdeploy:
      windows:
            shell: pwsh
            run: ./scripts/postdeploy.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
            continueOnError: true
            interactive: true
      services:
      api_and_frontend:
      project: ./src
      language: py
      host: containerapp
      docker:
            image: api_and_frontend
            remoteBuild: true
      pipeline:
      variables:
      - AZURE_RESOURCE_GROUP
      - AZURE_AIHUB_NAME
      - AZURE_AIPROJECT_NAME
      - AZURE_AISERVICES_NAME
      - AZURE_SEARCH_SERVICE_NAME
      - AZURE_APPLICATION_INSIGHTS_NAME
      - AZURE_CONTAINER_REGISTRY_NAME
      - AZURE_KEYVAULT_NAME
      - AZURE_STORAGE_ACCOUNT_NAME
      - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
      - USE_CONTAINER_REGISTRY
      - USE_APPLICATION_INSIGHTS
      - USE_AZURE_AI_SEARCH_SERVICE
      - AZURE_AI_AGENT_NAME
      - AZURE_AI_AGENT_ID
      - AZURE_AI_AGENT_DEPLOYMENT_NAME
      - AZURE_AI_AGENT_DEPLOYMENT_SKU
      - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
      - AZURE_AI_AGENT_MODEL_NAME
      - AZURE_AI_AGENT_MODEL_FORMAT
      - AZURE_AI_AGENT_MODEL_VERSION
      - AZURE_AI_EMBED_DEPLOYMENT_NAME
      - AZURE_AI_EMBED_DEPLOYMENT_SKU
      - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
      - AZURE_AI_EMBED_MODEL_NAME
      - AZURE_AI_EMBED_MODEL_FORMAT
      - AZURE_AI_EMBED_MODEL_VERSION
      - AZURE_AI_EMBED_DIMENSIONS
      - AZURE_AI_SEARCH_INDEX_NAME
      - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
      - AZURE_EXISTING_AIPROJECT_ENDPOINT
      - AZURE_EXISTING_AGENT_ID
      - ENABLE_AZURE_MONITOR_TRACING
      - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
      ```

---

## 2. ফাইল বিশ্লেষণ

আসুন অধ্যায়ক্রমে ফাইলটি পর্যালোচনা করি, যাতে বোঝা যায় এটি কী করে — এবং কেন করে।

### 2.1 **হেডার ও স্কিমা (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: IDE সমর্থন এবং IntelliSense-এর জন্য YAML ল্যাঙ্গুয়েজ সার্ভারের স্কিমা ভ্যালিডেশন প্রদান করে

### 2.2 প্রকল্প মেটাডেটা (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Azure Developer CLI দ্বারা ব্যবহৃত প্রকল্পের নাম নির্ধারণ করে
- **Lines 6-7**: এটি একটি টেমপ্লেট সংস্করণ 1.0.2-এ ভিত্তি করে তৈরি করা হয়েছে তা নির্দেশ করে
- **Lines 8-9**: Azure Developer CLI সংস্করণ 1.14.0 বা তার উপরে প্রয়োজন

### 2.3 ডিপ্লয় হুক (11-40)

```yaml title="" linenums="0"
hooks:
  preup:
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
      interactive: true
      continueOnError: false
    windows:
      shell: pwsh
      run: ./scripts/validate_env_vars.ps1
      interactive: true
      continueOnError: false      
```

- **Lines 11-20**: **প্রি-ডিপ্লয়মেন্ট হুক** - `azd up` চালানোর আগে চলে

      - Unix/Linux-এ: যাচাইকরণ স্ক্রিপ্টকে এক্সিকিউটেবল করে এবং চালায়
      - Windows-এ: PowerShell যাচাইকরণ স্ক্রিপ্ট চালায়
      - উভয়ই ইন্টারেক্টিভ এবং যদি ব্যর্থ হয় তবে ডিপ্লয়মেন্ট বন্ধ করে দেবে

```yaml  title="" linenums="0"
  postprovision:
    windows:
      shell: pwsh
      run: ./scripts/write_env.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
      continueOnError: true
      interactive: true
```
- **Lines 21-30**: **পোস্ট-প্রোভিশন হুক** - Azure রিসোর্সগুলি তৈরি হওয়ার পরে চলে

  - পরিবেশ ভেরিয়েবল লেখার স্ক্রিপ্টগুলো চালায়
  - এই স্ক্রিপ্টগুলি ব্যর্থ হলেও ডিপ্লয়মেন্ট চালিয়ে যায় (`continueOnError: true`)

```yaml title="" linenums="0"
  postdeploy:
    windows:
      shell: pwsh
      run: ./scripts/postdeploy.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
      continueOnError: true
      interactive: true
```
- **Lines 31-40**: **পোস্ট-ডিপ্লয় হুক** - অ্যাপ্লিকেশন ডিপ্লয়ের পরে চলে

  - চূড়ান্ত সেটআপ স্ক্রিপ্টগুলো চালায়
  - স্ক্রিপ্ট ব্যর্থ হলেও এটি চালু রেখে দেয়

### 2.4 সার্ভিস কনফিগ (41-48)

এই কনফিগারেশনটি আপনি যে অ্যাপ্লিকেশন সার্ভিসটি ডিপ্লয় করছেন সেটিকে কনফিগার করে।

```yaml title="" linenums="0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- **Line 42**: "api_and_frontend" নামে একটি সার্ভিস সংজ্ঞায়িত করে
- **Line 43**: সোর্স কোডের জন্য `./src` ডিরেক্টরিকে নির্দেশ করে
- **Line 44**: প্রোগ্রামিং ভাষা হিসেবে Python নির্ধারণ করে
- **Line 45**: হোস্টিং প্ল্যাটফর্ম হিসেবে Azure Container Apps ব্যবহার করে
- **Lines 46-48**: Docker কনফিগারেশন

      - Docker ইমেজের নাম হিসেবে "api_and_frontend" ব্যবহার করে
      - Docker ইমেজটি Azure-এ রিমোটলি বিল্ড করে (লোকাল নয়)

### 2.5 পাইপলাইন ভেরিয়েবল (49-76)

এগুলো হ'ল CI/CD পাইপলাইনে স্বয়ংক্রিয়তার জন্য `azd` চালানোর সময় সাহায্যকারী ভেরিয়েবলসমূহ

```yaml title="" linenums="0"
pipeline:
  variables:
    - AZURE_RESOURCE_GROUP
    - AZURE_AIHUB_NAME
    - AZURE_AIPROJECT_NAME
    - AZURE_AISERVICES_NAME
    - AZURE_SEARCH_SERVICE_NAME
    - AZURE_APPLICATION_INSIGHTS_NAME
    - AZURE_CONTAINER_REGISTRY_NAME
    - AZURE_KEYVAULT_NAME
    - AZURE_STORAGE_ACCOUNT_NAME
    - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
    - USE_CONTAINER_REGISTRY
    - USE_APPLICATION_INSIGHTS
    - USE_AZURE_AI_SEARCH_SERVICE
    - AZURE_AI_AGENT_NAME
    - AZURE_AI_AGENT_ID
    - AZURE_AI_AGENT_DEPLOYMENT_NAME
    - AZURE_AI_AGENT_DEPLOYMENT_SKU
    - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
    - AZURE_AI_AGENT_MODEL_NAME
    - AZURE_AI_AGENT_MODEL_FORMAT
    - AZURE_AI_AGENT_MODEL_VERSION
    - AZURE_AI_EMBED_DEPLOYMENT_NAME
    - AZURE_AI_EMBED_DEPLOYMENT_SKU
    - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
    - AZURE_AI_EMBED_MODEL_NAME
    - AZURE_AI_EMBED_MODEL_FORMAT
    - AZURE_AI_EMBED_MODEL_VERSION
    - AZURE_AI_EMBED_DIMENSIONS
    - AZURE_AI_SEARCH_INDEX_NAME
    - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
    - AZURE_EXISTING_AIPROJECT_ENDPOINT
    - AZURE_EXISTING_AGENT_ID
    - ENABLE_AZURE_MONITOR_TRACING
    - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
```

এই বিভাগটি **ডিপ্লয়ের সময়** ব্যবহৃত পরিবেশ ভেরিয়েবলসমূহকে বিভাগ অনুযায়ী সংগঠিতভাবে সংজ্ঞায়িত করে:

- **Azure রিসোর্স নামসমূহ (Lines 51-60)**:
      - মূল Azure সার্ভিস রিসোর্স নামসমূহ, উদাহরণস্বরূপ Resource Group, AI Hub, AI Project ইত্যাদি
- **ফিচার ফ্ল্যাগসমূহ (Lines 61-63)**:
      - নির্দিষ্ট Azure সার্ভিসগুলো অন/অফ করার জন্য বুলিয়ান ভেরিয়েবলসমূহ
- **AI এজেন্ট কনফিগারেশন (Lines 64-71)**:
      - প্রধান AI এজেন্টের কনফিগারেশন, যেমন নাম, আইডি, ডিপ্লয়মেন্ট সেটিংস, মডেল বিবরণ
- **AI এমবেডিং কনফিগারেশন (Lines 72-79)**:
      - ভেক্টর সার্চের জন্য ব্যবহৃত এমবেডিং মডেলের কনফিগারেশন
- **Search এবং মনিটরিং (Lines 80-84)**:
      - সার্চ ইনডেক্স নাম, বিদ্যমান রিসোর্স আইডি, এবং মনিটরিং/ট্রেসিং সেটিংস

---

## 3. পরিবেশ ভেরিয়েবল সম্পর্কে জানুন
নিচের পরিবেশ ভেরিয়েবলগুলো আপনার ডিপ্লয়ের কনফিগারেশন এবং আচরণ নিয়ন্ত্রণ করে, এবং এগুলো তাদের মূল উদ্দেশ্য অনুসারে সংগঠিত। বেশিরভাগ ভেরিয়েবলের গ্রহণযোগ্য ডিফল্ট থাকে, তবে আপনি এগুলো কাস্টমাইজ করে আপনার নির্দিষ্ট চাহিদা বা বিদ্যমান Azure রিসোর্সের সাথে মিলে নিতে পারেন।

### 3.1 প্রয়োজনীয় ভেরিয়েবল 

```bash title="" linenums="0"
# মূল অ্যাজিউর কনফিগারেশন
AZURE_ENV_NAME                    # পরিবেশের নাম (রিসোর্স নামকরণে ব্যবহৃত)
AZURE_LOCATION                    # ডিপ্লয়মেন্ট অঞ্চল
AZURE_SUBSCRIPTION_ID             # টার্গেট সাবস্ক্রিপশন
AZURE_RESOURCE_GROUP              # রিসোর্স গ্রুপের নাম
AZURE_PRINCIPAL_ID                # RBAC-এর জন্য ব্যবহারকারী প্রিন্সিপাল

# রিসোর্স নামসমূহ (উল্লেখ না করলে স্বয়ংক্রিয়ভাবে তৈরি হবে)
AZURE_AIHUB_NAME                  # Microsoft Foundry হাবের নাম
AZURE_AIPROJECT_NAME              # এআই প্রকল্পের নাম
AZURE_AISERVICES_NAME             # এআই সেবা অ্যাকাউন্টের নাম
AZURE_STORAGE_ACCOUNT_NAME        # স্টোরেজ অ্যাকাউন্টের নাম
AZURE_CONTAINER_REGISTRY_NAME     # কনটেইনার রেজিস্ট্রির নাম
AZURE_KEYVAULT_NAME               # কী ভল্টের নাম (যদি ব্যবহৃত হয়)
```

### 3.2 মডেল কনফিগারেশন 
```bash title="" linenums="0"
# চ্যাট মডেল কনফিগারেশন
AZURE_AI_AGENT_MODEL_NAME         # ডিফল্ট: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # ডিফল্ট: OpenAI (অথবা Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # ডিফল্ট: সর্বশেষ উপলব্ধ
AZURE_AI_AGENT_DEPLOYMENT_NAME    # চ্যাট মডেলের ডিপ্লয়মেন্টের নাম
AZURE_AI_AGENT_DEPLOYMENT_SKU     # ডিফল্ট: স্ট্যান্ডার্ড
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # ডিফল্ট: 80 (হাজার TPM)

# এম্বেডিং মডেল কনফিগারেশন
AZURE_AI_EMBED_MODEL_NAME         # ডিফল্ট: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # ডিফল্ট: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # ডিফল্ট: সর্বশেষ উপলব্ধ
AZURE_AI_EMBED_DEPLOYMENT_NAME    # এম্বেডিংগুলোর ডিপ্লয়মেন্টের নাম
AZURE_AI_EMBED_DEPLOYMENT_SKU     # ডিফল্ট: স্ট্যান্ডার্ড
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # ডিফল্ট: 50 (হাজার TPM)

# এজেন্ট কনফিগারেশন
AZURE_AI_AGENT_NAME               # এজেন্টের প্রদর্শন নাম
AZURE_EXISTING_AGENT_ID           # বিদ্যমান এজেন্ট ব্যবহার করুন (ঐচ্ছিক)
```

### 3.3 ফিচার টগল
```bash title="" linenums="0"
# ঐচ্ছিক পরিষেবাসমূহ
USE_APPLICATION_INSIGHTS         # ডিফল্ট: সত্য
USE_AZURE_AI_SEARCH_SERVICE      # ডিফল্ট: মিথ্যা
USE_CONTAINER_REGISTRY           # ডিফল্ট: সত্য

# মনিটরিং এবং ট্রেসিং
ENABLE_AZURE_MONITOR_TRACING     # ডিফল্ট: মিথ্যা
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # ডিফল্ট: মিথ্যা

# অনুসন্ধান কনফিগারেশন
AZURE_AI_SEARCH_INDEX_NAME       # অনুসন্ধান সূচকের নাম
AZURE_SEARCH_SERVICE_NAME        # অনুসন্ধান সার্ভিসের নাম
```

### 3.4 AI প্রকল্প কনফিগারেশন 
```bash title="" linenums="0"
# বিদ্যমান রিসোর্স ব্যবহার করুন
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # বিদ্যমান AI প্রকল্পের পূর্ণ রিসোর্স আইডি
AZURE_EXISTING_AIPROJECT_ENDPOINT       # বিদ্যমান প্রকল্পের এন্ডপয়েন্ট URL
```

### 3.5 আপনার ভেরিয়েবলগুলো পরীক্ষা করুন

Azure Developer CLI ব্যবহার করে আপনার পরিবেশ ভেরিয়েবলগুলো দেখুন এবং পরিচালনা করুন:

```bash title="" linenums="0"
# বর্তমান পরিবেশের সকল পরিবেশ ভেরিয়েবল দেখুন
azd env get-values

# একটি নির্দিষ্ট পরিবেশ ভেরিয়েবল পান
azd env get-value AZURE_ENV_NAME

# একটি পরিবেশ ভেরিয়েবল সেট করুন
azd env set AZURE_LOCATION eastus

# একটি .env ফাইল থেকে একাধিক ভেরিয়েবল সেট করুন
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
দায়-অস্বীকৃতি:
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা সঠিকতা বজায় রাখার চেষ্টা করি, তবে দয়া করে留意 করুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার মূল ভাষায়ই প্রামাণ্য উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের ক্ষেত্রে পেশাদার মানব অনুবাদ নেওয়ার পরামর্শ দেওয়া হয়। এই অনুবাদ ব্যবহারের ফলে সৃষ্ট কোনো ভুলবোঝাবুঝি বা ভ্রান্ত ব্যখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->