# 6. অবকাঠামো অপসারণ

!!! tip "এই মডিউলের শেষে আপনি সক্ষম হবেন"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## বোনাস ব্যায়াম

প্রকল্পটি অপসারণ করার আগে, কিছু সময় নিয়ে কিছু মুক্ত অনুসন্ধান করুন।

!!! info "এই অনুসন্ধান প্রম্পটগুলো চেষ্টা করুন"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## অবকাঠামো অপসারণ

1. অবকাঠামো অপসারণ করা এত সহজ:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. নির্বাচিত পরিবেশ নিশ্চিত করুন এবং মুছে ফেলার জন্য সম্পদগুলি পর্যালোচনা করুন। এটি Azure সম্পদ অপসারণ করে এবং ডেটা ধ্বংস করতে পারে। এই শিখন কার্যপ্রবাহের জন্য নিশ্চিতকরণ প্রম্পট রাখুন। সম্পন্ন হলে আপনি নিম্নলিখিত আউটপুট দেখতে পাবেন: 
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. পোর্টালে মুছে ফেলা নিশ্চিত করুন এবং ডিপ্লয়মেন্টের আওতায় থাকা সম্পদগুলি পরীক্ষা করুন। খরচ রিপোর্টিং এবং কোটার আপডেট দেরি হতে পারে। স্থানীয় `.azure` কনফিগারেশন থাকে যতক্ষণ না আপনি এটি স্পষ্টভাবে সরান।

1. `azd down --purge` অতিরিক্তভাবে সমর্থিত সফট-ডিলিটেড সম্পদের স্থায়ী অপসারণ অনুরোধ করে। শুধুমাত্র পুনরুদ্ধার প্রয়োজন না হলে এবং আপনি সংরক্ষণ/পিউর্জ-প্রটেকশন নীতি বুঝলে এটি ব্যবহার করুন। এটি তাৎক্ষণিক কোটার মুক্তির নিশ্চয়তা দেয় না।

1. শুধু পরিষ্কার করার নিশ্চয়তার জন্য পুনরায় ডিপ্লয় করবেন না। পরে ইচ্ছাকৃত `azd up` অবশিষ্ট স্থানীয় ইনপুট ব্যবহার করে সম্পদ পুনরায় তৈরি করতে পারে এবং আবার চার্জ ধার্য হয়। মডেল আপডেট সাধারণত সমর্থিত প্রোভিশনিং পরিবর্তন ব্যবহার করে, অপসারণ নয়।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->