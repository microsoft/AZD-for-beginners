# আপনার নিজের azd টেমপ্লেট তৈরি করা

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ Previous**: [Deployment Guide](deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md)

> Validated against `azd 1.25.6` in June 2026.

## পরিচিতি

এখন পর্যন্ত আপনি *ব্যবহার করেছেন* টেমপ্লেটগুলো `azd init --template <name>` দিয়ে। কিন্তু একবার আপনার দল এমন একটি প্রকল্প বিন্যাস পছন্দ করলে — ধরুন, একটি Container App একটি Cosmos DB এবং সঠিক মনিটরিং সহ — আপনি এটিকে নিজের একটি পুনরায় ব্যবহারযোগ্য টেমপ্লেটে রূপান্তর করতে চাইবেন। একটি টেমপ্লেট হলো কেবল একটি Git রিপোজিটরি যার একটি প্রত্যাশিত কাঠামো থাকে যেটা azd পড়তে পারে। এই পাঠটি আপনাকে দেখায় কিভাবে একটি টেমপ্লেট স্ক্র্যাচ থেকে তৈরি করতে, পরীক্ষা করতে, এবং (ঐচ্ছিকভাবে) কমিউনিটি গ্যালারিতে প্রকাশ করতে হয়।

## শেখার লক্ষ্য

এই পাঠের শেষে আপনি:
- বুঝতে পারবেন কি কী একটি ফোল্ডারকে "azd template" বানায়
- জানতে পারবেন প্রয়োজনীয় ফাইল এবং ফোল্ডার বিন্যাস
- অন্যরা পুনরায় ব্যবহার করতে পারে এমন একটি `azure.yaml` এবং `infra/` যুক্ত করতে পারবেন
- শেয়ার করার আগে লোকালি আপনার টেমপ্লেট পরীক্ষা করতে পারবেন
- এটি প্রকাশ করতে পারবেন এবং (ঐচ্ছিকভাবে) Awesome AZD-এ সাবমিট করতে পারবেন

## শেখার ফলাফল

এই পাঠ সম্পন্ন করার পর, আপনি সক্ষম হবেন:
- একটি নতুন টেমপ্লেট রিপোজিটরি স্ক্যাফোল্ড করতে
- ইনফ্রাস্ট্রাকচারকে প্যারামিটারাইজ করতে যাতে তা যেকোন সাবস্ক্রিপশনে কাজ করে
- `azd init` এবং `azd up` দিয়ে একটি টেমপ্লেট যাচাই করতে
- কমিউনিটি গ্যালারি যে মেটাডেটা চায় তা যোগ করতে

---

## টেমপ্লেট আসলে কী?

একটি azd টেমপ্লেট হল **একটি Git রিপোজিটরি** যা অন্তত নিম্নলিখিতগুলো ধারণ করে:

| ফাইল / ফোল্ডার | উদ্দেশ্য | প্রয়োজন? |
|---------------|---------|-----------|
| `azure.yaml` | সার্ভিস, হোস্ট, এবং ইনফ্রা প্রোভাইডার বর্ণনা করে | ✅ হ্যাঁ |
| `infra/` | রিসোর্স তৈরি করে এমন Bicep, Terraform, বা Pulumi | ✅ হ্যাঁ |
| `src/` (or your code) | azd যে অ্যাপ্লিকেশন কোড ডিপ্লয় করে | ✅ হ্যাঁ |
| `README.md` | টেমপ্লেটটি কীভাবে ব্যবহার করবেন | ✅ অত্যন্ত সুপারিশকৃত |
| `.azdo/` or `.github/` | CI/CD পাইপলাইন সংজ্ঞা | ঐচ্ছিক |
| `.devcontainer/` | পুনরুৎপাদনযোগ্য ডেভেলপমেন্ট পরিবেশ | ঐচ্ছিক |
| `azure.yaml` `metadata` | গ্যালারি + টেলিমেট্রি তথ্য | ঐচ্ছিক (প্রকাশের জন্য প্রয়োজনীয়) |

এখানে কোনো জাদু নেই: যখন আপনি চালান `azd init --template you/your-repo`, azd রিপো ক্লোন করে এবং `azure.yaml` পড়ে।

---

## ধাপ ১: রিপোজিটরি স্ক্যাফোল্ড করুন

ফোল্ডার কাঠামো ম্যানুয়ালি তৈরি করুন বা একটি ন্যূনতম টেমপ্লেট থেকে শুরু করে তা সম্পাদনা করুন:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# স্ট্যান্ডার্ড লেআউট তৈরি করুন
mkdir -p src infra
```

A typical finished layout looks like this:

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

এটি টেমপ্লেটের হৃদয়। এটি azd-কে বলে কি deploy করতে হবে এবং কীভাবে:

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

> `metadata.template` ফিল্ডই গ্যালারি টেলিমেট্রি ব্যবহার করে ব্যবহার গণনা করার জন্য। `name@version` কনভেনশন ব্যবহার করুন।

---

## ধাপ ৩: ইনফ্রাস্ট্রাকচারকে প্যারামিটারাইজ করুন

একটি *পুনরায়ব্যবহারযোগ্য* টেমপ্লেটের জন্য সবচেয়ে গুরুত্বপূর্ণ নিয়ম: **নাম, অঞ্চল, বা সাবস্ক্রিপশন-নির্দিষ্ট মান কখনই হার্ডকোড করবেন না।** প্যারামিটার এবং resource token প্যাটার্ন ব্যবহার করুন যাতে একই টেমপ্লেট যে কারোর সাবস্ক্রিপশনে কাজ করে।

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

দুইটি জিনিস এই টেমপ্লেটটিকে টেমপ্লেট-সহযোগী করে:

1. **`azd-env-name` tag** — azd এটি ব্যবহার করে পরিবেশ অনুযায়ী রিসোর্স ট্র্যাক এবং পরিষ্কার করার জন্য।
2. **`uniqueString(...)` resource token** — স্থায়ী, বিশ্বব্যাপী অনন্য উপসর্গ তৈরি করে যাতে নামগুলো সংঘর্ষ না করে।

একটি মিলতোলা প্যারামিটার ফাইল প্রদান করুন যা পরিবেশ থেকে azd দ্বারা ইনজেক্ট করা মানগুলো পড়ে:

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

azd বর্তমান পরিবেশ থেকে `${AZURE_ENV_NAME}` এবং `${AZURE_LOCATION}` স্বয়ংক্রিয়ভাবে প্রতিস্থাপন করে।

---

## ধাপ ৪: আপনার টেমপ্লেট লোকালি পরীক্ষ করুন

শেয়ার করার আগে, একটি ক্লিন স্টেট থেকে প্রমাণ করুন যে টেমপ্লেটটি কাজ করে।

**লোকাল ফোল্ডার থেকে পরীক্ষা করুন** (কোন Git push প্রয়োজন নেই):

```bash
# একটি খালি ডিরেক্টরি থেকে, আপনার লোকাল টেমপ্লেট পাথ ব্যবহার করে ইনিশিয়ালাইজ করুন
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# শুরু থেকে শেষ পর্যন্ত প্রোভিশন এবং ডিপ্লয় করুন
azd auth login
azd up
```

**তারপর teardown পরীক্ষা করুন**—একটি ভালো টেমপ্লেট সম্পূর্ণভাবে পরিষ্কার করে:

```bash
azd down --force --purge
```

If `azd down` leaves resources behind, you probably missed the `azd-env-name` tag on a resource.

> **টিপ:** প্রথমে `azd provision --preview` চালান। এটি একটি what-if চালায় এবং কোনো রিসোর্স তৈরি হওয়ার আগে টেমপ্লেট ত্রুটিগুলো তুলে ধরে।

---

## ধাপ ৫: টেমপ্লেট প্রকাশ করুন

রিপোজিটরি GitHub-এ পুশ করুন (অন্যরা ব্যবহার করুক চাইলে public করুন):

```bash
gh repo create my-azd-template --public --source=. --push
```

Anyone can now use it:

```bash
azd init --template your-github-username/my-azd-template
```

---

## ধাপ ৬ (ঐচ্ছিক): Awesome AZD-এ জমা দিন

[Awesome AZD গ্যালারি](https://azure.github.io/awesome-azd/) কমিউনিটি টেমপ্লেটগুলো তালিকাভুক্ত করে। তালিকাভুক্ত হতে আপনার রিপোতে থাকা উচিত:

- ✅ একটি স্পষ্ট `README.md` যাতে প্রয়োজনীয়তা, একটি আর্কিটেকচার ডায়াগ্রাম, এবং খরচ সম্পর্কিত নোট রয়েছে
- ✅ একটি কাজ করা `azure.yaml` যার মধ্যে `metadata.template` আছে
- ✅ এমন ইনফ্রাস্ট্রাকচার যা একটি নতুন সাবস্ক্রিপশনে সঠিকভাবে রিসোর্স তৈরি করে
- ✅ একটি `LICENSE` ফাইল
- ✅ (প্রস্তাবিত) এক-ক্লিকে Codespaces চালানোর জন্য একটি `.devcontainer/`

গ্যালারির ডেটা ফাইলে আপনার টেমপ্লেট যোগ করে একটি pull request খুলে সাবমিট করুন, এবং অবদান নির্দেশিকা অনুসরণ করুন [Awesome AZD রিপোজিটরি](https://github.com/Azure/awesome-azd) তে।

---

## সাধারণ সমস্যা

| সমস্যা | সমাধান |
|---------|-----|
| হার্ডকোড করা রিসোর্স নাম | `uniqueString()` রিসোর্স টোকেন ব্যবহার করুন |
| `azd down` রিসোর্স রেখে যায় | প্রতিটি রিসোর্স (বা রিসোর্স গ্রুপ) `azd-env-name` দিয়ে ট্যাগ করুন |
| টেমপ্লেট আপনার জন্য কাজ করে, অন্যদের জন্য ব্যর্থ | সাবস্ক্রিপশন আইডি, টেন্যান্ট আইডি, এবং অঞ্চল সংক্রান্ত অনুমানগুলো সরান |
| আউটপুটগুলো অ্যাপের সাথে সংযুক্ত নয় | `SERVICE_<NAME>_ENDPOINT_URL` এবং অন্যান্য `AZURE_*` আউটপুট এক্সপোর্ট করুন |
| গ্যালারি সাবমিশন প্রত্যাখ্যাত | `README.md`, `LICENSE`, এবং `metadata.template` যোগ করুন |

---

## সারসংক্ষেপ

- একটি টেমপ্লেট হল কেবল একটি Git রিপো যার মধ্যে `azure.yaml`, `infra/`, এবং আপনার কোড থাকে।
- সবকিছু প্যারামিটারাইজ করুন — নাম, অঞ্চল, এবং আইডি — যাতে এটি যেকোন জায়গায় চালানো যায়।
- সবসময় রিসোর্সগুলো `azd-env-name` দিয়ে ট্যাগ করুন যাতে `azd down` কাজ করে।
- প্রকাশ করার আগে `azd init --template <local-path>` দিয়ে লোকালি পরীক্ষা করুন।
- Awesome AZD-এ সাবমিট করার জন্য মেটাডেটা এবং একটি README যোগ করুন।

---

## 🔗 নেভিগেশন

| দিক | রিসোর্স |
|-----------|----------|
| **পূর্ববর্তী** | [ডিপ্লয়মেন্ট গাইড](deployment-guide.md) |
| **অধ্যায় হোম** | [অধ্যায় ৪: ইনফ্রাস্ট্রাকচার অ্যাজ কোড](README.md) |
| **পরবর্তী অধ্যায়** | [অধ্যায় ৫: মাল্টি-এজেন্ট সলিউশনস](../chapter-05-multi-agent/README.md) |

## 📖 সম্পর্কিত রিসোর্স

- [রিসোর্স provision করা](provisioning.md)
- [Awesome AZD গ্যালারি](https://azure.github.io/awesome-azd/)
- [অফিশিয়াল azd টেমপ্লেট ডকুমেন্টেশন](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->