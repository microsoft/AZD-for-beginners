# अध्याय 2: AI-प्रथम विकास

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1-2 घण्टा | **⭐ Complexity**: मध्यम

---

## अवलोकन

यस अध्यायले Azure Developer CLI र Microsoft Foundry सेवाहरू प्रयोग गरी AI-संचालित अनुप्रयोगहरू तैनाथ गर्नेमा केन्द्रित छ। साधारण AI च्याट अनुप्रयोगहरूदेखि उपकरणहरूसहित बौद्धिक एजेन्टहरू सम्म।

## अध्ययन लक्ष्यहरू

यस अध्याय पूरा गरेपछि, तपाईं:
- प्रि-बिल्ट AZD टेम्पलेटहरू प्रयोग गरेर AI अनुप्रयोगहरू तैनाथ गर्नुहोस्
- AZD सँग Microsoft Foundry को एकीकरण बुझ्नुहोस्
- उपकरणहरूसँग AI एजेन्टहरू कन्फिगर र अनुकूलन गर्नुहोस्
- RAG (Retrieval-Augmented Generation) अनुप्रयोगहरू तैनाथ गर्नुहोस्

---

## 📚 पाठहरू

| # | पाठ | विवरण | समय |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD लाई Foundry सेवाहरू सँग जडान गर्नुहोस् | 30 min |
| 2 | [AI Agents Guide](agents.md) | उपकरणहरूसँग बौद्धिक एजेन्टहरू तैनाथ गर्नुहोस् | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AI मोडेलहरू तैनाथ र कन्फिगर गर्नुहोस् | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | व्यावहारिक: तपाईंको AI समाधानलाई AZD-अनुकूल बनाउनुहोस् | 60 min |

---

## 🚀 छिटो सुरु

```bash
# विकल्प 1: RAG च्याट अनुप्रयोग
azd init --template azure-search-openai-demo
azd up

# विकल्प 2: कृत्रिम बुद्धिमत्ता एजेन्टहरू
azd init --template get-started-with-ai-agents
azd up

# विकल्प 3: विकल्प 3: छिटो च्याट अनुप्रयोग
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 प्रमुख AI टेम्पलेटहरू

| टेम्पलेट | विवरण | सेवाहरू |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | उद्धरणसहित RAG च्याट | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | उपकरणहरूसँग AI एजेन्ट | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | मूलभूत AI च्याट | OpenAI + Container Apps |

---

## 💰 लागत सचेतता

| पर्यावरण | अनुमानित मासिक लागत |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**टिप:** परीक्षणपछि शुल्कबाट बच्न `azd down` चलाउनुहोस्।

---

## 🔗 नेभिगेसन

| दिशा | अध्याय |
|-----------|---------|
| **पछिल्लो** | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| **अर्को** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **सिधा जानुहोस्** | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 सम्बन्धित स्रोतहरू

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुनसक्छ। मूल दस्तावेजलाई यसको मौलिक भाषामा अधिकारिक स्रोत मानिनु पर्छ। महत्वपूर्ण वा संवेदनशील जानकारीका लागि व्यावसायिक मानवीय अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी जिम्मेवार हुने छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->