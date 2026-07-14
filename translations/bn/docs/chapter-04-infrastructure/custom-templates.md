# আপনার নিজের azd টেমপ্লেট তৈরি করা

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [প্রারম্ভীদের জন্য AZD](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৪ - ইনফ্রাস্ট্রাকচার অ্যাজ কোড এবং ডিপ্লয়মেন্ট
- **⬅️ পূর্ববর্তী**: [ডিপ্লয়মেন্ট গাইড](deployment-guide.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৫: মাল্টি-এজেন্ট সলিউশন](../chapter-05-multi-agent/README.md)

> জুলাই ২০২৬-এ `azd 1.27.1` এর বিরুদ্ধে যাচাই করা হয়েছে।

## ভূমিকা

এখন পর্যন্ত আপনি `azd init --template <name>` দিয়ে টেমপ্লেট *ভোগ* করেছেন। কিন্তু একবার আপনার টিম একটি প্রিয় প্রকল্প বিন্যাস পেলে — যেমন, একটি Container App যার সাথে Cosmos DB এবং সঠিক মনিটরিং আছে — আপনি এটি নিজের পুনঃব্যবহারযোগ্য টেমপ্লেট হিসেবে রূপান্তর করতে চাইবেন। একটি টেমপ্লেট হল একটি Git রিপোজিটরি যা একটি পূর্বনির্ধারিত কাঠামো সহ যা azd পড়তে পারেন। এই পাঠে দেখানো হয়েছে কীভাবে একটিকে শূন্য থেকে তৈরি করবেন, পরীক্ষা করবেন, এবং (ঐচ্ছিক) কমিউনিটি গ্যালারিতে প্রকাশ করবেন।

## শেখার লক্ষ্য

এই পাঠের শেষে, আপনি:
- একটি ফোল্ডারকে "azd টেমপ্লেট" কী করে তা বুঝতে পারবেন
- প্রয়োজনীয় ফাইল এবং ফোল্ডার বিন্যাস জানবেন
- একটি `azure.yaml` এবং `infra/` যোগ করবেন যা অন্যরা পুনঃব্যবহার করতে পারে
- শেয়ার করার আগে আপনার টেমপ্লেটটি স্থানীয়ভাবে পরীক্ষা করবেন
- প্রকাশ করবেন এবং (ঐচ্ছিক) Awesome AZD-তে জমা দেবেন

## শেখার ফলাফল

এই পাঠ সম্পন্ন করার পর, আপনি সক্ষম হবেন:
- একটি নতুন টেমপ্লেট রিপোজিটরি স্কাফোল্ড করা
- অবকাঠামো প্যারামিটারাইজ করা যাতে এটি যেকোনো সাবস্ক্রিপশনে কাজ করে
- `azd init` এবং `azd up` দ্বারা টেমপ্লেট যাচাই করা
- কমিউনিটি গ্যালারির জন্য প্রয়োজনীয় মেটাডেটা যোগ করা

---

## একটা টেমপ্লেট আসলে কি?

একটি azd টেমপ্লেট হল **একটি Git রিপোজিটরি** যা অন্তত নিম্নলিখিতগুলি অন্তর্ভুক্ত করে:

| ফাইল / ফোল্ডার | উদ্দেশ্য | প্রয়োজনীয়? |
|---------------|---------|-----------|
| `azure.yaml` | সেবা, হোস্ট, এবং অবকাঠামো প্রোভাইডার বর্ণনা করে | ✅ হ্যাঁ |
| `infra/` | Bicep, Terraform, অথবা Pulumi যা রিসোর্স তৈরি করে | ✅ হ্যাঁ |
| `src/` (অথবা আপনার কোড) | অ্যাপ্লিকেশন কোড যা azd ডিপ্লয় করে | ✅ হ্যাঁ |
| `README.md` | টেমপ্লেট কীভাবে ব্যবহার করবেন | ✅ খুব সুপারিশকৃত |
| `.azdo/` অথবা `.github/` | CI/CD পাইপলাইনের সংজ্ঞা | ঐচ্ছিক |
| `.devcontainer/` | পুনরুত্পাদনযোগ্য ডেভ এনভায়রনমেন্ট | ঐচ্ছিক |
| `azure.yaml` এর `metadata` | গ্যালারি + টেলিমেট্রি তথ্য | ঐচ্ছিক (প্রকাশের জন্য প্রয়োজন) |

এখানে কোনও জাদু নেই: যখন আপনি `azd init --template you/your-repo` চালান, azd রিপোজিটরি ক্লোন করে এবং `azure.yaml` পড়ে।

---

## ধাপ ১: রিপোজিটরি স্কাফোল্ড করা

ম্যানুয়ালি ফোল্ডার বিন্যাস তৈরি করুন অথবা একটি ন্যূনতম টেমপ্লেট থেকে শুরু করে সেটি সম্পাদনা করুন:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# স্ট্যান্ডার্ড লেআউট তৈরি করুন
mkdir -p src infra
```

একটি সাধারণ শেষ বিন্যাস দেখতে এরকম হয়:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## ধাপ ২: `azure.yaml` লিখুন

এটি টেমপ্লেটের হৃদয়। এটি azd কে বলে কি ডিপ্লয় করতে হবে এবং কীভাবে:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> `metadata.template` ক্ষেত্রটি গ্যালারি টেলিমেট্রি ব্যবহার করে ব্যবহার গণনা করতে। `name@version` রীতি ব্যবহার করুন।

---

## ধাপ ৩: অবকাঠামো প্যারামিটারাইজ করুন

একটি *পুনঃব্যবহারযোগ্য* টেমপ্লেটের সবচেয়ে গুরুত্বপূর্ণ নিয়ম: **নাম, অঞ্চল বা সাবস্ক্রিপশন-নির্দিষ্ট মান কখনো হার্ডকোড করবেন না।** প্যারামিটার এবং রিসোর্স টোকেন প্যাটার্ন ব্যবহার করুন যাতে একই টেমপ্লেট যেকোনো ইউজারের সাবস্ক্রিপশনে কাজ করে।

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

এই টেমপ্লেট-বন্ধুত্বপূর্ণ করে দুটি জিনিস:

১. **`azd-env-name` ট্যাগ** — azd প্রতিটি এনভায়রনমেন্টের জন্য রিসোর্স ট্র্যাক এবং পরিষ্কার করতে ব্যবহার করে।
২. **`uniqueString(...)` রিসোর্স টোকেন** — একটি স্থায়ী, বিশ্বব্যাপী অনন্য সাফিক্স তৈরি করে যাতে নামগুলো সংঘর্ষ ঘটে না।

একটি মিল রাখা প্যারামিটার ফাইল দিন যা পরিবেশ থেকে azd দ্বারা ইনজেক্ট করা মানগুলো পড়ে:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd স্বয়ংক্রিয়ভাবে বর্তমান পরিবেশ থেকে `${AZURE_ENV_NAME}` এবং `${AZURE_LOCATION}` প্রতিস্থাপন করে।

---

## ধাপ ৪: স্থানীয়ভাবে আপনার টেমপ্লেট পরীক্ষা করুন

শেয়ার করার আগে, প্রমাণ করুন টেমপ্লেটটি পরিস্কার অবস্থা থেকে কাজ করে।

**স্থানীয় ফোল্ডার থেকে পরীক্ষা করুন** (কোনো Git পুশ প্রয়োজন নেই):

```bash
# একটি খালি ডিরেক্টরি থেকে, আপনার স্থানীয় টেমপ্লেট পাথ ব্যবহার করে আরম্ভ করুন
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provision + সম্পূর্ণ নির্মাণ এবং মোতায়েন করুন
azd auth login
azd up
```

**তারপর teardown পরীক্ষা করুন** — একটি ভাল টেমপ্লেট সম্পূর্ণ পরিষ্কার করে:

```bash
azd down --force --purge
```

যদি `azd down` রিসোর্স রেখে যায়, সম্ভবত আপনি রিসোর্সে `azd-env-name` ট্যাগ মিস করেছেন।

> **টিপ:** প্রথমে `azd provision --preview` চালান। এটি কী হবে তা পরীক্ষা করে এবং কোনো রিসোর্স তৈরির আগে টেমপ্লেট ত্রুটি গুলো দেখায়।

---

## ধাপ ৫: টেমপ্লেট প্রকাশ করুন

রিপোজিটরিটি GitHub-এ পুশ করুন (পাবলিক হলে অন্যরা ব্যবহার করতে পারবে):

```bash
gh repo create my-azd-template --public --source=. --push
```

এখন যেকেউ এটা ব্যবহার করতে পারে:

```bash
azd init --template your-github-username/my-azd-template
```

---

## ধাপ ৬ (ঐচ্ছিক): Awesome AZD-তে জমা দিন

[Awesome AZD গ্যালারি](https://azure.github.io/awesome-azd/) কমিউনিটির টেমপ্লেট তালিকাভুক্ত করে। তালিকাভুক্ত হতে আপনার রিপোতে থাকা উচিত:

- ✅ সুস্পষ্ট `README.md` প্রাক-প্রয়োজনীয়তা, আর্কিটেকচার ডায়াগ্রাম, এবং খরচ নোট সহ
- ✅ কাজ করে এমন `azure.yaml` যার মধ্যে `metadata.template` আছে
- ✅ পরিষ্কার সাবস্ক্রিপশনে সঠিকভাবে প্রোবিশন করে এ ধরনের অবকাঠামো
- ✅ একটি `LICENSE` ফাইল
- ✅ (সুপারিশকৃত) একটি `.devcontainer/` যা এক-ক্লিক কডস্পেসের জন্য

গ্যালারির ডেটা ফাইলে আপনার টেমপ্লেট যোগ করার জন্য একটি পুল রিকুয়েস্ট খুলে জমা দিন, [Awesome AZD রিপোজিটরি](https://github.com/Azure/awesome-azd) এর অবদান গাইড অনুসরণ করে।

---

## সাধারণ সমস্যাগুলো

| সমস্যা | সমাধান |
|---------|-----|
| হার্ডকোডেড রিসোর্স নাম | `uniqueString()` রিসোর্স টোকেন ব্যবহার করুন |
| `azd down` রিসোর্স রেখে যায় | প্রতিটি রিসোর্স (অথবা রিসোর্স গ্রুপ) এ `azd-env-name` ট্যাগ দিন |
| টেমপ্লেট আপনার কাজ করে, অন্যদের জন্য ব্যর্থ হয় | সাবস্ক্রিপশন আইডি, টেন্যান্ট আইডি, এবং অঞ্চল অনুমান বাদ দিন |
| আউটপুট অ্যাপে সংযুক্ত নয় | `SERVICE_<NAME>_ENDPOINT_URL` এবং অন্যান্য `AZURE_*` আউটপুট এক্সপোর্ট করুন |
| গ্যালারি জমা রিজেক্ট হয়েছে | `README.md`, `LICENSE`, এবং `metadata.template` যোগ করুন |

---

## সারসংক্ষেপ

- একটি টেমপ্লেট মানে হল শুধু একটি Git রিপো যেটাতে থাকে `azure.yaml`, `infra/`, এবং আপনার কোড।
- সবকিছু প্যারামিটারাইজ করুন — নাম, অঞ্চল, এবং আইডি — যাতে এটি যেকোনো জায়গায় চালানো যায়।
- প্রতিটি রিসোর্সে `azd-env-name` ট্যাগ দিন যেন `azd down` কাজ করে।
- প্রকাশের আগে `azd init --template <local-path>` দিয়ে স্থানীয়ভাবে পরীক্ষা করুন।
- Awesome AZD-তে জমা দিতে মেটাডেটা এবং README যোগ করুন।

---

## 🔗 নেভিগেশন

| দিক | রিসোর্স |
|-----------|----------|
| **পূর্ববর্তী** | [ডিপ্লয়মেন্ট গাইড](deployment-guide.md) |
| **অধ্যায় হোম** | [অধ্যায় ৪: ইনফ্রাস্ট্রাকচার অ্যাজ কোড](README.md) |
| **পরবর্তী অধ্যায়** | [অধ্যায় ৫: মাল্টি-এজেন্ট সলিউশন](../chapter-05-multi-agent/README.md) |

## 📖 সম্পর্কিত রিসোর্স

- [রিসোর্স প্রোভিশনিং](provisioning.md)
- [Awesome AZD গ্যালারি](https://azure.github.io/awesome-azd/)
- [সরকারি azd টেমপ্লেট ডকুমেন্টেশন](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->