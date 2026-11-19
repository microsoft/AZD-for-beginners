# ৪. একটি টেমপ্লেট কনফিগার করুন

!!! tip "এই মডিউলের শেষে আপনি পারবেন"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## ১. আসল টেমপ্লেট থেকে শুরু করুন

আপনি যে রিপোজিটরি ইনিশিয়ালাইজ করেছেন সেখানে [`azure.yaml` in Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) খুলুন। আপস্ট্রীম টেমপ্লেটটি এই কর্মশালার থেকে স্বাধীনভাবে পরিবর্তিত হতে পারে। নিচের **অবতরণ**টি ৪ নভেম্বর, ২০২৬ এ পরীক্ষা করা হয়েছে; এটি সম্পূর্ণ ফাইলের বিকল্প নয়:

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` AZD প্রকল্পটি নির্দেশ করে; `metadata.template` টেমপ্লেট সংস্করণ রেকর্ড করে।
- `requiredVersions.azd` টেমপ্লেটের ন্যূনতম, পুরানো CLI এর উপর থাকার সুপারিশ নয়। একটি বর্তমান সমর্থিত AZD রিলিজ ব্যবহার করুন।
- `services` অ্যাপ্লিকেশন মোতায়েনের লক্ষ্যমাত্রা নির্ধারণ করে। এই টেমপ্লেট তার পিএইচপি API এবং ফ্রন্টএন্ড একক কনটেইনার অ্যাপস সার্ভিস হিসেবে মোতায়েন করে।
- `project` `azure.yaml` এর আপেক্ষিক।
- `remoteBuild` একটি রিমোট কনটেইনার বিল্ড অনুরোধ করে। আপনার পরিচয় এখনও প্রয়োজনীয় Azure অনুমতিগুলি প্রয়োজন।

টেমপ্লেটের Bicep ফাইলগুলো `infra/` এর নীচে থাকে, কেবল `services` তালিকা নয়, যা Microsoft Foundry, মডেল মোতায়েন, স্টোরেজ এবং ঐচ্ছিক AI সার্চ সহ সম্পদ ঘোষণা করে।

## ২. জীবনচক্র হুকগুলো বুঝুন

টেমপ্লেট চালানোর আগে `hooks` সেকশন এবং তার উল্লেখিত স্ক্রিপ্টগুলো পরিদর্শন করুন। পর্যালোচিত সংস্করণটি অন্তর্ভুক্ত:

| হুক | উদ্দেশ্য | গুরুত্বপূর্ণ আচরণ |
|------|---------|--------------------|
| `preup` | `up` ওয়ার্কফ্লোর আগে টেমপ্লেট পরিবেশ ইনপুট যাচাই করুন | প্ল্যাটফর্ম-নির্দিষ্ট শেল স্ক্রিপ্ট ব্যর্থ হলে ওয়ার্কফ্লো বন্ধ করতে পারে |
| `postdeploy` | অ্যাপ্লিকেশন মোতায়েনের পর টেমপ্লেট-নির্দিষ্ট সেটআপ চালান | `continueOnError` এবং স্ক্রিপ্ট আউটপুট পরিদর্শন করুন; সফল মোতায়েন প্রতিটি সেটআপ কাজ সফল হয়েছে প্রমাণ করে না |

এই সংস্করণে **না** পুরোনো `postprovision` / `write_env` হুক যা আগের কর্মশালা উপকরণে দেখানো হয়েছে। ইতিমধ্যেই অস্তিত্বহীন স্ক্রিপ্টগুলিতে হুক রেফারেন্স অনুলিপি করবেন না।

হুক কী লাইফসাইকেল ইভেন্ট নির্বাচন করে; `posix` এবং `windows` প্ল্যাটফর্ম বাস্তবায়ন নির্বাচন করে। `shell`, `run`, `interactive`, এবং `continueOnError` এক্সিকিউশন নিয়ন্ত্রণ করে। এগুলো আপনার অনুমতির সঙ্গে নির্বাহযোগ্য স্ক্রিপ্ট, তাই এগুলো পর্যালোচনা করুন যেমনটি আপনি অ্যাপ্লিকেশন কোড করবেন।

সম্পূর্ণ জীবচক্রের জন্য [AZD হুকের ডকুমেন্টেশন](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) দেখুন।

## 3. পরিকাঠামোতে পরিবেশ ইনপুটগুলিকে ট্রেস করুন

প্রাথমিক নমুনা রিপোজিটরি থেকে এই কমান্ডগুলি চালান:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

`infra/main.parameters.json` পরিদর্শন করুন দেখতে কি ধরনের পরিবেশ ভেরিয়েবল টেমপ্লেট প্রকৃতপক্ষে ব্যবহার করে। `azd env set` দিয়ে একটি ইচ্ছাকৃত নাম সেট করলেও স্বয়ংক্রিয়ভাবে কোনো Azure রিসোর্স পরিবর্তিত হয় না।

পর্যালোচিত ডিফল্টগুলি অন্তর্ভুক্ত:

| ইনপুট | ডিফল্ট / উদ্দেশ্য |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; কোটার ইউনিটগুলি মডেল এবং মোতায়েনের ধরনের উপর নির্ভর করে |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; তথ্য পরিচালনা পর্যালোচনা না করা পর্যন্ত অক্ষম রাখুন |

এগুলি নমুনা-নির্দিষ্ট ইনপুট, বৈশ্বিক AZD সেটিংস নয়। একটি মডেল, SKU, ক্ষমতা বা অবস্থান নির্বাচন করার আগে [মডেল এবং অঞ্চল সমর্থন দলিল](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) এবং আপনার সাবস্ক্রিপশনের কোটা পরীক্ষা করুন। প্রতিটি ক্ষমতা একককে প্রতি মিনিটে ১,০০০ টোকেন হিসেবে ব্যাখ্যা করবেন না।

একটি ভিন্ন চ্যাট মডেল নির্বাচন করতে, সংশ্লিষ্ট **নাম, সংস্করণ, ফরম্যাট, SKU, এবং ক্ষমতা একসাথে** আপডেট করুন, [নমুনার কাস্টমাইজেশন গাইড](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md) অনুসারে। শুধুমাত্র নাম পরিবর্তন করলে অসংগত সংস্করণ বা ডিপ্লয়মেন্ট টাইপ থাকতে পারে।

## ৪. ল্যাব: ঐচ্ছিক অনুসন্ধান এবং ট্রেসিং সক্ষম করা

!!! সতর্কতা "এই সেটিংস বিলযোগ্য রিসোর্স যোগ করতে পারে"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

অবকাঠামোগত পরিবর্তনের জন্য প্রোভিশনিং প্রয়োজন; শুধুমাত্র `azd deploy` অ্যাপ্লিকেশন সার্ভিস ডিপ্লয় করে। অনুসন্ধান সূচীকরণ এবং সমর্থিত পুনরুদ্ধার বিকল্পের জন্য [AI অনুসন্ধান গাইড](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) অনুসরণ করুন। মনিটরিংয়ের জন্য, [পর্যবেক্ষণযোগ্যতা গাইড](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md) অনুসরণ করুন।

প্রয়োজনীয় সম্মতি, প্রবেশাধিকার নিয়ন্ত্রণ, সংরক্ষণ নীতি এবং লালপত্র ছাড়া বাস্তব গ্রাহকের ডেটায় প্রম্পট/প্রতিক্রিয়া বিষয়বস্তু ক্যাপচার সক্ষম করবেন না।

## ৫. বিদ্যমান সম্পদ এবং CI/CD

একটি Foundry প্রকল্প পুনরায় ব্যবহার করতে, স্যাম্পলের [existing-resource instructions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) অনুসরণ করুন। `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` সেট করা হলে ডিপ্লয়মেন্ট পথ পরিবর্তিত হয়; সেই পরিস্থিতিতে, টেমপ্লেটটি আপনার জন্য Application Insights বা AI Search তৈরি করে না। ডিপেন্ডেন্সি, রোল অ্যাসাইনমেন্ট এবং মডেল ডিপ্লয়মেন্টগুলি স্পষ্টভাবে যাচাই করুন।

`pipeline.variables` বিভাগটি একটি তৈরি করা পাইপলাইনে পাস করা মানগুলি নিয়ন্ত্রণ করে; এটি কোনও গোপন স্টোর নয় এবং Azure সম্পদ তৈরি করে না। অ্যাপে পরিচালিত পরিচয় ব্যবহার করা উচিত এবং CI/CD-এর জন্য OIDC প্রাধান্য দিন। AZD পরিবেশ ফাইলগুলি প্লেইনটেক্সট এবং কমিট করা উচিত নয়।

AZD একটি বিশ্বস্ত, লোকালি প্রস্তুতকৃত dotenv ফাইল আমদানির সমর্থন করে:

```bash
azd env set --file .env
```

আমদানি করার আগে ঐ ফাইলটি পর্যালোচনা করুন, এবং গোপনীয়তা যুক্ত পরিবেশ ফাইলগুলি শেয়ার করা টার্মিনাল বা CI লগে মুদ্রণ করবেন না।

## 6. আপনার বোঝাপড়া পরীক্ষা করুন

- কোন `azure.yaml` পরিষেবা অ্যাপ্লিকেশনটি স্থাপন করে?
- আপনি পরিবর্তন করা প্রতিটি মান কোন অবকাঠামো প্যারামিটার ব্যবহার করে?
- কোন পরিবর্তনগুলি শুধুমাত্র স্থাপনের চেয়ে প্রকৌশল প্রয়োজন?
- নির্বাচিত অঞ্চল এবং সাবস্ক্রিপশন মডেল ও কোটাকে সমর্থন করে কি?
- সব সেটআপ হুক সফল হয়েছে কি, এবং আপনি স্থাপিত অ্যাপ্লিকেশনের আচরণ যাচাই করতে পারেন কি?

চালিয়ে যান [একটি টেমপ্লেট কাস্টমাইজ করুন](5-Customize-AI-Template.md)।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->