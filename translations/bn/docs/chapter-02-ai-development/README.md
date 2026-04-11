# Chapter 2: AI-First Development

**📚 কোর্স**: [AZD For Beginners](../../README.md) | **⏱️ সময়কাল**: 1-2 ঘন্টা | **⭐ জটিলতা**: মধ্যবর্তী

---

## ওভারভিউ

এই অধ্যায়টি Azure Developer CLI এবং Microsoft Foundry পরিষেবাগুলি ব্যবহার করে AI-চালিত অ্যাপ্লিকেশন মোতায়েন করার উপর কেন্দ্রিত। সাধারণ AI চ্যাট অ্যাপ থেকে শুরু করে সরঞ্জামসহ বুদ্ধিমান এজেন্ট পর্যন্ত।

> **প্রমাণীকরণ নোট (2026-03-25):** এই অধ্যায়ের কমান্ড ফ্লো এবং এক্সটেনশন নির্দেশিকা `azd` `1.23.12` এবং বর্তমান প্রিভিউ AI এজেন্ট এক্সটেনশন রিলিজ `azure.ai.agents` `0.1.18-preview` এর বিরুদ্ধে পর্যালোচিত হয়েছে। যদি আপনি পুরোনো AZD বিল্ডে থাকেন, আগে সেটি আপডেট করুন তারপর অনুশীলন চালিয়ে যেতে থাকুন।

## শেখার উদ্দেশ্য

এই অধ্যায় সম্পন্ন করার মাধ্যমে আপনি:
- প্রি-বিল্ট AZD টেমপ্লেট ব্যবহার করে AI অ্যাপ্লিকেশন মোতায়েন করতে পারবেন
- Microsoft Foundry এর AZD সঙ্গে ইন্টিগ্রেশন বুঝতে পারবেন
- সরঞ্জাম সহ AI এজেন্ট কনফিগার ও কাস্টমাইজ করতে পারবেন
- RAG (Retrieval-Augmented Generation) অ্যাপ্লিকেশন মোতায়েন করতে পারবেন

---

## 📚 পাঠসমূহ

| # | পাঠ | বর্ণনা | সময় |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Foundry পরিষেবাগুলির সাথে AZD সংযোগ | ৩০ মিনিট |
| 2 | [AI Agents Guide](agents.md) | সরঞ্জামসহ বুদ্ধিমান এজেন্ট মোতায়েন | ৪৫ মিনিট |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AI মডেল মোতায়েন ও কনফিগার করা | ৩০ মিনিট |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | হাতে-কলমে: আপনার AI সমাধান AZD-রেডি করুন | ৬০ মিনিট |

---

## 🚀 দ্রুত শুরু

```bash
# অপশন ১: RAG চ্যাট অ্যাপ্লিকেশন
azd init --template azure-search-openai-demo
azd up

# অপশন ২: এআই এজেন্টস
azd init --template get-started-with-ai-agents
azd up

# অপশন ৩: দ্রুত চ্যাট অ্যাপ্লিকেশন
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 নির্বাচিত AI টেমপ্লেটসমূহ

| টেমপ্লেট | বর্ণনা | পরিষেবা |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | উদ্ধৃতিসহ RAG চ্যাট | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | সরঞ্জামসহ AI এজেন্ট | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | মৌলিক AI চ্যাট | OpenAI + Container Apps |

---

## 💰 খরচ সচেতনতা

| পরিবেশ | আনুমানিক মাসিক খরচ |
|-------------|----------------------|
| ডেভেলপমেন্ট | $80-150 |
| স্টেজিং | $150-300 |
| প্রোডাকশন | $300-3,500+ |

**টিপ:** চার্জ এড়াতে পরীক্ষা শেষে `azd down` চালান।

---

## 🔗 নেভিগেশন

| দিক | অধ্যায় |
|-----------|---------|
| **পূর্ববর্তী** | [অধ্যায় 1: ফাউন্ডেশন](../chapter-01-foundation/README.md) |
| **পরবর্তী** | [অধ্যায় 3: কনফিগারেশন](../chapter-03-configuration/README.md) |
| **এলোমেলো নেভিগেশন** | [অধ্যায় 8: প্রোডাকশন প্যাটার্নস](../chapter-08-production/README.md) |

---

## 📖 সম্পর্কিত সম্পদসমূহ

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকারোক্তি**:  
এই নথি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। আমরা যথাসাধ্য সঠিকতার চেষ্টা করি, তবে স্বয়ংক্রিয় অনুবাদে ভুল বা অননুমানিকতা থাকতে পারে দয়া করে অবগত থাকুন। মূল নথিটি তার স্বাভাবিক ভাষায় কর্তৃপক্ষী উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের ক্ষেত্রে, পেশাদার মানব অনুবাদের সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে সৃষ্ট যে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->