# ৭. সমাপনী & পরবর্তী ধাপসমূহ

!!! tip "মূল গ্রহণযোগ্য বার্তাসমূহ হল"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## ১. আপনি কি অর্জন করলেন

অভিনন্দন! এই কর্মশালায়, আপনি সফলভাবে:

| মডিউল | অর্জন |
|:---|:---|
| **মডিউল ১** | Azure Developer CLI আবিষ্কার এবং একটি AI টেমপ্লেট নির্বাচন করেছেন |
| **মডিউল ২** | একটি পূর্ণাঙ্গ AI এজেন্ট সমাধান স্থাপন ও যাচাই করেছেন |
| **মডিউল ৩** | টেমপ্লেটের স্থাপত্য বিশ্লেষণ করেছেন |
| **মডিউল ৪** | `azure.yaml` কনফিগারেশন এবং লাইফসাইকেল হুক অন্বেষণ করেছেন |
| **মডিউল ৫** | আপনার নিজস্ব ব্যবহারের জন্য টেমপ্লেট কাস্টমাইজ করেছেন |
| **মডিউল ৬** | নিরাপদে অবকাঠামো নিক্ষেপ এবং সম্পদ পরিচালনা করেছেন |

---

## ২. প্রধান ধারণাসমূহ আয়ত্ত করেছেন

### Azure Developer CLI (azd)
- `azd init` - টেমপ্লেট থেকে প্রোজেক্ট ইনিশিয়ালাইজ করুন
- `azd up` - এক কমান্ডে প্রোভিজন ও ডিপ্লয় করুন
- `azd env` - পরিবেশ পরিবর্তনশীল পরিচালনা করুন
- `azd down` - সম্পদগুলো নিরাপদে পরিস্কার করুন

### AZD টেমপ্লেট কাঠামো
- `azure.yaml` - কনফিগারেশন ও ডিপ্লয়মেন্ট হুক
- `infra/` - Bicep অবকাঠামো-যেমন-কোড
- `src/` - অ্যাপ্লিকেশন সোর্স কোড
- `scripts/` - অটোমেশন এবং সেটআপ স্ক্রিপ্ট

### Microsoft Foundry সক্ষমতা
- বুদ্ধিমান সহকারী জন্য AI এজেন্ট সেবা
- জ্ঞান পুনরুদ্ধারের জন্য ফাইল সার্চ এবং Azure AI সার্চ
- ইনবিল্ট ট্রেসিং, মনিটরিং, এবং মূল্যায়ন
- AI নিরাপত্তা যাচাইয়ের জন্য রেড টিমিং

---

## ৩. আপনার শেখার যাত্রা চালিয়ে যান

### পরামর্শকৃত পরবর্তী ধাপসমূহ

| পথ | সম্পদ | সময় |
|:---|:---|:---|
| **সম্পূর্ণ কোর্স** | [AZD for Beginners Curriculum](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | স্ব-গতি |
| **অন্য একটি টেমপ্লেট চেষ্টা করুন** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | ১-২ ঘণ্টা |
| **গভীর অন্বেষণ** | [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | চলমান |
| **কমিউনিটি** | [Azure Discord](https://aka.ms/foundry/discord) | আজই যোগ দিন! |

### পরবর্তী চেষ্টা করার জন্য প্রস্তাবিত টেমপ্লেটসমূহ

১. **[AI চ্যাট দিয়ে শুরু করুন](https://github.com/Azure-Samples/get-started-with-ai-chat)** - আপনার ডেটার সাথে বেসিক চ্যাট
২. **[Azure Search OpenAI ডেমো](https://github.com/Azure-Samples/azure-search-openai-demo)** - উন্নত RAG প্যাটার্নসমূহ
৩. **[Contoso চ্যাট](https://github.com/Azure-Samples/contoso-chat)** - এন্টারপ্রাইজ রিটেইল সেন্ট্রিক সিচুয়েশন

---

## ৪. কর্মশালা চ্যালেঞ্জ

আপনার দক্ষতা পরীক্ষা করতে প্রস্তুত? এই চ্যালেঞ্জগুলো চেষ্টা করুন:

| চ্যালেঞ্জ | বর্ণনা | দুর্বলতা |
|:---|:---|:---|
| **১. মাল্টি-এজেন্ট সিচুয়েশন** | একটি ভিন্ন শিল্প (যেমন, স্বাস্থ্যসেবা, অর্থ) জন্য ডিপ্লয় এবং কাস্টমাইজ করুন | ⭐⭐ |
| **২. কাস্টম নলেজ বেস** | নিজের ডেটা ফাইল যোগ করুন এবং একটি কাস্টম সার্চ ইনডেক্স তৈরি করুন | ⭐⭐⭐ |
| **৩. প্রোডাকশন ডিপ্লয়মেন্ট** | `azd pipeline config` ব্যবহার করে GitHub Actions এর সাথে CI/CD সেট আপ করুন | ⭐⭐⭐⭐ |

---

## ৫. আপনার প্রতিক্রিয়া শেয়ার করুন

আপনার প্রতিক্রিয়া আমাদের এই কর্মশালা উন্নত করতে সাহায্য করে!

- **GitHub Issues**: [প্রতিক্রিয়া পোস্ট করুন](https://github.com/microsoft/azd-for-beginners/issues) - ট্যাগ করুন `Workshop`
- **Discord**: যোগ দিন [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - পোস্ট করুন `#get-help`
- **অবদান**: পুল রিকোয়েস্ট পাঠিয়ে কর্মশালা উন্নত করতে সাহায্য করুন!

---

## ধন্যবাদ! 🎉

AZD for AI Developers Workshop সম্পন্ন করার জন্য আপনাকে ধন্যবাদ। আমরা আশা করি এই অভিজ্ঞতা আপনাকে Azure-এ AI অ্যাপ্লিকেশন তৈরী ও ডিপ্লয় করার দক্ষতা ও আত্মবিশ্বাস দিয়েছে।

**তৈরি করতে থাকুন, শেখা চালিয়ে যান, এবং Azure AI ডেভেলপার কমিউনিটিতে স্বাগতম!**

---

| | |
|:---|:---|
| **📚 কোর্স হোম** | [AZD For Beginners](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 ডকুমেন্টেশন** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI টেমপ্লেট** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 কমিউনিটি** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->