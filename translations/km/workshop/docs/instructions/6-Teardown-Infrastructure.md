# 6. បំបាក់ហេដ្ឋារចនាសម្ព័ន្ធ

!!! tip "នៅចុងម៉ូឌុលនេះ អ្នកនឹងអាច"

    - [ ] យល់ពីសារៈសំខាន់នៃការសម្អាតធនធាន និងការគ្រប់គ្រងថ្លៃចំណាយ
    - [ ] ប្រើ `azd down` ដើម្បីដកធនធានហេដ្ឋារចនាសម្ព័ន្ធយ៉ាងปลอดภัย
    - [ ] ស្តារឡើងវិញសេវា Azure AI ដែលបានលុបជាស្រាល (soft-deleted) ប្រសិនបើចាំបាច់
    - [ ] **Lab 6:** សម្អាតធនធាន Azure និងផ្ទៀងផ្ទាត់ការដកចេញ

---

## លំហាត់បន្ថែម

មុនពេលយើងបំបាក់គម្រោង សូមចំណាយពេលប៉ុន្មាននាទីសម្រាប់ការស្រាវជ្រាវផ្នែកទូលំទូលាយ។

!!! info "សាកល្បងសំណើស្វែងយល់ទាំងនេះ"

    **សូម្បីសាកល្បងជាមួយ GitHub Copilot:**
    
    1. សួរ: `What other AZD templates could I try for multi-agent scenarios?`
    2. សួរ: `How can I customize the agent instructions for a healthcare use case?`
    3. សួរ: `What environment variables control cost optimization?`
    
    **ស្វែងរកផតថល Azure:**
    
    1. ពិនិត្យមើលគន្លងម៉េត្រីក Application Insights សម្រាប់ការដាក់បញ្ចូលរបស់អ្នក
    2. ពិនិត្យវិភាគថ្លៃចំណាយសម្រាប់ធនធានដែលបានផ្តល់
    3. ស្វែងយល់កន្លែងលេង agent នៅក្នុងផតថល Microsoft Foundry ម្តងទៀត

---

## ដកចេញហេដ្ឋារចនាសម្ព័ន្ធ

1. ការដកចេញហេដ្ឋារចនាសម្ព័ន្ធងាយដូចជា៖
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. ទង់ហូប `--purge` ធានាថាវាក៏នឹងលុបធនធាន Cognitive Service ដែលបានលុបប្រភេទស្រាល (soft-deleted) ផងដែរ ដើម្បីដោះលែង quota ដែលត្រូវបានកាន់ដោយធនធានទាំងនេះ។ បន្ទាប់ពីបញ្ចប់ អ្នកនឹងឃើញអ្វីមួយដូចខាងក្រោម៖
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (ជាជម្រើស) ប្រសិនបើអ្នកឥឡូវនេះរត់ `azd up` ម្តងទៀត អ្នកនឹងសង្កេតឃើញម៉ូឌែល gpt-4.1 ត្រូវបានដាក់បញ្ចូល ព្រោះអថេរស្ថាប័នបរិយាកាសត្រូវបានផ្លាស់ប្តូរ (និងបានរក្សាទុក) នៅក្នុងថត `.azure` មូលដ្ឋាន។ 

      នេះគឺជា​ការ​ដាក់បញ្ចូល​ម៉ូឌែល **មុន**:

      ![ដំបូង](../../../../../translated_images/km/14-deploy-initial.30e4cf1c29b587bc.webp)

      ហើយនេះ​គឺ **បន្ទាប់**:
      ![ថ្មី](../../../../../translated_images/km/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->