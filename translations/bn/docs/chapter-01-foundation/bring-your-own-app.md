# নিজের অ্যাপ নিয়ে আসুন - বিদ্যমান প্রজেক্টে azd যোগ করুন

**চ্যাপ্টার ন্যাভিগেশন:**
- **📚 Course Home**: [নবীনদের জন্য AZD](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় 1 - ভিত্তি ও দ্রুত শুরু
- **⬅️ পূর্ববর্তী**: [আপনার প্রথম প্রকল্প](first-project.md)
- **➡️ পরবর্তী**: [ডেভ কন্টেইনার এবং কোডস্পেস](dev-containers.md)

> যাচাই করা হয়েছে `azd 1.25.6` অনুযায়ী জুন ২০২৬ তে.

## পরিচিতি

In [আপনার প্রথম প্রকল্প](first-project.md) you deployed an app by starting from a template. But most of the time you already *have* an app—a Node.js API, a Python Flask service, a .NET web app—sitting in a folder on your machine. This lesson shows how to add azd to that existing code so you can deploy it with `azd up`, no template required.

## শেখার লক্ষ্য

By the end of this lesson, you will:
- Understand the three ways to start an azd project
- Run `azd init` inside an existing codebase
- Understand what `azure.yaml` and the `infra/` folder do for your app
- Know when to let azd generate infrastructure vs. write your own
- Deploy your existing app to Azure with `azd up`

## শেখার ফলাফল

After completing this lesson, you will be able to:
- Initialize azd in a project you already have
- Read and edit a basic `azure.yaml` file
- Generate starter infrastructure with `azd infra generate`
- Choose an appropriate Azure host for your app
- Deploy and clean up your own application

---

## azd প্রজেক্ট শুরু করার তিনটি উপায়

| শুরু করার পয়েন্ট | কমান্ড | কখন ব্যবহার করবেন |
|----------------|---------|-------------|
| **টেমপ্লেট থেকে** | `azd init --template <name>` | Learning, or starting a new app from a proven sample |
| **আপনার বিদ্যমান কোড থেকে** | `azd init` (in your project folder) | You already have an app and want to deploy it |
| **একটি Git রিপো থেকে** | `azd init --from-code` (in a cloned repo) | বিদ্যমান রিপোজিটরিতে azd গ্রহণ করা |

You already practiced the first option. This lesson covers the second—the most common real-world scenario.

---

## ধাপ ১: আপনার প্রজেক্টে `azd init` চালান

Open a terminal **আপনার বিদ্যমান প্রজেক্ট ফোল্ডারের ভিতরে** and run:

```bash
cd my-existing-app
azd init
```

azd will ask how you want to initialize. Choose:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Pick **"Use code in the current directory."** azd then scans your folder, detects your language and framework, and proposes a host.

### azd কী সনাক্ত করে

azd looks for signals like `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, or a `Dockerfile`, and suggests a matching Azure host:

| আপনার অ্যাপ | সম্ভাব্য সনাক্তকৃত হোস্ট |
|----------|----------------------|
| Node.js / Python / .NET web অ্যাপ | Azure App Service বা Container Apps |
| কনটেইনারাইজ করা অ্যাপ (`Dockerfile`) | Azure Container Apps |
| Function অ্যাপ | Azure Functions |
| স্ট্যাটিক সাইট (React/Vue build output) | Azure Static Web Apps |

Confirm the detected service(s), and azd scaffolds the files you need.

---

## ধাপ ২: azd কী তৈরি করেছে তা বুঝুন

After init, you'll have two new things in your project:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — প্রজেক্ট সংজ্ঞা

This is the heart of an azd project. A minimal one looks like this:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

The `services` block is the key part: each entry maps a folder of your code to an Azure host. If your app has both a frontend and an API, you'll have two services.

### `infra/` — কোড হিসেবে আপনার Azure রিসোর্সসমূহ

The `infra/` folder holds Bicep files that define the Azure resources your app needs (the App Service, the database, etc.). You don't have to write these by hand—azd generates a working starting point. You *can* edit them later to add resources or tighten security (covered in [অধ্যায় ৪](../chapter-04-infrastructure/README.md)).

> **টিপ:** Want to see or customize the generated infrastructure before deploying? Run `azd infra generate` (also available as `azd infra synth`) to write the IaC to disk so you can review and version-control it.

---

## ধাপ ৩: প্রয়োজনীয় কনফিগারেশন সেট করুন

If your app needs settings or secrets (a connection string, an API key), don't hardcode them. Use environment values:

```bash
# একটি পরিবেশ তৈরি করুন
azd env new dev

# একটি অগোপন মান সেট করুন
azd env set API_VERSION 1.0.0
```

For real secrets, store them in Key Vault and reference them from your infrastructure—see [অধ্যায় ৩: কনফিগারেশন ও প্রমাণীকরণ](../chapter-03-configuration/authsecurity.md).

---

## ধাপ ৪: ডিপ্লয়

Now use the same workflow you already know:

```bash
# প্রমাণীকরণ (azd-এর জন্য প্রয়োজনীয়)
azd auth login

# তৈরি করা হবে এমন রিসোর্সগুলোর পূর্বরূপ দেখুন
azd provision --preview

# ইনফ্রাস্ট্রাকচার প্রস্তুত করুন এবং আপনার কোড ডিপ্লয় করুন
azd up
```

When it finishes, azd prints your app's URL. Verify it the same way as any azd app:

```bash
azd show           # এন্ডপয়েন্টগুলো দেখান
azd monitor --logs # প্রয়োজনে লগগুলো পরীক্ষা করুন
```

---

## সাধারণ প্রথমবারের সমস্যা

| লক্ষণ | সম্ভাব্য কারণ | সমাধান |
|---------|--------------|-----|
| azd didn't detect my app | Missing manifest (e.g., `package.json`) | Add the manifest, or pick the host manually during `azd init` |
| `azd up` চলাকালে বিল্ড ব্যর্থ হয় | App needs a build step | Add `buildCommand`/`outputPath` under the service in `azure.yaml` |
| অ্যাপ শুরু হয় কিন্তু ত্রুটি দেয় | Missing config/secret | Set values with `azd env set` or wire up Key Vault |
| ভুল হোস্ট নির্বাচিত হয়েছে | Auto-detection guessed | Edit `host:` in `azure.yaml` and re-run `azd up` |

For more, see [অধ্যায় ৭: সমস্যা সমাধান](../chapter-07-troubleshooting/README.md).

---

## ক্লিন আপ

```bash
azd down --force --purge
```

---

## সারসংক্ষেপ

- `azd init` → **"Use code in the current directory"** আপনার ইতিমধ্যেই থাকা একটি অ্যাপে azd যোগ করে।
- `azure.yaml` আপনার কোড ফোল্ডারগুলোকে Azure হোস্টগুলোর সাথে ম্যাপ করে; `infra/` রিসোর্সগুলোকে Bicep হিসেবে নির্ধারণ করে।
- `azd infra generate` আপনাকে জেনারেট করা ইনফ্রাস্ট্রাকচার রিভিউ বা কাস্টমাইজ করতে দেয়।
- একবার ইনিশিয়ালাইজ করা হলে, আপনার বিদ্যমান অ্যাপ টেমপ্লেট-ভিত্তিক অ্যাপের মত একই `azd up` / `azd down` ওয়ার্কফ্লো ব্যবহার করে।

---

## 🔗 ন্যাভিগেশন

| দিক | পাঠ |
|-----------|--------|
| **পূর্ববর্তী** | [আপনার প্রথম প্রকল্প](first-project.md) |
| **পরবর্তী** | [ডেভ কন্টেইনার এবং কোডস্পেস](dev-containers.md) |

## 📖 সম্পর্কিত রিসোর্স

- [AZD বেসিকস](azd-basics.md)
- [অধ্যায় ৪: কোড হিসেবে ইনফ্রাস্ট্রাকচার](../chapter-04-infrastructure/README.md)
- [কনফিগারেশন ও প্রমাণীকরণ](../chapter-03-configuration/authsecurity.md)
- [কমান্ড চিট-শিট](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->