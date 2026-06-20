# ជំពូក 2: ការអភិវឌ្ឍផ្តោតលើ AI

**📚 វគ្គសិក្សា**: [AZD For Beginners](../../README.md) | **⏱️ រយៈពេល**: 1-2 hours | **⭐ កម្រិត**: Intermediate

---

## រួបរួម

ជំពូកនេះផ្តោតលើការដាក់ចេញកម្មវិធីដែលមានភាពឆ្លាតដោយ AI ដោយប្រើ Azure Developer CLI និងសេវាកម្ម Microsoft Foundry។ ចាប់ពីកម្មវិធីសន្ទនាធម្មតា រហូតដល់ភ្នាក់ងារឆ្លាតជាមួយឧបករណ៍។

> **សម្គាល់បញ្ជាក់ (2026-06-15):** ច្រកកម្មវិធីបញ្ជា និងការណែនាំអំពីផែគសន៍ក្នុងជំពូកនេះត្រូវបានពិនិត្យទល់នឹង `azd` `1.25.6` និងការចេញផ្សាយផែគសន៍ពិวิว AI agent បច្ចុប្បន្ន `azure.ai.agents` `0.1.40-preview`។ ប្រសិនបើអ្នកកំពុងប្រើ AZD ចាស់ សូមបន្ទាន់សម័យជាមុនហើយបន្តធ្វើលំហាត់បង្ហាត់។

## គោលបំណងរៀន

ដោយបញ្ចប់ជំពូកនេះ អ្នកនឹង:
- ដាក់ចេញកម្មវិធី AI ដោយប្រើពុម្ព AZD ដែលបានបង្កើតជាមុន
- យល់ពីការរួមបញ្ចូល Microsoft Foundry ជាមួយ AZD
- កំណត់ค่า និងប្តូរតាមតម្រូវការ AI agents ជាមួយឧបករណ៍
- ដាក់ចេញកម្មវិធី RAG (Retrieval-Augmented Generation)

---

## 📚 មេរៀន

| # | មេរៀន | ពណ៌នា | ពេលវេលា |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | ភ្ជាប់ AZD ជាមួយសេវាកម្ម Foundry | 30 នាទី |
| 2 | [AI Agents Guide](agents.md) | ដាក់ចេញភ្នាក់ងារឆ្លាតជាមួយឧបករណ៍ | 45 នាទី |
| 3 | [AI Model Deployment](ai-model-deployment.md) | ដាក់ចេញ និងកំណត់ម៉ូដែល AI | 30 នាទី |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | អនុវត្តដោយដៃ៖ ធ្វើឱ្យដំណោះស្រាយ AI របស់អ្នក ត្រៀមសម្រាប់ AZD | 60 នាទី |

---

## 🚀 ចាប់ផ្តើមរហ័ស

```bash
# ជម្រើស 1: កម្មវិធីជជែក RAG
azd init --template azure-search-openai-demo
azd up

# ជម្រើស 2: ភ្នាក់ងារបញ្ញាសិប្បនិម្មិត
azd init --template get-started-with-ai-agents
azd up

# ជម្រើស 3: កម្មវិធីជជែករហ័ស
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 ពុម្ព AI ដែលបានណែនាំ

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | សន្ទនា RAG ជាមួយយោង | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ភ្នាក់ងារ AI មានឧបករណ៍ | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | សន្ទនាបឋម AI | OpenAI + Container Apps |

---

## 💰 ការយល់ដឹងអំពីថ្លៃ

| បរិយាកាស | តម្លៃប្រចាំខែប្រមាណ |
|-------------|----------------------|
| បរិយាកាសអភិវឌ្ឍ | $80-150 |
| បរិយាកាសសាកល្បង | $150-300 |
| បរិយាកាសផលិត | $300-3,500+ |

**គន្លឹះ:** រត់ `azd down` បន្ទាប់ពីសាកល្បង ដើម្បីជៀសវាងការចំណាយ។

---

## 🔗 ការរុករក

| ទិសដៅ | ជំពូក |
|-----------|---------|
| **មុន** | [ជំពូក 1: មូលដ្ឋាន](../chapter-01-foundation/README.md) |
| **បន្ទាប់** | [ជំពូក 3: ការកំណត់](../chapter-03-configuration/README.md) |
| **លោតទៅ** | [ជំពូក 8: គំរូក្នុងការផលិត](../chapter-08-production/README.md) |

---

## 📖 ធនធានទាក់ទង

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->