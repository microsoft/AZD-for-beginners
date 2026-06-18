# অধ্যায় 2: AI-প্রথম ডেভেলপমেন্ট

**📚 কোর্স**: [AZD নতুনদের জন্য](../../README.md) | **⏱️ সময়কাল**: 1-2 ঘণ্টা | **⭐ জটিলতা**: মধ্যবর্তী

---

## ওভারভিউ

এই অধ্যায়টি Azure Developer CLI এবং Microsoft Foundry সার্ভিস ব্যবহার করে AI-চালিত অ্যাপ্লিকেশন ডিপ্লয় করার উপর কেন্দ্র করে। সহজ AI চ্যাট অ্যাপ থেকে টুলস সহ বুদ্ধিমান এজেন্ট পর্যন্ত।

> **যাচাইকরণ নোট (2026-06-15):** এই অধ্যায়ে কমান্ড ফ্লো এবং এক্সটেনশনের নির্দেশিকা `azd` `1.25.6` এবং বর্তমান প্রিভিউ AI এজেন্ট এক্সটেনশন রিলিজ `azure.ai.agents` `0.1.40-preview` এর বিরুদ্ধে পর্যালোচনা করা হয়েছে। যদি আপনার AZD বিল্ড পুরনো হয়, প্রথমে আপডেট করুন এবং তারপর অনুশীলনগুলো চালিয়ে যান।

## শেখার লক্ষ্য

By completing this chapter, you will:
- পূর্ব-নির্মিত AZD টেমপ্লেট ব্যবহার করে AI অ্যাপ্লিকেশন ডিপ্লয় করা
- AZD-র সাথে Microsoft Foundry ইন্টিগ্রেশন বুঝতে পারা
- টুলসসহ AI এজেন্ট কনফিগার ও কাস্টমাইজ করা
- RAG (Retrieval-Augmented Generation) অ্যাপ্লিকেশন ডিপ্লয় করা

---

## 📚 পাঠসমূহ

| # | পাঠ | বর্ণনা | সময় |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD-কে Foundry সার্ভিসগুলির সাথে সংযুক্ত করা | 30 মিনিট |
| 2 | [AI Agents Guide](agents.md) | টুলসসহ বুদ্ধিমান এজেন্ট ডিপ্লয় করা | 45 মিনিট |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AI মডেল ডিপ্লয় ও কনফিগার করা | 30 মিনিট |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | হ্যান্ডস-অন: আপনার AI সমাধানকে AZD-র উপযোগী করা | 60 মিনিট |

---

## 🚀 দ্রুত শুরু

```bash
# বিকল্প ১: RAG চ্যাট অ্যাপ্লিকেশন
azd init --template azure-search-openai-demo
azd up

# বিকল্প ২: এআই এজেন্টসমূহ
azd init --template get-started-with-ai-agents
azd up

# বিকল্প ৩: দ্রুত চ্যাট অ্যাপ
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 বৈশিষ্ট্যযুক্ত AI টেমপ্লেট

| টেমপ্লেট | বর্ণনা | সার্ভিসসমূহ |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | উদ্ধৃতি-সহ RAG চ্যাট | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | টুলসসহ AI এজেন্ট | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | বেসিক AI চ্যাট | OpenAI + Container Apps |

---

## 💰 খরচ সচেতনতা

| পরিবেশ | আনুমানিক মাসিক খরচ |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**টিপ:** Run `azd down` after testing to avoid charges.

---

## 🔗 নেভিগেশন

| দিক | অধ্যায় |
|-----------|---------|
| **পূর্ববর্তী** | [অধ্যায় 1: ভিত্তি](../chapter-01-foundation/README.md) |
| **পরবর্তী** | [অধ্যায় 3: কনফিগারেশন](../chapter-03-configuration/README.md) |
| **সরাসরি যান** | [অধ্যায় 8: প্রোডাকশন প্যাটার্নস](../chapter-08-production/README.md) |

---

## 📖 সম্পর্কিত রিসোর্স

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->