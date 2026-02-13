# AI ডেভেলপারদের জন্য AZD কর্মশালা

> [!IMPORTANT]  
> **এই কর্মশালায় একটি ওয়ার্কশপ গাইড সংযুক্ত আছে যা আপনি আপনার লোকাল ব্রাউজারে প্রিভিউ করতে পারবেন। শুরু করতে, আপনাকে রিপোতে GitHub Codespaces চালু করতে হবে—তারপর একটি সক্রিয় VS Code টার্মিনাল দেখা পর্যন্ত অপেক্ষা করে টাইপ করুন:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **আপনি একটি পপ-আপ ডায়ালগ দেখতে পাবেন যা ব্রাউজারে প্রিভিউ পেজটি খুলতে বলবে।**

Welcome to the hands-on workshop for learning Azure Developer CLI (AZD) with a focus on AI application deployment. This workshop helps you gain an applied understanding of AZD templates in 3 steps:

1. **অন্বেষণ** - আপনার জন্য উপযুক্ত টেমপ্লেটটি খুঁজে নিন।
1. **ডিপ্লয়মেন্ট** - ডিপ্লয় করুন এবং এটি কাজ করছে কিনা যাচাই করুন
1. **কাস্টমাইজেশন** - এটি আপনার মতো করে সংশোধন ও পুনরাবৃত্তি করুন!

Over the course of this workshop, you will also be introduced to core developer tools and workflows, to help you streamline your end-to-end development journey.

| | | 
|:---|:---|
| **📚 Course Home**| [AZD নবাগতদের জন্য](../README.md)|
| **📖 ডকুমেন্টেশন** | [AI টেমপ্লেট দিয়ে শুরু করুন](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Templates** | [Microsoft Foundry টেমপ্লেট](https://ai.azure.com/templates) |
|**🚀 পরবর্তী ধাপ** | [চ্যালেঞ্জ নিন](../../../../workshop/docs) |
| | |

## কর্মশালা ওভারভিউ

**সময়কাল:** 3-4 ঘন্টা  
**স্তর:** শুরুকারী থেকে মধ্যম  
**প্রয়োজনীয়তা:** Azure, AI ধারণা, VS Code ও কমান্ড-লাইন টুলগুলোর সঙ্গে পরিচিতি।

This is a hands-on workshop where you learn by doing. Once you have completed the exercises, we recommend reviewing the AZD নবাগতদের জন্য পাঠ্যক্রমটি to continue your learning journey into Security and Productivity best practices.

| Time| Module  | Objective |
|:---|:---|:---|
| 15 mins | ভূমিকা | Set the stage, understand the goals |
| 30 mins | AI টেমপ্লেট নির্বাচন করুন | বিকল্পগুলো অন্বেষণ করে একটি স্টার্টার নির্বাচন করা | 
| 30 mins | AI টেমপ্লেট যাচাই | ডিফল্ট সলিউশনটি Azure-এ ডিপ্লয় করা |
| 30 mins | AI টেমপ্লেট বিশ্লেষণ | স্ট্রাকচার এবং কনফিগারেশন অন্বেষণ করা |
| 30 mins | AI টেমপ্লেট কনফিগার করুন | উপলব্ধ ফিচারগুলো সক্রিয় করে পরীক্ষা করা |
| 30 mins | AI টেমপ্লেট কাস্টমাইজ করুন | টেমপ্লেটটি আপনার প্রয়োজন অনুযায়ী অভিযোজিত করা |
| 30 mins | Teardown Infrastructure | রিসোর্স সাফ করা এবং মুক্তি দেওয়া |
| 15 mins | Wrap-Up & Next Steps | Learning resources, Workshop challenge |
| | |

## আপনি যা শিখবেন

Think of the AZD Template as a learning sandbox to explore various capabilities and tools for end-to-end development on Microsoft Foundry. By the end of this workshop, you should have an intuitive sense for various tools and concepts in this context.

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | টুলের কমান্ড এবং ওয়ার্কফ্লোগুলো বুঝুন |
| **AZD Templates**| প্রকল্পের কাঠামো এবং কনফিগ কিভাবে কাজ করে তা বুঝুন |
| **Azure AI Agent**| প্রোভিশন এবং Microsoft Foundry প্রকল্প ডিপ্লয় করা |
| **Azure AI Search**| এজেন্টদের মাধ্যমে কনটেক্সট ইঞ্জিনিয়ারিং সক্ষম করা |
| **Observability**| ট্রেসিং, মনিটরিং এবং মূল্যায়ন অন্বেষণ করা |
| **Red Teaming**| অ্যাডভারসারিয়াল টেস্টিং ও প্রতিরোধ ব্যবস্থা অন্বেষণ করা |
| | |

## কর্মশালা মডিউলসমূহ

Ready to get started? Navigate through the workshop modules:

- [মডিউল 1: AI টেমপ্লেট নির্বাচন করুন](instructions/1-Select-AI-Template.md)
- [মডিউল 2: AI টেমপ্লেট যাচাই](instructions/2-Validate-AI-Template.md) 
- [মডিউল 3: AI টেমপ্লেট বিশ্লেষণ](instructions/3-Deconstruct-AI-Template.md)
- [মডিউল 4: AI টেমপ্লেট কনফিগার](instructions/4-Configure-AI-Template.md)
- [মডিউল 5: AI টেমپ্লেট কাস্টমাইজ](instructions/5-Customize-AI-Template.md)
- [মডিউল 6: ইনফ্রাস্ট্রাকচার অপসারণ](instructions/6-Teardown-Infrastructure.md)
- [মডিউল 7: সারসংক্ষেপ ও পরবর্তী ধাপ](instructions/7-Wrap-up.md)

## Have feedback?

এই রিপোতে একটি ইস্যু পোস্ট করুন (ট্যাগ করুন `Workshop`) অথবা আমাদের [Discord](https://aka.ms/foundry/discord) এ যোগ দিন এবং আমাদের `#get-help` চ্যানেলে পোস্ট করুন

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকৃতি:
এই নথিটি AI অনুবাদ পরিষেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাযথতার চেষ্টা করলেও স্বয়ংক্রিয় অনুবাদে ত্রুটি বা ভুল থাকতে পারে তা অনুগ্রহ করে মনোযোগ দিন। মূল নথিটি তার নিজ ভাষায়ই কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদের পরামর্শ দেওয়া হয়। এই অনুবাদ ব্যবহারের ফলে যে কোনো ভুলবোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->