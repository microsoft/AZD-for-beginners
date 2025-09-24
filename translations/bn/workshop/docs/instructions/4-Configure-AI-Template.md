<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-24T13:49:48+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "bn"
}
-->
# 4. একটি টেমপ্লেট কনফিগার করুন

!!! tip "এই মডিউল শেষে আপনি সক্ষম হবেন"

    - [ ] `azure.yaml` এর উদ্দেশ্য বুঝতে পারবেন
    - [ ] `azure.yaml` এর গঠন সম্পর্কে জানতে পারবেন
    - [ ] azd লাইফসাইকেল `hooks` এর মূল্য বুঝতে পারবেন
    - [ ] **ল্যাব ৩:** 

---

!!! prompt "`azure.yaml` ফাইলটি কী করে? একটি কোডফেন্স ব্যবহার করে লাইন বাই লাইন ব্যাখ্যা করুন"

      `azure.yaml` ফাইলটি **Azure Developer CLI (azd)** এর কনফিগারেশন ফাইল। এটি নির্ধারণ করে আপনার অ্যাপ্লিকেশন কীভাবে Azure-এ ডিপ্লয় হবে, যার মধ্যে অন্তর্ভুক্ত রয়েছে অবকাঠামো, সার্ভিস, ডিপ্লয়মেন্ট হুক এবং পরিবেশ ভেরিয়েবল।

---

## ১. উদ্দেশ্য এবং কার্যকারিতা

এই `azure.yaml` ফাইলটি একটি AI এজেন্ট অ্যাপ্লিকেশনের **ডিপ্লয়মেন্ট ব্লুপ্রিন্ট** হিসেবে কাজ করে যা:

1. **পরিবেশ যাচাই করে** ডিপ্লয়মেন্টের আগে
2. **Azure AI সার্ভিস প্রভিশন করে** (AI Hub, AI Project, Search ইত্যাদি)
3. **Python অ্যাপ্লিকেশন ডিপ্লয় করে** Azure Container Apps-এ
4. **AI মডেল কনফিগার করে** চ্যাট এবং এমবেডিং ফাংশনালিটির জন্য
5. **মনিটরিং এবং ট্রেসিং সেটআপ করে** AI অ্যাপ্লিকেশনের জন্য
6. **নতুন এবং বিদ্যমান** Azure AI প্রজেক্ট পরিস্থিতি পরিচালনা করে

এই ফাইলটি **একটি কমান্ডে ডিপ্লয়মেন্ট** (`azd up`) সক্ষম করে একটি সম্পূর্ণ AI এজেন্ট সমাধানের জন্য, যথাযথ যাচাই, প্রভিশনিং এবং পোস্ট-ডিপ্লয়মেন্ট কনফিগারেশন সহ।

??? info "দেখুন: `azure.yaml`"

      `azure.yaml` ফাইলটি নির্ধারণ করে Azure Developer CLI কীভাবে এই AI এজেন্ট অ্যাপ্লিকেশনটি Azure-এ ডিপ্লয় এবং পরিচালনা করবে। আসুন এটি লাইন বাই লাইন বিশ্লেষণ করি।

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: আমাদের কি hooks দরকার?
      # TODO: আমাদের কি সব ভেরিয়েবল দরকার?

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

## ২. ফাইলটি বিশ্লেষণ

আসুন ফাইলটি অংশে ভাগ করে দেখি, এটি কী করে এবং কেন।

### ২.১ **হেডার এবং স্কিমা (১-৩)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **লাইন ১**: YAML ভাষার সার্ভার স্কিমা ভ্যালিডেশন প্রদান করে IDE সাপোর্ট এবং IntelliSense এর জন্য

### ২.২ প্রজেক্ট মেটাডেটা (৫-১০)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **লাইন ৫**: প্রজেক্টের নাম নির্ধারণ করে যা Azure Developer CLI ব্যবহার করে
- **লাইন ৬-৭**: টেমপ্লেট সংস্করণ ১.০.২ এর উপর ভিত্তি করে
- **লাইন ৮-৯**: Azure Developer CLI সংস্করণ ১.১৪.০ বা তার বেশি প্রয়োজন

### ২.৩ ডিপ্লয় হুকস (১১-৪০)

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

- **লাইন ১১-২০**: **প্রি-ডিপ্লয়মেন্ট হুক** - `azd up` এর আগে চালানো হয়

      - Unix/Linux-এ: ভ্যালিডেশন স্ক্রিপ্ট এক্সিকিউটেবল করে এবং চালায়
      - Windows-এ: PowerShell ভ্যালিডেশন স্ক্রিপ্ট চালায়
      - উভয়ই ইন্টারঅ্যাকটিভ এবং ব্যর্থ হলে ডিপ্লয়মেন্ট বন্ধ করবে

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
- **লাইন ২১-৩০**: **পোস্ট-প্রভিশন হুক** - Azure রিসোর্স তৈরি হওয়ার পরে চালানো হয়

  - পরিবেশ ভেরিয়েবল লেখার স্ক্রিপ্ট চালায়
  - স্ক্রিপ্ট ব্যর্থ হলেও ডিপ্লয়মেন্ট চালিয়ে যায় (`continueOnError: true`)

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
- **লাইন ৩১-৪০**: **পোস্ট-ডিপ্লয় হুক** - অ্যাপ্লিকেশন ডিপ্লয় হওয়ার পরে চালানো হয়

  - চূড়ান্ত সেটআপ স্ক্রিপ্ট চালায়
  - স্ক্রিপ্ট ব্যর্থ হলেও চালিয়ে যায়

### ২.৪ সার্ভিস কনফিগ (৪১-৪৮)

এটি আপনার ডিপ্লয় করা অ্যাপ্লিকেশন সার্ভিস কনফিগার করে।

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

- **লাইন ৪২**: "api_and_frontend" নামে একটি সার্ভিস নির্ধারণ করে
- **লাইন ৪৩**: সোর্স কোডের জন্য `./src` ডিরেক্টরি নির্দেশ করে
- **লাইন ৪৪**: Python প্রোগ্রামিং ভাষা নির্ধারণ করে
- **লাইন ৪৫**: Azure Container Apps ব্যবহার করে হোস্টিং প্ল্যাটফর্ম হিসেবে
- **লাইন ৪৬-৪৮**: Docker কনফিগারেশন

      - "api_and_frontend" নামে ইমেজ ব্যবহার করে
      - Azure-এ রিমোটলি Docker ইমেজ তৈরি করে (লোকালি নয়)

### ২.৫ পাইপলাইন ভেরিয়েবল (৪৯-৭৬)

এগুলি CI/CD পাইপলাইনে `azd` চালানোর জন্য স্বয়ংক্রিয়তার সহায়ক ভেরিয়েবল।

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

এই অংশটি ডিপ্লয়মেন্টের সময় ব্যবহৃত পরিবেশ ভেরিয়েবল নির্ধারণ করে, বিভাগ অনুযায়ী সংগঠিত:

- **Azure রিসোর্স নাম (লাইন ৫১-৬০)**:
      - Core Azure সার্ভিস রিসোর্স নাম যেমন Resource Group, AI Hub, AI Project ইত্যাদি
- **ফিচার ফ্ল্যাগস (লাইন ৬১-৬৩)**:
      - নির্দিষ্ট Azure সার্ভিস চালু/বন্ধ করার জন্য বুলিয়ান ভেরিয়েবল
- **AI এজেন্ট কনফিগারেশন (লাইন ৬৪-৭১)**:
      - প্রধান AI এজেন্টের কনফিগারেশন, যার মধ্যে নাম, ID, ডিপ্লয়মেন্ট সেটিংস, মডেল ডিটেইলস
- **AI এমবেডিং কনফিগারেশন (লাইন ৭২-৭৯)**:
      - ভেক্টর সার্চের জন্য ব্যবহৃত এমবেডিং মডেলের কনফিগারেশন
- **সার্চ এবং মনিটরিং (লাইন ৮০-৮৪)**:
      - সার্চ ইনডেক্স নাম, বিদ্যমান রিসোর্স ID এবং মনিটরিং/ট্রেসিং সেটিংস

---

## ৩. পরিবেশ ভেরিয়েবল জানুন
নিম্নলিখিত পরিবেশ ভেরিয়েবল আপনার ডিপ্লয়মেন্টের কনফিগারেশন এবং আচরণ নিয়ন্ত্রণ করে, তাদের প্রধান উদ্দেশ্য অনুযায়ী সংগঠিত। বেশিরভাগ ভেরিয়েবলের যুক্তিসঙ্গত ডিফল্ট রয়েছে, তবে আপনি এগুলি আপনার নির্দিষ্ট প্রয়োজনীয়তা বা বিদ্যমান Azure রিসোর্সের সাথে মিলিয়ে কাস্টমাইজ করতে পারেন।

### ৩.১ প্রয়োজনীয় ভেরিয়েবল 

```bash title="" linenums="0"
# Core Azure Configuration
AZURE_ENV_NAME                    # Environment name (used in resource naming)
AZURE_LOCATION                    # Deployment region
AZURE_SUBSCRIPTION_ID             # Target subscription
AZURE_RESOURCE_GROUP              # Resource group name
AZURE_PRINCIPAL_ID                # User principal for RBAC

# Resource Names (Auto-generated if not specified)
AZURE_AIHUB_NAME                  # AI Foundry hub name
AZURE_AIPROJECT_NAME              # AI project name
AZURE_AISERVICES_NAME             # AI services account name
AZURE_STORAGE_ACCOUNT_NAME        # Storage account name
AZURE_CONTAINER_REGISTRY_NAME     # Container registry name
AZURE_KEYVAULT_NAME               # Key Vault name (if used)
```

### ৩.২ মডেল কনফিগারেশন 
```bash title="" linenums="0"
# Chat Model Configuration
AZURE_AI_AGENT_MODEL_NAME         # Default: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Default: OpenAI (or Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Default: latest available
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Deployment name for chat model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Default: 80 (thousands of TPM)

# Embedding Model Configuration  
AZURE_AI_EMBED_MODEL_NAME         # Default: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Default: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Default: latest available
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Deployment name for embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Default: 50 (thousands of TPM)

# Agent Configuration
AZURE_AI_AGENT_NAME               # Agent display name
AZURE_EXISTING_AGENT_ID           # Use existing agent (optional)
```

### ৩.৩ ফিচার টগল
```bash title="" linenums="0"
# Optional Services
USE_APPLICATION_INSIGHTS         # Default: true
USE_AZURE_AI_SEARCH_SERVICE      # Default: false
USE_CONTAINER_REGISTRY           # Default: true

# Monitoring and Tracing
ENABLE_AZURE_MONITOR_TRACING     # Default: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Default: false

# Search Configuration
AZURE_AI_SEARCH_INDEX_NAME       # Search index name
AZURE_SEARCH_SERVICE_NAME        # Search service name
```

### ৩.৪ AI প্রজেক্ট কনফিগারেশন 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### ৩.৫ আপনার ভেরিয়েবল পরীক্ষা করুন

Azure Developer CLI ব্যবহার করে আপনার পরিবেশ ভেরিয়েবল দেখুন এবং পরিচালনা করুন:

```bash title="" linenums="0"
# View all environment variables for current environment
azd env get-values

# Get a specific environment variable
azd env get-value AZURE_ENV_NAME

# Set an environment variable
azd env set AZURE_LOCATION eastus

# Set multiple variables from a .env file
azd env set --from-file .env
```

---

