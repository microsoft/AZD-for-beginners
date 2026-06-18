# অধ্যায় 4: ইনফ্রাস্ট্রাকচার অ্যাজ কোড & ডিপ্লয়মেন্ট

**📚 কোর্স**: [AZD For Beginners](../../README.md) | **⏱️ সময়**: 1-1.5 ঘন্টা | **⭐ জটিলতা**: মধ্যম

---

## ওভারভিউ

এই অধ্যায়ে Bicep টেমপ্লেটসহ Infrastructure as Code (IaC) প্যাটার্ন, রিসোর্স প্রোভিশনিং, এবং Azure Developer CLI ব্যবহার করে ডিপ্লয়মেন্ট কৌশলগুলো আলোচনা করা হয়েছে।

> যাচাই করা হয়েছে `azd 1.25.6` জুন 2026 এ।

## শিখনের লক্ষ্য

এই অধ্যায় শেষ করার পর আপনি:
- Bicep টেমপ্লেটের কাঠামো ও সিনট্যাক্স বুঝতে পারবেন
- `azd provision` দিয়ে Azure রিসোর্স প্রোভিশন করতে পারবেন
- `azd deploy` দিয়ে অ্যাপ্লিকেশন ডিপ্লয় করতে পারবেন
- ব্লু-গ্রীন এবং রোলিং ডিপ্লয়মেন্ট কৌশলগুলো বাস্তবায়ন করতে পারবেন

---

## 📚 পাঠসমূহ

| # | পাঠ | বর্ণনা | সময় |
|---|--------|-------------|------|
| 1 | [রিসোর্স প্রদান](provisioning.md) | AZD দিয়ে Azure রিসোর্স ব্যবস্থাপনা | 45 মিনিট |
| 2 | [ডিপ্লয়মেন্ট গাইড](deployment-guide.md) | অ্যাপ্লিকেশন ডিপ্লয়মেন্ট কৌশল | 45 মিনিট |
| 3 | [নিজের টেম্পলেট তৈরি করা](custom-templates.md) | পুনঃব্যবহারযোগ্য azd টেমপ্লেট নির্মাণ ও প্রকাশ | 30 মিনিট |

---

## 🚀 Quick Start

```bash
# টেমপলেট থেকে ইনিশিয়ালাইজ করুন
azd init --template azure-functions-python-v2-http

# কি তৈরি হবে তা প্রাকদর্শন করুন
azd provision --preview

# শুধুমাত্র অবকাঠামো সেটআপ করুন
azd provision

# শুধুমাত্র কোড ডিপ্লয় করুন
azd deploy

# অথবা দুটোই একসঙ্গে
azd up
```

---

## 📁 AZD প্রকল্প কাঠামো

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 প্রয়োজনীয় কমান্ডসমূহ

| Command | বিবরণ |
|---------|-------------|
| `azd init` | প্রকল্প শুরু করুন |
| `azd provision` | Azure রিসোর্স তৈরি করুন |
| `azd deploy` | অ্যাপ্লিকেশন কোড ডিপ্লয় করুন |
| `azd up` | রিসোর্স তৈরি + ডিপ্লয় |
| `azd down` | সব রিসোর্স মুছে ফেলুন |

---

## 🔗 নেভিগেশন

| দিক | অধ্যায় |
|-----------|---------|
| **পূর্ববর্তী** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **পরবর্তী** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

---

## 📖 সম্পর্কিত রিসোর্স

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Container App Examples](../../examples/container-app/README.md)
- [Database App Example](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->