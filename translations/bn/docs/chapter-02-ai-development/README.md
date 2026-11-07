# অধ্যায় ২: AI-প্রথম উন্নয়ন

**📚 কোর্স**: [শুরুতেই AZD](../../README.md) | **⏱️ সময়কাল**: ৪-৫ ঘণ্টা ওয়ার্কশপ সহ | **⭐ জটিলতা**: মধ্যবর্তী

---

## পর্যালোচনা

এই অধ্যায়টি Azure Developer CLI এবং Microsoft Foundry পরিষেবাদি ব্যবহার করে AI-চালিত অ্যাপ্লিকেশন স্থাপনের উপর মনোযোগ দেয়। সাধারণ AI চ্যাট অ্যাপ থেকে টুলস সহ বুদ্ধিমান এজেন্ট পর্যন্ত।

> **রিলিজ পর্যালোচনা (২০২৬-১১-০৪):** AI CLI নির্দেশিকা প্রকাশিত `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, এবং `azure.ai.evaluations` `1.0.0-beta.2` ডকুমেন্টেশন/উৎসের বিরুদ্ধে পরীক্ষা করা হয়েছে। সমন্বিত ওয়ার্কফ্লোর জন্য `azd >= 1.37.0` ব্যবহার করুন। মূল্যায়নগুলি এখন পৃথক `azd ai eval` নেমস্পেস ব্যবহার করে; দেখুন [রিলিজ পরিবর্তন এবং স্থানান্তর নির্দেশিকা](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes)। এটি সরাসরি স্থাপনের যাচাই নয়।

## শেখার উদ্দেশ্যসমূহ

এই অধ্যায় সম্পন্ন করে আপনি পারবেন:
- পূর্বনির্মিত AZD টেমপ্লেট ব্যবহার করে AI অ্যাপ্লিকেশন স্থাপন করা
- Microsoft Foundry এর সাথে AZD ইন্টিগ্রেশন বোঝা
- টুলস সহ AI এজেন্ট কনফিগার ও কাস্টোমাইজ করা
- RAG (রিট্রিভাল-অগমেন্টেড জেনারেশন) অ্যাপ্লিকেশন স্থাপন করা

---

## 📚 পাঠসমূহ

| # | পাঠ | বিবরণ | সময় |
|---|--------|-------------|------|
| ১ | [Microsoft Foundry ইন্টিগ্রেশন](microsoft-foundry-integration.md) | Foundry পরিষেবার সাথে AZD সংযোগ | ৩০ মিনিট |
| ২ | [AI এজেন্টস গাইড](agents.md) | টুলস সহ বুদ্ধিমান এজেন্ট স্থাপন | ৪৫ মিনিট |
| ৩ | [AI মডেল স্থাপনা](ai-model-deployment.md) | AI মডেল স্থাপন ও কনফিগার করা | ৩০ মিনিট |
| ৪ | [AI ওয়ার্কশপ ল্যাব](ai-workshop-lab.md) | হাতে কলম: একটি টেমপ্লেট অনুসন্ধান ও রূপান্তরের পরিকল্পনা | ২-৩ ঘণ্টা |

---

## 🚀 দ্রুত শুরু

নতুন খালি ডিরেক্টরিতে একটি অপশন বেছে নিন। শেষের `.` বর্তমান ডিরেক্টরি আরম্ভ করে; অন্যথায় AZD একটি সাবডিরেক্টরি তৈরি করতে পারে আপনার শেলের কর্মরত ডিরেক্টরি পরিবর্তন না করে।

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 নির্বাচিত AI টেমপ্লেট

| টেমপ্লেট | বিবরণ | পরিষেবা |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | উদ্ধৃতি সহ RAG চ্যাট | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | টুলস সহ AI এজেন্ট | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | মৌলিক AI চ্যাট | OpenAI + Container Apps |

---

## 💰 খরচ সচেতনতা

এগুলো উদাহরণস্বরূপ পরিসর, কোট বা সর্বোচ্চ সীমা নয়; মডেল ট্রাফিক, সার্চ/কম্পিউট SKUs, অঞ্চল এবং ঐচ্ছিক বৈশিষ্ট্যগুলি এগুলো ছাড়িয়ে যেতে পারে। আপনি যে নমুনা নির্বাচন করেছেন তার বর্তমান মূল্য নির্ধারণ নির্দেশিকা পর্যালোচনা করুন সরবরাহের আগে।

| পরিবেশ | মাসিক আনুমানিক খরচ |
|-------------|----------------------|
| উন্নয়ন | $৮০-১৫০ |
| স্টেজিং | $১৫০-৩০০ |
| উৎপাদন | $৩০০-৩,৫০০+ |

**টিপ:** চার্জ এড়াতে পরীক্ষা শেষে `azd down` চালান।

---

## 🔗 নেভিগেশন

| দিকনির্দেশ | অধ্যায় |
|-----------|---------|
| **পূর্ববর্তী** | [অধ্যায় ১: ভিত্তি](../chapter-01-foundation/README.md) |
| **পরবর্তী** | [অধ্যায় ৩: কনফিগারেশন](../chapter-03-configuration/README.md) |
| **এড়িয়ে যান** | [অধ্যায় ৮: উৎপাদন প্যাটার্ন](../chapter-08-production/README.md) |

---

## 📖 সম্পর্কিত সম্পদসমূহ

- [AI সমস্যা সমাধান](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [উৎপাদন AI অনুশীলন](../chapter-08-production/production-ai-practices.md)
- [অ্যাপ্লিকেশন ইনসাইটস](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->