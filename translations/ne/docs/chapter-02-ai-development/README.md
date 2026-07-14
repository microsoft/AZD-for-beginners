# अध्याय २: एआई-प्रथम विकास

**📚 पाठ्यक्रम**: [शुरुआतीहरूका लागि AZD](../../README.md) | **⏱️ अवधि**: १-२ घण्टा | **⭐ जटिलता**: मध्यम

---

## अवलोकन

यो अध्याय Azure Developer CLI र Microsoft Foundry सेवाहरू प्रयोग गर्दै एआई-संचालित अनुप्रयोगहरू वितरणमा केन्द्रित छ। साधारण AI च्याट अनुप्रयोगहरूदेखि उपकरणहरू सहित बौद्धिक एजेन्टहरू सम्म।

> **पुष्टि नोट (२०२६-०७-१३):** यस अध्यायको कमाण्ड फ्लो र विस्तार निर्देशनहरू `azd` `1.27.1` र हालको पूर्वावलोकन AI एजेन्ट विस्तार रिलीज `azure.ai.agents` `1.0.0-beta.5` सँग समीक्षा गरियो। यदि तपाईं पुरानो AZD संस्करणमा हुनुहुन्छ भने पहिले अपडेट गर्नुहोस् र त्यसपछि अभ्यासहरू जारी गर्नुहोस्।

## सिकाइ लक्ष्यहरू

यो अध्याय पूरा गरेर तपाईं:
- पूर्व-निर्मित AZD टेम्प्लेटहरू प्रयोग गरी AI अनुप्रयोगहरू वितरण गर्ने
- AZD सँग Microsoft Foundry एकीकरण बुझ्ने
- उपकरणहरू सहित AI एजेन्टहरू कन्फिगर र अनुकूलन गर्ने
- RAG (Retrieval-Augmented Generation) अनुप्रयोगहरू वितरण गर्ने

---

## 📚 पाठहरू

| # | पाठ | विवरण | समय |
|---|--------|-------------|------|
| १ | [Microsoft Foundry को एकीकरण](microsoft-foundry-integration.md) | AZD लाई Foundry सेवाहरू सँग जोड्ने | ३० मिनेट |
| २ | [AI एजेन्टहरू मार्गदर्शन](agents.md) | उपकरणहरूसँग बौद्धिक एजेन्टहरू वितरण गर्ने | ४५ मिनेट |
| ३ | [AI मोडेल वितरण](ai-model-deployment.md) | AI मोडेलहरू वितरण र कन्फिगर गर्ने | ३० मिनेट |
| ४ | [AI कार्यशाला प्रयोगशाला](ai-workshop-lab.md) | हातमा: तपाईंको AI समाधानलाई AZD- तयार बनाउने | ६० मिनेट |

---

## 🚀 छिटो सुरु

```bash
# विकल्प १: RAG च्याट अनुप्रयोग
azd init --template azure-search-openai-demo
azd up

# विकल्प २: AI एजेन्टहरू
azd init --template get-started-with-ai-agents
azd up

# विकल्प ३: छिटो च्याट एप्
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 विशेष एआई टेम्प्लेटहरू

| टेम्प्लेट | विवरण | सेवाहरू |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | उद्धरणहरू सहित RAG च्याट | OpenAI + AI खोज |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | उपकरणहरूसहित AI एजेन्ट | AI एजेन्ट सेवा |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | बुनियादी AI च्याट | OpenAI + कन्टेनर एपहरू |

---

## 💰 लागत सचेतता

| वातावरण | अनुमानित मासिक लागत |
|-------------|----------------------|
| विकास | $80-150 |
| स्टेजिंग | $150-300 |
| उत्पादन | $300-3,500+ |

**टिप:** परीक्षणपछि `azd down` चलाउनुहोस् ताकि शुल्कबाट जोगिन सकियोस्।

---

## 🔗 नेभिगेसन

| दिशा | अध्याय |
|-----------|---------|
| **अघिल्लो** | [अध्याय १: आधारशिला](../chapter-01-foundation/README.md) |
| **अर्को** | [अध्याय ३: कन्फिगरेसन](../chapter-03-configuration/README.md) |
| **छिटो जानुहोस्** | [अध्याय ८: उत्पादन ढाँचा](../chapter-08-production/README.md) |

---

## 📖 सम्बन्धित स्रोतहरू

- [AI समस्या समाधान](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [उत्पादन AI अभ्यासहरू](../chapter-08-production/production-ai-practices.md)
- [अनुप्रयोग अन्तर्दृष्टि](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->