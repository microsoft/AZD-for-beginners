# অধ্যায় ৪: কোড হিসেবে অবকাঠামো & ডিপ্লয়মেন্ট

**📚 কোর্স**: [শুরুকারীদের জন্য AZD](../../README.md) | **⏱️ সময়কাল**: ২-৩ ঘণ্টা পাঠ; ডিপ্লয়মেন্ট চর্চার জন্য অতিরিক্ত সময় দিন | **⭐ জটিলতা**: মধ্যবর্তী

---

## ওভারভিউ

এই অধ্যায়ে বেসিক টেমপ্লেট, রিসোর্স প্রোভিশনিং, এবং Azure Developer CLI ব্যবহার করে ডিপ্লয়মেন্ট কৌশল সম্পর্কে আলোচনা করা হয়েছে।

> কমান্ড এবং কনফিগারেশন পর্যালোচনা লক্ষ্য: `azd 1.37.2` (নভেম্বর ২০২৬)। পর্যালোচনার সময় লাইভ Azure প্রোভিশনিং চালানো হয়নি।

## শেখার লক্ষ্যসমূহ

এই অধ্যায় সম্পন্ন করার মাধ্যমে, আপনি পারবেন:
- বেসিক টেমপ্লেটের গঠন এবং সিনট্যাক্স বোঝা
- `azd provision` দিয়ে Azure রিসোর্স প্রোভিশন করা
- `azd deploy` দিয়ে অ্যাপ্লিকেশন ডিপ্লয় করা
- ব্লু-গ্রিন এবং রোলিং ডিপ্লয়মেন্ট কৌশল বাস্তবায়ন করা

---

## 📚 পাঠসমূহ

| # | পাঠ | বিবরণ | সময় |
|---|--------|-------------|------|
| ১ | [রিসোর্স প্রোভিশনিং](provisioning.md) | AZD এর মাধ্যমে Azure রিসোর্স ব্যবস্থাপনা | ৪৫ মিনিট |
| ২ | [ডিপ্লয়মেন্ট গাইড](deployment-guide.md) | অ্যাপ্লিকেশন ডিপ্লয়মেন্ট কৌশল | ৪৫ মিনিট |
| ৩ | [নিজের টেমপ্লেট তৈরি](custom-templates.md) | পুনঃব্যবহারযোগ্য azd টেমপ্লেট তৈরি ও প্রকাশ | ৩০ মিনিট |

---

## 🚀 দ্রুত শুরু

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
azd up
```

---

## 📁 AZD প্রকল্পের কাঠামো

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

## 🔧 অত্যাবশ্যকীয় কমান্ডসমূহ

| কমান্ড | বিবরণ |
|---------|-------------|
| `azd init` | প্রকল্প আরম্ভ করা |
| `azd provision` | Azure রিসোর্স তৈরি করা |
| `azd deploy` | অ্যাপ্লিকেশন কোড ডিপ্লয় করা |
| `azd up` | প্রোভিশন + ডিপ্লয় |
| `azd down` | সব রিসোর্স মুছে ফেলা |

---

## 🔗 নেভিগেশন

| দিকনির্দেশ | অধ্যায় |
|-----------|---------|
| **পূর্ববর্তী** | [অধ্যায় ৩: কনফিগারেশন](../chapter-03-configuration/README.md) |
| **পরবর্তী** | [অধ্যায় ৫: মাল্টি-এজেন্ট সলিউশন](../chapter-05-multi-agent/README.md) |

---

## 📖 সম্পর্কিত রিসোর্সসমূহ

- [পূর্ব-ডিপ্লয়মেন্ট চেকসমূহ](../chapter-06-pre-deployment/README.md)
- [কনটেইনার অ্যাপ উদাহরণ](../../examples/container-app/README.md)
- [ডাটাবেস অ্যাপ উদাহরণ](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->