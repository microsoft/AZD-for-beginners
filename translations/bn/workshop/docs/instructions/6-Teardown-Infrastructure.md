# 6. পরিকাঠামো ভাঙ্গা

!!! tip "এই মডিউলের শেষে আপনি সক্ষম হবেন"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## অতিরিক্ত অনুশীলন

প্রকল্পটি ভেঙে ফেলার আগে, কিছু সময় নিয়ে মুক্তভাবে অন্বেষণ করুন।

!!! info "এই অনুসন্ধান প্রম্পটগুলি চেষ্টা করুন"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## অবকাঠামো বাতিল করা

!!! warning "যদি আপনি GA হোস্টেড-অ্যাজেন্ট অনুশীলনটিও সম্পন্ন করে থাকেন"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. অবকাঠামো ভাঙ্গা সহজ কাজ:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. নির্বাচিত পরিবেশ নিশ্চিত করুন এবং মুছে ফেলার জন্য সম্পদগুলি পর্যালোচনা করুন। এটি Azure সম্পদগুলি অপসারণ করে এবং ডেটা নষ্ট করতে পারে। এই শেখার ওয়ার্কফ্লোর জন্য নিশ্চিতকরণ প্রম্পট রাখুন। সম্পন্ন করার পরে আপনি দেখতে পাবেন এইরকম আউটপুট:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. পোর্টালে মুছে ফেলা যাচাই করুন এবং ডিপ্লয়ের সীমার বাইরে সম্পদ আছে কি না তা পরীক্ষা করুন। খরচ রিপোর্টিং এবং কোটার আপডেটগুলো বিলম্বিত হতে পারে। স্থানীয় `.azure` কনফিগারেশন তখনও থেকেই যাবে যতক্ষণ না আপনি স্পষ্টভাবে তা সরান।

1. `azd down --purge` অতিরিক্তভাবে সমর্থিত সফট-মুছে ফেলা সম্পদগুলির স্থায়ী মুছে ফেলার অনুরোধ করে। এটি শুধুমাত্র তখন ব্যবহার করুন যখন পুনরুদ্ধার প্রয়োজন না হয় এবং আপনি রিটেনশন/পার্জ-প্রটেকশন নীতিমালা বুঝেন। এটি তাৎক্ষণিক কোটার মুক্তি নিশ্চিত করে না।

1. পরিস্কার যাচাই করার জন্য পুনরায় ডিপ্লয় করবেন না। পরে ইচ্ছাকৃতভাবে `azd up` স্থানীয় ইনপুট ব্যবহার করে সম্পদ পুনরায় তৈরি করতে পারে এবং আবার চার্জ ধার্য করে। মডেল আপডেট সাধারণত সমর্থিত প্রোভিশনিং পরিবর্তন ব্যবহার করে, পরিকাঠামো ভাঙ্গা নয়।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->