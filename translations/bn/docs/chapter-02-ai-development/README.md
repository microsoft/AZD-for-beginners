# অধ্যায় ২: AI-প্রথম উন্নয়ন

**📚 কোর্স**: [AZD For Beginners](../../README.md) | **⏱️ সময়কাল**: ১-২ ঘন্টা | **⭐ জটিলতা**: মধ্যবর্তী

---

## সারাংশ

এই অধ্যায়টি Azure Developer CLI এবং Microsoft Foundry সেবাগুলো ব্যবহার করে AI-চালিত অ্যাপ্লিকেশন ডিপ্লয়মেন্টে মনোযোগ দিয়ে তৈরি। সাধারণ AI চ্যাট অ্যাপ থেকে টুলস সহ বুদ্ধিমান এজেন্ট পর্যন্ত।

> **যাচাইকরণ নোট (২০২৬-০৭-১৩):** এই অধ্যায়ে কমান্ড ফ্লো এবং এক্সটেনশন নির্দেশিকা `azd` `1.27.1` এবং বর্তমান প্রিভিউ AI এজেন্ট এক্সটেনশন রিলিজ `azure.ai.agents` `1.0.0-beta.5` এর সঙ্গে পর্যালোচনা করা হয়েছে। যদি আপনার AZD এর পুরানো বিল্ড থাকে, তাহলে প্রথমে আপডেট করুন এবং তারপর অনুশীলন চালিয়ে যান।

## শেখার লক্ষ্যসমূহ

এই অধ্যায় সম্পন্ন করার মাধ্যমে, আপনি:
- প্রি-নির্মিত AZD টেম্পলেট ব্যবহার করে AI অ্যাপ্লিকেশন ডিপ্লয় করবেন
- AZD সঙ্গে Microsoft Foundry ইন্টিগ্রেশন বুঝবেন
- টুলস দিয়ে AI এজেন্টদের কনফিগার এবং কাস্টমাইজ করবেন
- RAG (রিট্রিভ্যাল-অগমেন্টেড জেনারেশন) অ্যাপ্লিকেশন ডিপ্লয় করবেন

---

## 📚 পাঠসমূহ

| # | পাঠ | বর্ণনা | সময় |
|---|--------|-------------|------|
| ১ | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Foundry সেবাগুলোর সাথে AZD সংযোগ | ৩০ মিনিট |
| ২ | [AI Agents Guide](agents.md) | টুলস সহ বুদ্ধিমান এজেন্ট ডিপ্লয়মেন্ট | ৪৫ মিনিট |
| ৩ | [AI Model Deployment](ai-model-deployment.md) | AI মডেল ডিপ্লয় এবং কনফিগার করা | ৩০ মিনিট |
| ৪ | [AI Workshop Lab](ai-workshop-lab.md) | হাতে-কলমে: আপনার AI সমাধান AZD-রেডি করুন | ৬০ মিনিট |

---

## 🚀 দ্রুত শুরু

```bash
# অপশন ১: RAG চ্যাট অ্যাপ্লিকেশন
azd init --template azure-search-openai-demo
azd up

# অপশন ২: AI এজেন্টস
azd init --template get-started-with-ai-agents
azd up

# অপশন ৩: দ্রুত চ্যাট অ্যাপ্লিকেশন
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 নির্বাচিত AI টেম্পলেটসমূহ

| টেম্পলেট | বর্ণনা | সেবা |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | উদ্ধৃতিসহ RAG চ্যাট | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | টুলস সহ AI এজেন্ট | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | মৌলিক AI চ্যাট | OpenAI + Container Apps |

---

## 💰 ব্যয় সচেতনতা

| পরিবেশ | অনুমানকৃত মাসিক ব্যয় |
|-------------|----------------------|
| ডেভেলপমেন্ট | $৮০-১৫০ |
| স্টেজিং | $১৫০-৩০০ |
| প্রোডাকশন | $৩০০-৩,৫০০+ |

**পরামর্শ:** পরীক্ষার পর `azd down` চালান যাতে চার্জ না লাগে।

---

## 🔗 ন্যাভিগেশন

| দিকনির্দেশ | অধ্যায় |
|-----------|---------|
| **আগের** | [অধ্যায় ১: ভিত্তি](../chapter-01-foundation/README.md) |
| **পরের** | [অধ্যায় ৩: কনফিগারেশন](../chapter-03-configuration/README.md) |
| **এড়িয়ে যান** | [অধ্যায় ৮: প্রোডাকশন প্যাটার্ন](../chapter-08-production/README.md) |

---

## 📖 সম্পর্কিত সম্পদসমূহ

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->