# অধ্যায় ৩: কনফিগারেশন ও প্রমাণীকরণ

**📚 কোর্স**: [শুরুর জন্য AZD](../../README.md) | **⏱️ সময়কাল**: ৯০-১৫০ মিনিট ইন্টিগ্রেশন প্র্যাকটিস সহ | **⭐ জটিলতা**: মধ্যবর্তী

---

## পর্যালোচনা

এই অধ্যায়ে Azure Developer CLI মোতায়েনের জন্য পরিবেশ কনফিগারেশন, প্রমাণীকরণ প্যাটার্ন এবং সুরক্ষা সেরা অনুশীলন আলোচনা করা হবে।

> কমান্ড এবং কনফিগারেশন পর্যালোচনার লক্ষ্য: `azd 1.37.2` (নভেম্বর ২০২৬)। পর্যালোচনার সময় সরাসরি Azure প্রোভিশনিং চালানো হয়নি।

## শেখার উদ্দেশ্য

এই অধ্যায় সম্পন্ন করার মাধ্যমে আপনি:
- AZD কনফিগারেশন স্তর দক্ষতা অর্জন করবেন
- একাধিক পরিবেশ (ডেভ, স্টেজিং, প্রোড) পরিচালনা করতে পারবেন
- পরিচালিত পরিচয় ব্যবহার করে নিরাপদ প্রমাণীকরণ বাস্তবায়ন করবেন
- পরিবেশ-নির্দিষ্ট সেটিংস কনফিগার করবেন

---

## 📚 পাঠক্রম

| # | পাঠ | বর্ণনা | সময় |
|---|--------|-------------|------|
| ১ | [কনফিগারেশন গাইড](configuration.md) | পরিবেশ সেটআপ ও ব্যবস্থাপনা | ৩০ মিনিট |
| ২ | [প্রমাণীকরণ ও সুরক্ষা](authsecurity.md) | পরিচালিত পরিচয় ও RBAC প্যাটার্ন | ৩০ মিনিট |

---

## 🚀 দ্রুত শুরু

শুধুমাত্র **অর্থাৎ ইতিমধ্যে আরম্ভ করা azd অ্যাপ্লিকেশন** এর রুট থেকে চালান, কোর্স রিপোজিটরি থেকে নয়। যদি পরিবেশের নাম আগেই ব্যবহার হয়ে থাকে, তাহলে নতুন পরিবেশের নাম ব্যবহার করুন।

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` উদাহরণস্বরূপ: যদি আপনার টেমপ্লেট এটি স্পষ্টভাবে ব্যবহৃত না করে তবে এটি কেবল অবকাঠামো প্রভাবিত করে। সাধারণ `azd env set` মানগুলি স্থানীয়ভাবে প্লেইনটেক্সটে সংরক্ষিত হয়; এগুলি সুরক্ষিত সিক্রেট স্টোরেজ নয়।

---

## 🔧 কনফিগারেশন স্তর

তিনটি ভিন্ন কনফিগারেশন স্তর আলাদা রাখুন: গ্লোবাল পছন্দ (`azd config`), প্রকল্প কাঠামো (`azure.yaml`), এবং প্রতিটি পরিবেশের মান (`azd env`)। ফ্ল্যাগগুলি কেবলমাত্র যেসব সেটিংস সমর্থন করে তাদেরকে ওভাররাইড করে; `azure.yaml` বা Bicep এ অভ arbitrary পরিবেশ ভেরিয়েবল ওভারলে নেই।

---

## 🔐 সুরক্ষা সেরা অনুশীলন

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 নেভিগেশন

| দিকনির্দেশ | অধ্যায় |
|-----------|---------|
| **পূর্ববর্তী** | [অধ্যায় ২: এআই উন্নয়ন](../chapter-02-ai-development/README.md) |
| **পরবর্তী** | [অধ্যায় ৪: অবকাঠামো](../chapter-04-infrastructure/README.md) |

---

## 📖 সম্পর্কিত সম্পদ

- [প্রি-ডিপ্লয়মেন্ট পরীক্ষা](../chapter-06-pre-deployment/README.md)
- [সমস্যা সমাধান](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->