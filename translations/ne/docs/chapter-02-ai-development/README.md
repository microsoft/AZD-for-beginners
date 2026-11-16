# अध्याय २: AI-प्रथम विकास

**📚 पाठ्यक्रम**: [AZD आरम्भकर्ताहरूका लागि](../../README.md) | **⏱️ अवधि**: कार्यशालासहित ४-५ घण्टा | **⭐ जटिलता**: मध्यवर्ती

---

## अवलोकन

यो अध्याय Azure Developer CLI र Microsoft Foundry सेवाहरूको प्रयोग गरेर AI-संचालित अनुप्रयोगहरू तैनाथ गर्न केन्द्रित छ। साधारण AI च्याट एपहरूदेखि लिएर उपकरणहरू सहित बुद्धिमानी एजेन्टहरू सम्म।

> **रिलीज समीक्षा (2026-11-04):** AI CLI मार्गदर्शन प्रकाशित `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, र `azure.ai.evaluations` `1.0.0-beta.2` प्रलेख/स्रोतसँग जाँचिएको थियो। संयुक्त कार्यप्रवाहको लागि `azd >= 1.37.0` प्रयोग गर्नुहोस्। मूल्यांकनहरू अब पृथक `azd ai eval` नामस्थान प्रयोग गर्छन्; [रिलीज परिवर्तनहरू र माइग्रेशन मार्गदर्शन](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes) हेर्नुहोस्। यो प्रत्यक्ष तैनाथ पुष्टि होइन।

## सिकाइ उद्देश्यहरू

यस अध्याय पूरा गरेपछि, तपाईंले:
- पूर्वनिर्मित AZD टेम्प्लेटहरूको प्रयोग गरेर AI अनुप्रयोगहरू तैनाथ गर्ने
- AZD सँग Microsoft Foundry एकीकरण बुझ्ने
- उपकरणहरूसहित AI एजेन्टहरू कन्फिगर र अनुकूलन गर्ने
- RAG (Retrieval-Augmented Generation) अनुप्रयोगहरू तैनाथ गर्ने

---

## 📚 पाठहरू

| # | पाठ | विवरण | समय |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry एकीकरण](microsoft-foundry-integration.md) | AZD लाई Foundry सेवासँग जोड्ने | ३० मिनेट |
| 2 | [AI एजेन्ट मार्गदर्शन](agents.md) | उपकरणहरूसहित बुद्धिमानी एजेन्टहरू तैनाथ गर्ने | ४५ मिनेट |
| 3 | [AI मोडेल तैनाथी](ai-model-deployment.md) | AI मोडेलहरू तैनाथ र कन्फिगर गर्ने | ३० मिनेट |
| ४ | [AI कार्यशाला प्रयोगशाला](ai-workshop-lab.md) | व्यावहारिक: एक टेम्प्लेट अन्वेषण गर्नुहोस् र रूपान्तरणको योजना बनाउनुहोस् | २-३ घण्टा |

---

## 🚀 छिटो सुरु

नयाँ खाली डाईरेक्टरीमा एउटा विकल्प छान्नुहोस्। पछिको `.` ले वर्तमान डाईरेक्टरी इनेशियलाइज गर्दछ; अन्यथा AZD ले तपाईंको शेलको कार्य डिरेक्टरी नबदलिये सम्म उपडाईरेक्टरी सिर्जना गर्न सक्छ।

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

## 🤖 विशेष AI टेम्प्लेटहरू

| टेम्प्लेट | विवरण | सेवाहरू |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | उद्धरणहरूसहित RAG च्याट | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | उपकरणहरूसहित AI एजेन्ट | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | आधारभूत AI च्याट | OpenAI + Container Apps |

---

## 💰 लागत सचेतना

यी उदाहरणात्मक दायराहरू हुन्, उद्धरण वा सीमा होइनन्; मोडेल ट्राफिक, Search/compute SKUs, क्षेत्र, र वैकल्पिक सुविधाहरू यसलाई पार गर्न सक्छन्। विनियोजन अघि तपाईंले चयन गरेको नमूना हालको मूल्य निर्धारण मार्गदर्शन समीक्ष गर्नुहोस्।

| वातावरण | अनुमानित मासिक लागत |
|-------------|----------------------|
| विकास | $८०-१५० |
| स्टेजिङ | $१५०-३०० |
| उत्पादन | $३००-३,५००+ |

**सुझाव:** परीक्षणपछि शुल्कबाट बच्न `azd down` चलाउनुहोस्।

---

## 🔗 नेभिगेसन

| दिशा | अध्याय |
|-----------|---------|
| **अघिल्लो** | [अध्याय १: आधारशिला](../chapter-01-foundation/README.md) |
| **अर्को** | [अध्याय ३: कन्फिगरेसन](../chapter-03-configuration/README.md) |
| **छड्के जानुहोस्** | [अध्याय ८: उत्पादन ढाँचाहरू](../chapter-08-production/README.md) |

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