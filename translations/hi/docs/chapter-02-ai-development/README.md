# अध्याय 2: AI-प्रथम विकास

**📚 Course**: [AZD शुरुआती के लिए](../../README.md) | **⏱️ Duration**: 1-2 घंटे | **⭐ Complexity**: मध्यम

---

## अवलोकन

यह अध्याय Azure Developer CLI और Microsoft Foundry सेवाओं का उपयोग करके AI-संचालित अनुप्रयोगों को तैनात करने पर केंद्रित है। सरल AI चैट ऐप्स से लेकर उपकरणों के साथ बुद्धिमान एजेंट्स तक।

## सीखने के उद्देश्य

इस अध्याय को पूरा करने पर आप:
- पूर्व-निर्मित AZD टेम्प्लेट का उपयोग करके AI अनुप्रयोग तैनात करेंगे
- AZD के साथ Microsoft Foundry एकीकरण को समझेंगे
- उपकरणों के साथ AI एजेंट्स को कॉन्फ़िगर और अनुकूलित करेंगे
- RAG (Retrieval-Augmented Generation) अनुप्रयोग तैनात करेंगे

---

## 📚 पाठ

| # | पाठ | विवरण | समय |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD को Foundry सेवाओं से जोड़ें | 30 मिनट |
| 2 | [AI Agents Guide](agents.md) | उपकरणों के साथ बुद्धिमान एजेंट तैनात करें | 45 मिनट |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AI मॉडल तैनात और कॉन्फ़िगर करें | 30 मिनट |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | हैंड्स-ऑन: अपने AI समाधान को AZD-तैयार बनाएं | 60 मिनट |

---

## 🚀 त्वरित आरंभ

```bash
# विकल्प 1: RAG चैट ऐप
azd init --template azure-search-openai-demo
azd up

# विकल्प 2: एआई एजेंट्स
azd init --template get-started-with-ai-agents
azd up

# विकल्प 3: त्वरित चैट ऐप
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 प्रमुख AI टेम्पलेट

| टेम्पलेट | विवरण | सेवाएँ |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | संदर्भों के साथ RAG चैट | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | उपकरणों के साथ AI एजेंट | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | बेसिक AI चैट | OpenAI + Container Apps |

---

## 💰 लागत जागरूकता

| पर्यावरण | अनुमानित मासिक लागत |
|-------------|----------------------|
| डेवलपमेंट | $80-150 |
| स्टेजिंग | $150-300 |
| प्रोडक्शन | $300-3,500+ |

**टिप:** परीक्षण के बाद शुल्क से बचने के लिए `azd down` चलाएँ।

---

## 🔗 नेविगेशन

| दिशा | अध्याय |
|-----------|---------|
| **Previous** | [अध्याय 1: फाउंडेशन](../chapter-01-foundation/README.md) |
| **Next** | [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/README.md) |
| **Skip to** | [अध्याय 8: उत्पादन पैटर्न](../chapter-08-production/README.md) |

---

## 📖 संबंधित संसाधन

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [प्रोडक्शन AI अभ्यास](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनूदित किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान रखें कि स्वचालित अनुवादों में त्रुटियाँ या असंगतियाँ हो सकती हैं। मूल दस्तावेज़ को उसकी मूल भाषा में ही अधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सलाह दी जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->