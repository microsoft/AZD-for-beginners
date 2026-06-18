# अध्याय 2: एआई-प्रथम विकास

**📚 पाठ्यक्रम**: [AZD For Beginners](../../README.md) | **⏱️ अवधि**: 1-2 घंटे | **⭐ जटिलता**: मध्यम

---

## अवलोकन

यह अध्याय Azure Developer CLI और Microsoft Foundry सेवाओं का उपयोग करके AI-सक्षम अनुप्रयोगों की तैनाती पर केंद्रित है। सरल AI चैट ऐप से लेकर टूल्स वाले बुद्धिमान एजेंटों तक।

> **मान्यता नोट (2026-06-15):** इस अध्याय में कमांड फ्लो और एक्सटेंशन मार्गदर्शन की समीक्षा `azd` `1.25.6` और वर्तमान प्रीव्यू AI एजेंट एक्सटेंशन रिलीज `azure.ai.agents` `0.1.40-preview` के खिलाफ की गई थी। यदि आप किसी पुराने AZD बिल्ड पर हैं, तो पहले अपडेट करें और फिर अभ्यास जारी रखें।

## सीखने के उद्देश्य

By completing this chapter, you will:
- प्री-बिल्ट AZD टेम्पलेट्स का उपयोग करके एआई एप्लिकेशन तैनात करें
- AZD के साथ Microsoft Foundry एकीकरण को समझें
- टूल्स के साथ AI एजेंट्स को कॉन्फ़िगर और अनुकूलित करें
- RAG (Retrieval-Augmented Generation) एप्लिकेशन तैनात करें

---

## 📚 पाठ

| # | पाठ | विवरण | समय |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD को Foundry सेवाओं से कनेक्ट करें | 30 मिनट |
| 2 | [AI Agents Guide](agents.md) | टूल्स के साथ बुद्धिमान एजेंट तैनात करें | 45 मिनट |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AI मॉडलों को तैनात और कॉन्फ़िगर करें | 30 मिनट |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | हैंड्स-ऑन: अपने AI समाधान को AZD-तैयार बनाएं | 60 मिनट |

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

## 🤖 प्रमुख AI टेम्पलेट्स

| टेम्पलेट | विवरण | सेवाएं |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | उद्धरणों के साथ RAG चैट | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | टूल्स के साथ AI एजेंट | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | बेसिक AI चैट | OpenAI + Container Apps |

---

## 💰 लागत जागरूकता

| परिवेश | अनुमानित मासिक लागत |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**टिप:** परीक्षण के बाद शुल्क से बचने के लिए `azd down` चलाएँ।

---

## 🔗 नेविगेशन

| दिशा | अध्याय |
|-----------|---------|
| **पिछला** | [अध्याय 1: नींव](../chapter-01-foundation/README.md) |
| **अगला** | [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/README.md) |
| **सीधा जाएँ** | [अध्याय 8: उत्पादन पैटर्न](../chapter-08-production/README.md) |

---

## 📖 संबंधित संसाधन

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [उत्पादन AI प्रथाएँ](../chapter-08-production/production-ai-practices.md)
- [एप्लिकेशन इनसाइट्स](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->