# অধ্যায় 7: সমস্যা নির্ণয় ও ডিবাগিং

**📚 কোর্স**: [AZD নবশিক্ষার্থীদের জন্য](../../README.md) | **⏱️ সময়কাল**: 1-1.5 ঘণ্টা | **⭐ জটিলতা**: মধ্যম

---

## ওভারভিউ

এই অধ্যায়টি আপনাকে Azure Developer CLI ব্যবহার করার সময় প্রায়শই ঘটে এমন সমস্যাগুলো নির্ণয় এবং সমাধান করতে সাহায্য করে। এটি ডিপ্লয়মেন্ট ব্যর্থতা থেকে AI-নির্দিষ্ট সমস্যাগুলো পর্যন্ত কভার করে।

> June 2026-এ `azd 1.25.6` এর বিরুদ্ধে যাচাইকরণ করা হয়েছে।

## শিখন উদ্দেশ্য

By completing this chapter, you will:
- সাধারণ AZD ডিপ্লয়মেন্ট ব্যর্থতা নির্ণয় করা
- প্রমাণীকরণ ও অনুমতি সম্পর্কিত সমস্যাগুলো ডিবাগ করা
- AI সার্ভিস সংযোগজনিত সমস্যাগুলো সমাধান করা
- ট্রাবলশুটিং-এর জন্য Azure Portal ও CLI ব্যবহার করা

---

## 📚 পাঠসমূহ

| # | পাঠ | বর্ণনা | সময় |
|---|--------|-------------|------|
| 1 | [সাধারণ সমস্যা](common-issues.md) | প্রায়ই সম্মুখীন হওয়া সমস্যাগুলো | 30 min |
| 2 | [ডিবাগিং নির্দেশিকা](debugging.md) | ধাপে ধাপে ডিবাগিং কৌশলসমূহ | 45 min |
| 3 | [AI ট্রাবলশুটিং](ai-troubleshooting.md) | AI-নির্দিষ্ট সমস্যা সমাধান | 30 min |

---

## 🚨 দ্রুত সমাধান

### প্রমাণীকরণ সমস্যা
```bash
# AZD ওয়ার্কফ্লোগুলোর জন্য প্রয়োজনীয়
azd auth login

# যদি আপনি সরাসরি Azure CLI কমান্ডও ব্যবহার করেন তবে এটি ঐচ্ছিক
az login

azd auth status
```

### প্রভিশনিং ব্যর্থতা
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### রিসোর্স সংঘর্ষ
```bash
azd down --force --purge
azd env new different-name
azd up
```

### কোটা অতিক্রম
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 ত্রুটি কোড রেফারেন্স

| ত্রুটি | কারণ | সমাধান |
|-------|-------|----------|
| `AuthenticationError` | লগইন করা নেই | `azd auth login` |
| `ResourceNotFound` | রিসোর্স অনুপস্থিত | রিসোর্স নামগুলো পরীক্ষা করুন |
| `QuotaExceeded` | সাবস্ক্রিপশন সীমা | কোটা বৃদ্ধি অনুরোধ করুন |
| `InvalidTemplate` | Bicep সিনট্যাক্স ত্রুটি | `az bicep build` |
| `Conflict` | রিসোর্স ইতোমধ্যেই আছে | নতুন নাম ব্যবহার করুন বা মুছুন |
| `Forbidden` | পর্যাপ্ত অনুমতি নেই | RBAC রোলগুলো পরীক্ষা করুন |

---

## 🔄 রিসেট এবং পুনরুদ্ধার

```bash
# সফট রিসেট (রিসোর্স রেখে, কোড পুনরায় ডিপ্লয় করা)
azd deploy --force

# হার্ড রিসেট (সবকিছু মুছে ফেলা, নতুন করে শুরু করা)
azd down --force --purge
azd up
```

---

## 🔗 নেভিগেশন

| দিক | অধ্যায় |
|-----------|---------|
| **Previous** | [অধ্যায় 6: Pre-Deployment](../chapter-06-pre-deployment/README.md) |
| **Next** | [অধ্যায় 8: Production](../chapter-08-production/README.md) |

---

## 📖 প্রাসঙ্গিক সম্পদ

- [পূর্ব-ডিপ্লয়মেন্ট চেক](../chapter-06-pre-deployment/preflight-checks.md)
- [কনফিগারেশন গাইড](../chapter-03-configuration/configuration.md)
- [AZD GitHub ইস্যুগুলো](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->