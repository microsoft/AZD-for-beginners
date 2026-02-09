# 4. টেমপ্লেট কনফিগার করুন

!!! tip "এই মডিউলের শেষে আপনি সক্ষম হবেন"

    - [ ] `azure.yaml` এর উদ্দেশ্য বুঝতে পারবেন
    - [ ] `azure.yaml` এর কাঠামো বুঝতে পারবেন
    - [ ] azd লাইফসাইকেল `hooks` এর গুরুত্ব বুঝতে পারবেন
    - [ ] **Lab 4:** পরিবেশ ভেরিয়েবল অন্বেষণ ও পরিবর্তন করুন

---

!!! prompt "`azure.yaml` ফাইলটি কী করে? একটি কোডফেন্স ব্যবহার করে লাইন ধরে ব্যাখ্যা করুন"

      The `azure.yaml` ফাইলটি হল Azure Developer CLI (azd)-এর **কনফিগারেশন ফাইল**। এটি নির্ধারণ করে কীভাবে আপনার অ্যাপ্লিকেশনটি Azure-এ ডিপ্লয় করা উচিত, যাতে অবকাঠামো, সার্ভিসসমূহ, ডিপ্লয়মেন্ট হুকস এবং পরিবেশ ভেরিয়েবল থাকে।

---

## 1. উদ্দেশ্য ও কার্যকারিতা

এই `azure.yaml` ফাইলটি একটি AI এজেন্ট অ্যাপ্লিকেশনের জন্য **ডিপ্লয়মেন্ট ব্লুপ্রিন্ট** হিসাবে কাজ করে যা:

1. **ডিপ্লয়ের আগে পরিবেশ যাচাই করে**
2. **Azure AI সার্ভিসগুলো প্রস্তুত করে** (AI Hub, AI Project, Search ইত্যাদি)
3. **একটি Python অ্যাপ্লিকেশন ডিপ্লয় করে** Azure Container Apps-এ
4. **চ্যাট এবং এম্বেডিং ফাংশনালিটির জন্য AI মডেল কনফিগার করে**
5. **AI অ্যাপ্লিকেশনের জন্য মনিটরিং এবং ট্রেসিং স্থাপন করে**
6. **নতুন এবং বিদ্যমান উভয়** Azure AI প্রকল্প পরিস্থিতি পরিচালনা করে

ফাইলটি যথাযথ যাচাই, প্রোভিশনিং, এবং পোস্ট-ডিপ্লয়মেন্ট কনফিগারেশনের সাথে একটি পূর্ণাঙ্গ AI এজেন্ট সলিউশনের জন্য **one-command deployment** (`azd up`) সক্ষম করে।

??? info "বিস্তারিত দেখুন: `azure.yaml`"

      The `azure.yaml` ফাইলটি নির্ধারণ করে কীভাবে Azure Developer CLI এই AI Agent অ্যাপ্লিকেশনটি Azure-এ ডিপ্লয় এবং ম্যানেজ করবে। চলুন এটিকে লাইন বাই লাইন বিশ্লেষণ করি।

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

## 2. ফাইলের বিশ্লেষণ

চলুন অংশভিত্তিকভাবে ফাইলটি দেখে নিই, যাতে বোঝা যায় এটি কী করে - এবং কেন।

### 2.1 **হেডার এবং স্কিমা (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: IDE সাপোর্ট এবং IntelliSense-এর জন্য YAML ল্যাঙ্গুয়েজ সার্ভারের স্কিমা ভ্যালিডেশন প্রদান করে

### 2.2 প্রকল্প মেটাডেটা (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Azure Developer CLI-এ ব্যবহৃত প্রকল্পের নাম নির্ধারণ করে
- **Lines 6-7**: এটি টেমপ্লেট ভার্সন 1.0.2-এর উপর ভিত্তি করে আছে তা নির্দিষ্ট করে
- **Lines 8-9**: Azure Developer CLI ভার্সন 1.14.0 বা তার উপরে প্রয়োজন

### 2.3 ডিপ্লয় হুকস (11-40)

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

- **Lines 11-20**: **প্রী-ডিপ্লয়মেন্ট হুক** - `azd up` করার আগে চলে

      - On Unix/Linux: যাচাই স্ক্রিপ্টটিকে executable করে এবং চালায়
      - On Windows: PowerShell যাচাই স্ক্রিপ্ট চালায়
      - Both are interactive and will stop deployment if they fail

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
- **Lines 21-30**: **পোস্ট-প্রোভিশন হুক** - Azure রিসোর্স তৈরি হওয়ার পরে চলে

  - পরিবেশ ভেরিয়েবল লেখার স্ক্রিপ্টগুলি কার্যকর করে
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
- **Lines 31-40**: **পোস্ট-ডিপ্লয় হুক** - অ্যাপ্লিকেশন ডিপ্লয়মেন্টের পরে চলে

  - চূড়ান্ত সেটআপ স্ক্রিপ্টগুলো চালায়
  - স্ক্রিপ্টগুলি ব্যর্থ হলেও চালিয়ে যায়

### 2.4 সার্ভিস কনফিগারেশন (41-48)

This configures the application service you are deploying.

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

- **Line 42**: "api_and_frontend" নামে একটি সার্ভিস নির্ধারণ করে
- **Line 43**: সোর্স কোডের জন্য `./src` ডিরেক্টরিকে নির্দেশ করে
- **Line 44**: প্রোগ্রামিং ভাষা হিসেবে Python নির্ধারণ করে
- **Line 45**: হোস্টিং প্ল্যাটফর্ম হিসেবে Azure Container Apps ব্যবহার করে
- **Lines 46-48**: Docker কনফিগারেশন

      - ইমেজ নাম হিসেবে "api_and_frontend" ব্যবহার করে
      - Docker ইমেজটি Azure-এ রিমোটভাবে বিল্ড করে (লোকালি নয়)

### 2.5 পাইপলাইন ভ্যারিয়েবলস (49-76)

These are variables to help you run `azd` in CI/CD pipelines for automation

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

This section defines environment variables used **during deployment**, organized by category:

- **Azure Resource Names (Lines 51-60)**:
      - কোর Azure সার্ভিস রিসোর্স নামসমূহ যেমন, Resource Group, AI Hub, AI Project ইত্যাদি
- **Feature Flags (Lines 61-63)**:
      - নির্দিষ্ট Azure সার্ভিস সক্রিয়/নিষ্ক্রিয় করার জন্য বুলিয়ান ভেরিয়েবল
- **AI Agent Configuration (Lines 64-71)**:
      - প্রধান AI এজেন্টের কনফিগারেশন, নাম, ID, ডিপ্লয়মেন্ট সেটিংস, মডেল বিবরণ ইত্যাদি
- **AI Embedding Configuration (Lines 72-79)**:
      - ভেক্টর সার্চে ব্যবহৃত এম্বেডিং মডেলের কনফিগারেশন
- **Search and Monitoring (Lines 80-84)**:
      - সার্চ ইনডেক্স নাম, বিদ্যমান রিসোর্স আইডি, এবং মনিটরিং/ট্রেসিং সেটিংস

---

## 3. পরিবেশ ভেরিয়েবলগুলি জানুন
নিম্নলিখিত পরিবেশ ভেরিয়েবলগুলা আপনার ডিপ্লয়মেন্টের কনফিগারেশন ও আচরণ নিয়ন্ত্রণ করে, প্রধান উদ্দেশ্য অনুযায়ী সংগঠিত। বেশিরভাগ ভেরিয়েবলের যুক্তিসঙ্গত ডিফল্ট থাকে, কিন্তু আপনি এগুলো আপনার নির্দিষ্ট প্রয়োজনীয়তা বা বিদ্যমান Azure রিসোর্সগুলোর সঙ্গে মানানসই করতে কাস্টমাইজ করতে পারবেন।

### 3.1 প্রয়োজনীয় ভেরিয়েবলস 

```bash title="" linenums="0"
# মূল Azure কনফিগারেশন
AZURE_ENV_NAME                    # পরিবেশের নাম (রিসোর্সের নামকরণে ব্যবহৃত)
AZURE_LOCATION                    # ডিপ্লয়মেন্ট অঞ্চল
AZURE_SUBSCRIPTION_ID             # টার্গেট সাবস্ক্রিপশন
AZURE_RESOURCE_GROUP              # রিসোর্স গ্রুপের নাম
AZURE_PRINCIPAL_ID                # RBAC-এর জন্য ব্যবহারকারী প্রিন্সিপাল

# রিসোর্স নামসমূহ (নির্দিষ্ট না করলে স্বয়ংক্রিয়ভাবে তৈরি হবে)
AZURE_AIHUB_NAME                  # Microsoft Foundry হাবের নাম
AZURE_AIPROJECT_NAME              # AI প্রকল্পের নাম
AZURE_AISERVICES_NAME             # AI সার্ভিস অ্যাকাউন্টের নাম
AZURE_STORAGE_ACCOUNT_NAME        # স্টোরেজ অ্যাকাউন্টের নাম
AZURE_CONTAINER_REGISTRY_NAME     # কন্টেইনার রেজিস্ট্রির নাম
AZURE_KEYVAULT_NAME               # Key Vault-এর নাম (যদি ব্যবহৃত হয়)
```

### 3.2 মডেল কনফিগারেশন 
```bash title="" linenums="0"
# চ্যাট মডেল কনফিগারেশন
AZURE_AI_AGENT_MODEL_NAME         # ডিফল্ট: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # ডিফল্ট: OpenAI (অথবা Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # ডিফল্ট: সর্বশেষ উপলব্ধ
AZURE_AI_AGENT_DEPLOYMENT_NAME    # চ্যাট মডেলের ডিপ্লয়মেন্ট নাম
AZURE_AI_AGENT_DEPLOYMENT_SKU     # ডিফল্ট: স্ট্যান্ডার্ড
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # ডিফল্ট: 80 (হাজার TPM)

# এম্বেডিং মডেল কনফিগারেশন
AZURE_AI_EMBED_MODEL_NAME         # ডিফল্ট: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # ডিফল্ট: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # ডিফল্ট: সর্বশেষ উপলব্ধ
AZURE_AI_EMBED_DEPLOYMENT_NAME    # এম্বেডিংসের ডিপ্লয়মেন্ট নাম
AZURE_AI_EMBED_DEPLOYMENT_SKU     # ডিফল্ট: স্ট্যান্ডার্ড
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # ডিফল্ট: 50 (হাজার TPM)

# এজেন্ট কনফিগারেশন
AZURE_AI_AGENT_NAME               # এজেন্ট প্রদর্শন নাম
AZURE_EXISTING_AGENT_ID           # বিদ্যমান এজেন্ট ব্যবহার করুন (ঐচ্ছিক)
```

### 3.3 ফিচার টগল
```bash title="" linenums="0"
# ঐচ্ছিক পরিষেবাসমূহ
USE_APPLICATION_INSIGHTS         # ডিফল্ট: true
USE_AZURE_AI_SEARCH_SERVICE      # ডিফল্ট: false
USE_CONTAINER_REGISTRY           # ডিফল্ট: true

# মনিটরিং এবং ট্রেসিং
ENABLE_AZURE_MONITOR_TRACING     # ডিফল্ট: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # ডিফল্ট: false

# অনুসন্ধান কনফিগারেশন
AZURE_AI_SEARCH_INDEX_NAME       # অনুসন্ধান সূচকের নাম
AZURE_SEARCH_SERVICE_NAME        # অনুসন্ধান সার্ভিসের নাম
```

### 3.4 AI প্রজেক্ট কনফিগারেশন 
```bash title="" linenums="0"
# বিদ্যমান সম্পদ ব্যবহার করুন
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # বিদ্যমান এআই প্রকল্পের সম্পূর্ণ রিসোর্স আইডি
AZURE_EXISTING_AIPROJECT_ENDPOINT       # বিদ্যমান প্রকল্পের এন্ডপয়েন্ট URL
```

### 3.5 আপনার ভেরিয়েবলগুলো পরীক্ষা করুন

Azure Developer CLI ব্যবহার করে আপনার পরিবেশ ভেরিয়েবলগুলি দেখুন এবং পরিচালনা করুন:

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
এই নথিটি AI অনুবাদ পরিষেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতা বজায় রাখার চেষ্টা করি, তবুও অনুগ্রহ করে মনে রাখুন যে স্বয়ংক্রিয় অনুবাদে ভুল বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার নিজ ভাষায়ই প্রাসঙ্গিক ও প্রামাণিক উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের ক্ষেত্রে পেশাদার মানব অনুবাদের পরামর্শ দেওয়া হয়। এই অনুবাদ ব্যবহারের ফলে উদ্ভূত কোনও ভুলবোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->