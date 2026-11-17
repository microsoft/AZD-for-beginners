# 6. រំលះហេដ្ឋារចនាសម្ព័ន្ធ

!!! tip "នៅចុង module នេះ អ្នកនឹងអាច"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## អនុវត្តផ្នែកបន្ថែម

មុនពេលយើងរំលះគម្រោង សូមចំណាយពេលប៉ុន្មាននាទីស្វែងរកជាវិជ្ជមាន។

!!! info "ព្យាយាមនូវសំណួរស្វែងរកទាំងនេះ"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## ដេប្រើហេដ្ឋារចនាសម្ព័ន្ធ

!!! warning "បើអ្នកបានបញ្ចប់លំហាត់ហ្វឹកហ្វឺនកំរិត hosted-agent GA ផងដែរ"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. ការរំលះហេដ្ឋារចនាសម្ព័ន្ធគឺសាមញ្ញដូចជា៖
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. បញ្ជាក់បរិយាកាសដែលបានជ្រើសរើស និងពិនិត្យធនធានដែលត្រូវលុប។ វានឹងលុបធនធាន Azure ហើយអាចបំផ្លាញទិន្នន័យ។ រក្សាការបញ្ជាក់សម្រាប់វគ្គរៀននេះ។ បន្ទាប់ពីបញ្ចប់ អ្នកនឹងឃើញលទ្ធផលដូចខាងក្រោម៖
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. ពិនិត្យការលុបចោលនៅក្នុងច្រកចេញ និងពិនិត្យធនធាននៅក្រៅដែនកំណត់នៃការដាក់ឲ្យដំណើរការ។ របាយការណ៍ថ្លៃក៏ដូចជាបច្ចុប្បន្នភាពកម្រិតអាចយឺត៖ ការកំណត់តម្លៃក្នុង `.azure` នៅតែមាន លុះត្រាតែអ្នកលុបវាដោយ explisit។

1. `azd down --purge` ស្នើសុំការលុបចោលបន្ថែមទៀត សម្រាប់ធនធានដែលបានលុបសោតានិងគាំទ្រ។ ប្រើវា ពេលដែលមិនចាំបាច់ត្រឡប់មកវិញ ហើយអ្នកបានយល់ពីគោលការណ៍រក្សាទុក/ការការពារការលុប។ វាមិនធានាការបញ្ចេញកម្រិតភ្លាមៗ intequota ។

1. កុំចាប់ផ្តើមដាក់ឲ្យដំណើរការឡើងវិញ ដើម្បីបញ្ជាក់ការសម្អាត។ `azd up` ដែលមានគោលបំណងនៅក្រោយអាចបង្កើតធនធានឡើងវិញដោយប្រើបញ្ចូលក្នុងបណ្តោយនៅក្រោយ និងបង្កើតការចំណាយម្តងទៀត។ ការអាប់ដេតម៉ូដែលជាទូទៅប្រើប្រាស់ការផ្លាស់ប្ដូរការផ្គត់ផ្គង់ដែលគាំទ្រ មិនមែនបំផ្លាញទេ។

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->