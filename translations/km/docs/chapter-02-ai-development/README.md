# មេរៀនទី ២៖ ការអភិវឌ្ឍ AI ជាប្រភេទទីមួយ

**📚 មុខវិជ្ជា**៖ [AZD សម្រាប់អ្នកដឹកនាំថ្មី](../../README.md) | **⏱️ រយៈពេល**៖ ៤-៥ ម៉ោងរួមមានសិក្ខាសាលា | **⭐ ដឺក្រេស្មុគស្មាញ**៖ ចំណាត់ថ្នាក់មធ្យម

---

## ទិដ្ឋភាពទូទៅ

មេរៀននេះផ្តោតសំខាន់លើការតំឡើងកម្មវិធីដែលបញ្ចូល AI ដំណើរការជាមួយ Azure Developer CLI និងសេវាកម្ម Microsoft Foundry។ ចាប់ពីកម្មវិធី AI ជជែកធម្មតាទៅដល់ភ្នាក់ងារច្បាស់លាស់ដែលមានឧបករណ៍ជំនួយ។

> **ប្រាប់ស្តីពី Foundry GA (09-11-2026):** កញ្ចប់ `microsoft.foundry` ១.០ គឺ [មានស្រាប់ទូទៅ](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/)។ ប្រើ `azd >= 1.37.0`; ការវាយតម្លៃនៅតែមិនមានការដំឡើងបញ្ចូលជាមួយ។ សេវាកម្ម [hosted-agent walkthrough](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) ពិពណ៌នាពីការប៉ាន់ប្រមាណ Agent Inspector ជាមូលដ្ឋាន និងការតំឡើងកូដពីចម្ងាយ។ នេះជាការត្រួតពិនិត្យឯកសារ មិនមែនត្រឹមតែបញ្ជាក់ការតំឡើងផ្ទាល់ទេ។ អ្នកអាចជ្រើសមើលមុខងារឆសពិសេសៗបាន។

## គោលបំណងរៀន

នៅពេលបញ្ចប់មេរៀននេះ អ្នកនឹងអាច:
- តំឡើងកម្មវិធី AI ដោយប្រើស្លាក AZD រួចរាល់
- យល់ដឹងពីការសម្របសម្រួល Microsoft Foundry ជាមួយ AZD
- ដំឡើងកញ្ចប់ GA និងសាកល្បង hosted agent នៅលើកុំព្យូទ័រផ្ទាល់មុនចេញផ្សាយទៅ Foundry
- ពិនិត្យ `azure.yaml`, ឯកសារវាយតម្លៃ, និងការសម្អាតគម្រោងថ្មីប្រៀបធៀបនឹងដែលបានប្រើវិញ
- កំណត់រចនាសម្ព័ន្ធ និងប្តូរផលិតភាពភ្នាក់ងារ AI ជាមួយឧបករណ៍
- តំឡើងកម្មវិធី RAG (Retrieval-Augmented Generation)

---

## 📚 មេរៀន

| ល.រ | មេរៀន | ពិពណ៌នា | ពេលវេលា |
|---|--------|-------------|------|
| ១ | [ការសម្របសម្រួល Microsoft Foundry](microsoft-foundry-integration.md) | កញ្ចប់ GA, hosted-agent local-to-cloud workflow, និងការវាយតម្លៃ | ៦០ នាទី |
| ២ | [មគ្គុទេសក៍ភ្នាក់ងារ AI](agents.md) | តំឡើងភ្នាក់ងារច្បាស់លាស់ជាមួយឧបករណ៍ | ៤៥ នាទី |
| ៣ | [ការតំឡើងម៉ូឌែល AI](ai-model-deployment.md) | តំឡើង និងកំណត់រចនាសម្ព័ន្ធម៉ូឌែល AI | ៣០ នាទី |
| ៤ | [មន្ទីរសិក្សាសិក្សា AI](ai-workshop-lab.md) | ប្រើប្រាស់ផ្ទាល់៖ ជ្រោមជ្រែងលើស្លាកនិងងកផែនការផ្ទេរ | ២-៣ ម៉ោង |

---

## 🚀 ចាប់ផ្តើមយ៉ាងរហ័ស

ជ្រើសរើសជំរើសមួយនៅក្នុងថតថ្មីទទេ។ កូដក្រោយ `.` នឹងផ្តើមថតបច្ចុប្បន្ន; បើមិនដូច្នោះ AZD អាចបង្កើតថតរងមួយបានដោយមិនផ្លាស់ប្តូរទីតាំងកំណត់របស់you shell ។

សម្រាប់ **ផ្លូវការតំឡើងកូដ hosted-agent កំរិត GA** ចាប់ផ្តើមជាមួយ [ការដឹកនាំជំហាន](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga)។ វាត្រូវការកំណែ AZD 1.37.0+, uv បច្ចុប្បន្ន, Python 3.13+, សិទ្ធិ Foundry និងកំណត់សុពលភាពម៉ូឌែល។ ស្លាកកម្មវិធីពេញមួយខាងក្រោមជាជម្រើសផ្សេងទៀត មិនមែនជាការតម្រូវសម្រាប់ការដឹកនាំនោះទេ។

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 ស្លាក AI ជាពិសេស

| ស្លាក | ពិពណ៌នា | សេវាកម្ម |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ការជជែក RAG ជាមួយឯកសារយោង | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ភ្នាក់ងារ AI ជាមួយឧបករណ៍ | សេវាកម្ម AI Agent |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | ជជែក AI មូលដ្ឋាន | OpenAI + Container Apps |

---

## 💰 ចំណាយដែលត្រូវដឹង

នេះជាជួរលេខបង្ហាញ មិនមែនជាសម្រង់ឬកំណត់កំពូលទេ; ចរាចរម៉ូឌែល, ការជ្រើសរើស Search/compute SKUs, តំបន់ និងមុខងារជាជម្រើសអាចលើសនេះបាន។ សូមពិនិត្យការណែនាំថ្លៃឥឡូវនេះសម្រាប់គំរូរបស់អ្នកមុនពេលចាប់ផ្តើម។

| ព័ន្ធអាកាសធាតុ | ថ្លៃប្រចាំខែដែលរំពឹងទុក |
|-------------|----------------------|
| ការអភិវឌ្ឍ | $80-150 |
| ការត្រួតពិនិត្យ | $150-300 |
| ផលិត | $300-3,500+ |

**ការសម្អាត៖** សូមពិនិត្យ `azd down` មុនការបញ្ជាក់៖ សម្រាប់គម្រោង Foundry ថ្មី វានឹងលុបក្រុមធនធាន និងអ្វីៗគ្រប់យ៉ាងនៅក្នុងនោះ។ សម្រាប់គម្រោង Foundry ដែលបានប្រើវិញ វានៅទុកគម្រោង និងធនធានភ្នាក់ងារនៅទីតាំង; អ្នកត្រូវអនុវត្ត [ការណែនាំសម្អាតនៅក្នុងវគ្គដំណើរការ](microsoft-foundry-integration.md#7-clean-up-deliberately) ដើម្បីលុបធនធានមិនចង់បានជាឯកផ្សេង។

---

## 🔗 ការរុករក

| ទិស | មេរៀន |
|-----------|---------|
| **មុន** | [មេរៀនទី ១៖ មូលដ្ឋាន](../chapter-01-foundation/README.md) |
| **បន្ទាប់** | [មេរៀនទី ៣៖ ការកំណត់រចនាសម្ព័ន្ធ](../chapter-03-configuration/README.md) |
| **លោតទៅ** | [មេរៀនទី ៨៖ រូបមន្ដផ្នែកផលិតកម្ម](../chapter-08-production/README.md) |

---

## 📖 វត្ថុវិជ្ជាពាក់ព័ន្ធ

- [ការជួយដោះស្រាយបញ្ហា AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [អនុធិការចំណេះដឹងផលិតកម្ម AI](../chapter-08-production/production-ai-practices.md)
- [ទស្សនៈកម្មវិធី](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->