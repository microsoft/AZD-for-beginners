# Chapter 2: এআই-প্রথম উন্নয়ন

**📚 Course**: [AZD নবীনদের জন্য](../../README.md) | **⏱️ সময়কাল**: 1-2 ঘন্টা | **⭐ কঠিনতা**: মধ্যবর্তী

---

## সংক্ষিপ্ত বিবরণ

এই অধ্যায়টি Azure Developer CLI এবং Microsoft Foundry সার্ভিস ব্যবহার করে এআই-চালিত অ্যাপ্লিকেশন ডিপ্লয় করার উপর কেন্দ্রীভূত। সরল এআই চ্যাট অ্যাপ থেকে টুলসহ বুদ্ধিমান এজেন্ট পর্যন্ত।

## শেখার লক্ষ্য

এই অধ্যায় সম্পন্ন করে আপনি:
- পূর্বনির্মিত AZD টেম্পলেট ব্যবহার করে এআই অ্যাপ্লিকেশন ডিপ্লয় করুন
- AZD-এর সাথে Microsoft Foundry ইন্টিগ্রেশন বুঝুন
- টুলস ব্যবহার করে এআই এজেন্ট কনফিগার ও কাস্টমাইজ করুন
- RAG (Retrieval-Augmented Generation) অ্যাপ্লিকেশন ডিপ্লয় করুন

---

## 📚 পাঠ্যসমূহ

| # | পাঠ | বিবরণ | সময় |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD-কে Foundry সার্ভিসগুলোর সাথে সংযুক্ত করুন | 30 মিনিট |
| 2 | [AI Agents Guide](agents.md) | টুলস সহ বুদ্ধিমান এজেন্ট ডিপ্লয় করুন | 45 মিনিট |
| 3 | [AI Model Deployment](ai-model-deployment.md) | এআই মডেল ডিপ্লয় ও কনফিগার করুন | 30 মিনিট |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | হ্যান্ডস-অন: আপনার এআই সলিউশনকে AZD-র জন্য প্রস্তুত করুন | 60 মিনিট |

---

## 🚀 দ্রুত শুরু

```bash
# বিকল্প 1: RAG চ্যাট অ্যাপ্লিকেশন
azd init --template azure-search-openai-demo
azd up

# বিকল্প 2: এআই এজেন্টস
azd init --template get-started-with-ai-agents
azd up

# বিকল্প 3: দ্রুত চ্যাট অ্যাপ
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 নির্বাচিত এআই টেম্পলেট

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | উদ্ধৃতিসহ RAG চ্যাট | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | টুলসসহ এআই এজেন্ট | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | বেসিক এআই চ্যাট | OpenAI + Container Apps |

---

## 💰 খরচ সচেতনতা

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**টিপ:** পরীক্ষা শেষ হলে চার্জ এড়াতে `azd down` চালান।

---

## 🔗 নেভিগেশন

| Direction | Chapter |
|-----------|---------|
| **পূর্ববর্তী** | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| **পরবর্তী** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **সরাসরি যান** | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 সংশ্লিষ্ট সম্পদ

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকৃতি:
এই নথিটি AI অনুবাদ সেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। যদিও আমরা সঠিকতার লক্ষ্যে কাজ করি, অনুগ্রহপূর্বক ধারণা রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসম্পূর্ণতা থাকতে পারে। মূল ভাষায় থাকা নথিকেই কর্তৃত্বসম্পন্ন উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ পরামর্শযোগ্য। এই অনুবাদের ব্যবহার থেকে উদ্ভূত কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->