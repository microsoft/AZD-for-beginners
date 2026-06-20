# 6. ইনফ্রাস্ট্রাকচার অপসারণ

!!! tip "এই মডিউলের শেষে আপনি সক্ষম হবেন"

    - [ ] রিসোর্স পরিষ্কার করা এবং খরচ ব্যবস্থাপনার গুরুত্ব বোঝা
    - [ ] নিরাপদে ইনফ্রাস্ট্রাকচার অপসারণ করার জন্য `azd down` ব্যবহার করা
    - [ ] প্রয়োজন হলে সফট-ডিলিটেড Azure AI সার্ভিসগুলি পুনরুদ্ধার করা
    - [ ] **Lab 6:** Azure রিসোর্সগুলি পরিষ্কার করুন এবং অপসারণ নিশ্চিত করুন

---

## বোনাস অনুশীলন

প্রকল্পটি অপসারণ করার আগে, কয়েক মিনিট নিন এবং কিছু খোলা অন্বেষণ করুন।

!!! info "এই অনুসন্ধান প্রম্পটগুলো চেষ্টা করুন"

    **GitHub Copilot দিয়ে পরীক্ষা-নিরীক্ষা করুন:**
    
    1. জিজ্ঞাসা করুন: `আমি মাল্টি-এজেন্ট পরিস্থিতির জন্য আর কোন AZD টেমপ্লেটগুলি চেষ্টা করতে পারি?`
    2. জিজ্ঞাসা করুন: `কিভাবে আমি একটি স্বাস্থ্যসেবা ব্যবহারের ক্ষেত্রে এজেন্ট নির্দেশাবলী কাস্টমাইজ করতে পারি?`
    3. জিজ্ঞাসা করুন: `কোন পরিবেশ ভেরিয়েবলগুলি খরচ অপ্টিমাইজেশন নিয়ন্ত্রণ করে?`
    
    **Azure পোর্টাল অন্বেষণ করুন:**
    
    1. আপনার ডিপ্লয়মেন্টের জন্য Application Insights মেট্রিক্স পর্যালোচনা করুন
    2. প্রদানকৃত রিসোর্সগুলোর জন্য খরচ বিশ্লেষণ পরীক্ষা করুন
    3. Microsoft Foundry পোর্টালের এজেন্ট প্লেগ্রাউন্ডটি আরেকবার অন্বেষণ করুন

---

## ইনফ্রা অপসারণ

1. ইনফ্রাস্ট্রাকচার সরানো এতই সহজ:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. The `--purge` flag ensures that it also purges soft-deleted Cognitive Service resources, thereby releasing quota held by these resources. Once complete you will see something like this:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Optional) If you now run `azd up` again, you will notice the gpt-4.1 model gets deployed since the environment variable was changed (and saved) in the local `.azure` folder. 

      মডেল ডিপ্লয়মেন্টগুলো **পূর্বে** এখানে:

      ![প্রাথমিক](../../../../../translated_images/bn/14-deploy-initial.30e4cf1c29b587bc.webp)

      এবং এটি **পরে**:
      ![নতুন](../../../../../translated_images/bn/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->