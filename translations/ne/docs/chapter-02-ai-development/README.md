# अध्याय 2: AI-प्रथम विकास

**📚 पाठ्यक्रम**: [AZD आरम्भिकहरूको लागि](../../README.md) | **⏱️ अवधि**: 1-2 घण्टा | **⭐ जटिलता**: मध्यम

---

## अवलोकन

यस अध्यायले Azure Developer CLI र Microsoft Foundry सेवाहरू प्रयोग गरेर AI-सक्षम अनुप्रयोगहरूलाई परिनियोजन गर्ने कुरामा केन्द्रित छ। सरल AI च्याट एपहरूदेखि उपकरणहरूसँगै काम गर्ने बुद्धिमान एजेन्टहरूसम्म।

> **प्रमाणीकरण नोट (2026-06-15):** यस अध्यायमा कमाण्ड फ्लो र एक्सटेन्सन मार्गदर्शन `azd` `1.25.6` र वर्तमान प्रिभ्यू AI एजेन्ट एक्सटेन्सन रिलिज `azure.ai.agents` `0.1.40-preview` का विरुद्ध जाँच गरिएको थियो। यदि तपाईं पुरानो AZD बिल्डमा हुनुहुन्छ भने, पहिले अपडेट गरेर त्यसपछि अभ्यास जारी राख्नुहोस्।

## अधिगम उद्देश्यहरू

By completing this chapter, you will:
- पूर्व-निर्मित AZD टेम्प्लेटहरू प्रयोग गरी AI अनुप्रयोगहरू परिनियोजन गर्नुहोस्
- AZD सँग Microsoft Foundry को एकीकरणबारे बुझ्नुहोस्
- उपकरणहरूसँग AI एजेन्टहरू कन्फिगर र अनुकूलित गर्नुहोस्
- RAG (Retrieval-Augmented Generation) अनुप्रयोगहरू परिनियोजन गर्नुहोस्

---

## 📚 पाठहरू

| # | पाठ | विवरण | समय |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry एकीकरण](microsoft-foundry-integration.md) | AZD लाई Foundry सेवाहरूसँग जडान गर्नुहोस् | 30 मिनेट |
| 2 | [AI एजेन्ट मार्गदर्शन](agents.md) | उपकरणहरूसँग बुद्धिमान एजेन्टहरू परिनियोजन गर्नुहोस् | 45 मिनेट |
| 3 | [AI मोडेल परिनियोजन](ai-model-deployment.md) | एआई मोडेलहरू परिनियोजन र कन्फिगर गर्नुहोस् | 30 मिनेट |
| 4 | [AI कार्यशाला प्रयोगशाला](ai-workshop-lab.md) | व्यावहारिक: आफ्नो AI समाधानलाई AZD-तयार बनाउनुहोस् | 60 मिनेट |

---

## 🚀 द्रुत सुरुवात

```bash
# विकल्प 1: RAG च्याट अनुप्रयोग
azd init --template azure-search-openai-demo
azd up

# विकल्प 2: एआई एजेन्टहरू
azd init --template get-started-with-ai-agents
azd up

# विकल्प 3: छिटो च्याट एप
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 विशेष AI टेम्प्लेटहरू

| टेम्प्लेट | विवरण | सेवाहरू |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | सन्दर्भसहितको RAG च्याट | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | उपकरणहरूसहितको AI एजेन्ट | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | आधारभूत AI च्याट | OpenAI + Container Apps |

---

## 💰 लागत सचेतता

| वातावरण | अनुमानित मासिक लागत |
|-------------|----------------------|
| विकास | $80-150 |
| स्टेजिङ | $150-300 |
| उत्पादन | $300-3,500+ |

**सुझाव:** परीक्षण पछि शुल्क लाग्नबाट जोगिन `azd down` चलाउनुहोस्।

---

## 🔗 नेभिगेसन

| दिशा | अध्याय |
|-----------|---------|
| **अघिल्लो** | [अध्याय 1: आधार](../chapter-01-foundation/README.md) |
| **अर्को** | [अध्याय 3: कन्फिगरेसन](../chapter-03-configuration/README.md) |
| **छिटो जानुहोस्** | [अध्याय 8: उत्पादन ढाँचा](../chapter-08-production/README.md) |

---

## 📖 सम्बन्धित स्रोतहरू

- [AI समस्या निवारण](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [उत्पादन AI अभ्यासहरू](../chapter-08-production/production-ai-practices.md)
- [एप्लिकेशन इनसाइट्स](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->