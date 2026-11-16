# 6. បំលែងបច្ចេកវិទ្យា

!!! tip "នៅចុង Module នេះ អ្នកនឹងអាចធ្វើបាន"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## លំហាត់បន្ថែម

មុនពេលយើងបំលែងគំរោង សូមចំណាយពេលប៉ុន្មាននាទី ដើម្បីធ្វើការស្វែងយល់បើកចំហ។

!!! info "សាកល្បងសំណួរស្វែងរកទាំងនេះ"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## បំលែងបច្ចេកវិទ្យា Infra

1. ការបំលែងបច្ចេកវិទ្យាគឺងាយដូចជា ៖
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. បញ្ជាក់បរិយាកាសដែលបានជ្រើសរើស ហើយពិនិត្យមើលធនធានដែលត្រូវលុបចោល។ វាប្រមូលលុបធនធាន Azure ហើយអាចបំផ្លាញទិន្នន័យ។ រក្សាទុកសំណើបញ្ជាក់នេះសម្រាប់ដំណើរការសិក្សានេះ។ បន្ទាប់ពីបញ្ចប់ អ្នកនឹងឃើញចេញតួអក្សរដូចជា៖
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. បញ្ជាក់ការលុបនៅក្នុងកំពូលហើយពិនិត្យធនធាននៅក្រៅដែនកំណត់នៃការដំឡើង។ ការរាយការណ៍ថ្លៃឈប់ក្រោយ និងបច្ចុប្បន្នភាពទំហំសមាសភាគអាចយឺតយ៉ាវ។ ការកំណត់រចនាសម្ព័ន្ធក្នុងស្រុក `.azure` នៅតែមានរហូត មិនថាអ្នកលុបវាឱ្យប្រាកដ។

1. `azd down --purge` សូមស្នើរសុំការលុបឯកត្តិរឹតតែធនធានដែលបានស្នើសុំលុបភាគច្រើន។ ប្រើវា តែប៉ុណ្ណោះ នៅពេលដែលមិនត្រូវការសម្រាប់ការស្ដារឡើងវិញ ហើយអ្នកយល់ពីគោលការណ៍រក្សាទុក/ការការពារការលុប។ វាមិនធានាថាទំហំសមាសភាគនឹងបានបញ្ចេញភ្លាមភ្លោះឡើយ។

1. កុំបញ្ចូលឡើងវិញត្រឹមតែដើម្បីពិនិត្យការបរិភាពបរិសុទ្ធ។ នៅពេលក្រោយ ផ្នែក `azd up` មានគោលបំណង អាចបង្កើតធនធានឡើងវិញដោយប្រើការបញ្ចូលសំណូលនៅក្នុងស្រុកដែលនៅសល់ ហើយបង្ករប្រាក់ចំណាយម្តងទៀត។ ការអាប់ដេតគំរូធម្មតាមានការប្រែប្រួលក្នុងការផ្គត់ផ្គង់ដែលគាំទ្រ មិនមែនការបំលែងបច្ចេកវិទ្យានោះទេ។

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->