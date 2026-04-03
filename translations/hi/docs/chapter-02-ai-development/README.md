# अध्याय 2: एआई-प्रथम विकास

**📚 कोर्स**: [AZD For Beginners](../../README.md) | **⏱️ अवधि**: 1-2 घंटे | **⭐ जटिलता**: मध्यवर्ती

---

## अवलोकन

यह अध्याय Azure Developer CLI और Microsoft Foundry सेवाओं का उपयोग करके एआई संचालित अनुप्रयोगों को डिप्लॉय करने पर केंद्रित है। सरल एआई चैट ऐप्स से लेकर उपकरणों वाले बुद्धिमान एजेंटों तक।

> **सत्यापन नोट (2026-03-25):** इस अध्याय में कमांड फ्लो और एक्सटेंशन मार्गदर्शन की समीक्षा `azd` `1.23.12` और वर्तमान पूर्वावलोकन AI एजेंट एक्सटेंशन रिलीज़ `azure.ai.agents` `0.1.18-preview` के खिलाफ की गई थी। यदि आप पुराने AZD बिल्ड पर हैं, तो पहले अपडेट करें और फिर अभ्यास जारी रखें।

## सीखने के उद्देश्य

इस अध्याय को पूरा करके, आप:
- पूर्व-निर्मित AZD टेम्प्लेट का उपयोग करके AI अनुप्रयोगों को डिप्लॉय कर सकेंगे
- AZD के साथ Microsoft Foundry एकीकरण को समझेंगे
- उपकरणों के साथ AI एजेंटों को कॉन्फ़िगर और अनुकूलित करेंगे
- RAG (रिट्रीवल-ऑगमेंटेड जनरेशन) अनुप्रयोगों को डिप्लॉय करेंगे

---

## 📚 पाठ

| # | पाठ | विवरण | समय |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD को Foundry सेवाओं से कनेक्ट करें | 30 मिनट |
| 2 | [AI Agents Guide](agents.md) | उपकरणों के साथ बुद्धिमान एजेंटों को डिप्लॉय करें | 45 मिनट |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AI मॉडल को डिप्लॉय और कॉन्फ़िगर करें | 30 मिनट |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | व्यावहारिक: अपने AI समाधान को AZD-तैयार बनाएं | 60 मिनट |

---

## 🚀 त्वरित प्रारंभ

```bash
# विकल्प 1: RAG चैट एप्लिकेशन
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

## 🤖 विशेष AI टेम्प्लेट

| टेम्प्लेट | विवरण | सेवाएँ |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | उद्धरणों के साथ RAG चैट | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | उपकरणों के साथ AI एजेंट | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | बुनियादी AI चैट | OpenAI + कंटेनर ऐप्स |

---

## 💰 लागत जागरूकता

| पर्यावरण | अनुमानित मासिक लागत |
|-------------|----------------------|
| विकास | $80-150 |
| स्टेजिंग | $150-300 |
| उत्पादन | $300-3,500+ |

**टिप:** शुल्क से बचने के लिए परीक्षण के बाद `azd down` चलाएं।

---

## 🔗 नेविगेशन

| दिशा | अध्याय |
|-----------|---------|
| **पिछला** | [अध्याय 1: आधार](../chapter-01-foundation/README.md) |
| **अगला** | [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/README.md) |
| **यहां जाएं** | [अध्याय 8: उत्पादन पैटर्न](../chapter-08-production/README.md) |

---

## 📖 संबंधित संसाधन

- [AI समस्या निवारण](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [उत्पादन AI प्रथाएँ](../chapter-08-production/production-ai-practices.md)
- [एप्लिकेशन इनसाइट्स](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। हम इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->