# अध्याय 2: AI-प्रथम विकास

**📚 कोर्स**: [AZD शुरुआत के लिए](../../README.md) | **⏱️ अवधि**: 1-2 घंटे | **⭐ जटिलता**: मध्यम

---

## अवलोकन

यह अध्याय Azure Developer CLI और Microsoft Foundry सेवाओं का उपयोग करके AI-संचालित अनुप्रयोगों को तैनात करने पर केंद्रित है। सरल AI चैट ऐप्स से लेकर टूल्स के साथ बुद्धिमान एजेंटों तक।

> **सत्यापन नोट (2026-07-13):** इस अध्याय में कमांड प्रवाह और विस्तार मार्गदर्शन की समीक्षा `azd` `1.27.1` और चालू प्रीव्यू AI एजेंट विस्तार रिलीज़ `azure.ai.agents` `1.0.0-beta.5` के खिलाफ की गई थी। यदि आप पुराने AZD बिल्ड पर हैं, तो पहले अपडेट करें और फिर अभ्यास जारी रखें।

## सीखने के उद्देश्य

इस अध्याय को पूरा करके, आप:
- प्री-बिल्ट AZD टेम्प्लेट्स का उपयोग करके AI अनुप्रयोगों को तैनात करना सीखेंगे
- AZD के साथ Microsoft Foundry एकीकरण समझेंगे
- टूल्स के साथ AI एजेंटों को कॉन्फ़िगर और कस्टमाइज़ करना सीखेंगे
- RAG (रिकवरी-आग्मेंटेड जनरेशन) अनुप्रयोगों को तैनात करना सीखेंगे

---

## 📚 पाठ्यक्रम

| # | पाठ | विवरण | समय |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry एकीकरण](microsoft-foundry-integration.md) | Foundry सेवाओं के साथ AZD को जोड़ना | 30 मिनट |
| 2 | [AI एजेंट गाइड](agents.md) | टूल्स के साथ बुद्धिमान एजेंट तैनात करना | 45 मिनट |
| 3 | [AI मॉडल तैनाती](ai-model-deployment.md) | AI मॉडल तैनात और कॉन्फ़िगर करना | 30 मिनट |
| 4 | [AI कार्यशाला प्रयोगशाला](ai-workshop-lab.md) | व्यावहारिक: अपनी AI समाधान को AZD-तैयार बनाएं | 60 मिनट |

---

## 🚀 त्वरित शुरुआत

```bash
# विकल्प 1: RAG चैट एप्लिकेशन
azd init --template azure-search-openai-demo
azd up

# विकल्प 2: एआई एजेंट
azd init --template get-started-with-ai-agents
azd up

# विकल्प 3: त्वरित चैट ऐप
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 प्रमुख AI टेम्प्लेट्स

| टेम्प्लेट | विवरण | सेवाएं |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | संदर्भों के साथ RAG चैट | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | टूल्स के साथ AI एजेंट | AI एजेंट सेवा |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | बुनियादी AI चैट | OpenAI + कंटेनर ऐप्स |

---

## 💰 लागत जागरूकता

| परिवेश | अनुमानित मासिक लागत |
|-------------|----------------------|
| विकास | $80-150 |
| स्टेजिंग | $150-300 |
| उत्पादन | $300-3,500+ |

**सुझाव:** परीक्षण के बाद `azd down` चलाएं ताकि शुल्क से बचा जा सके।

---

## 🔗 नेविगेशन

| दिशा | अध्याय |
|-----------|---------|
| **पिछला** | [अध्याय 1: आधार](../chapter-01-foundation/README.md) |
| **आगला** | [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/README.md) |
| **कूदें** | [अध्याय 8: उत्पादन पैटर्न](../chapter-08-production/README.md) |

---

## 📖 संबंधित संसाधन

- [AI समस्या समाधान](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [उत्पादन AI अभ्यास](../chapter-08-production/production-ai-practices.md)
- [एप्लिकेशन अंतर्दृष्टि](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->