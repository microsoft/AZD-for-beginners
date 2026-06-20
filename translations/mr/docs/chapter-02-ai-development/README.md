# अध्याय 2: AI-प्रथम विकास

**📚 कोर्स**: [AZD For Beginners](../../README.md) | **⏱️ कालावधी**: 1-2 तास | **⭐ गुंतागुंत**: मध्यम

---

## आढावा

हा अध्याय Azure Developer CLI आणि Microsoft Foundry सेवांचा वापर करून AI-संचालित अनुप्रयोग तैनात करण्यावर लक्ष केंद्रित करतो. सोप्या AI चॅट अॅप्सपासून साधनांसह बुद्धिमान एजंटपर्यंत.

> **प्रमाणन नोंद (2026-06-15):** या अध्यायातील कमांड प्रवाह आणि विस्तार मार्गदर्शन `azd` `1.25.6` आणि सध्याच्या प्रीव्यू AI एजंट विस्तार प्रकाशन `azure.ai.agents` `0.1.40-preview` यांच्या विरुद्ध पुनरावलोकन केले गेले. आपण जुन्या AZD बिल्डवर असल्यास, प्रथम अद्यतन करा आणि नंतर सरावांशी पुढे जा.

## शिकण्याच्या उद्दिष्टे

हा अध्याय पूर्ण केल्यावर, आपण:
- आधीच तयार केलेल्या AZD साच्यांचा वापर करून AI अनुप्रयोग तैनात कराल
- AZD सह Microsoft Foundry समाकलन समजून घ्याल
- साधनांसह AI एजंट संरचीत आणि सानुकूलित कराल
- RAG (Retrieval-Augmented Generation) अनुप्रयोग तैनात कराल

---

## 📚 धडे

| # | धडा | वर्णन | वेळ |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry समाकलन](microsoft-foundry-integration.md) | AZD ला Foundry सेवांशी जोडणे | 30 मिनिटे |
| 2 | [AI एजंट गाईड](agents.md) | साधनांसह बुद्धिमान एजंट तैनात करणे | 45 मिनिटे |
| 3 | [AI मॉडेल तैनाती](ai-model-deployment.md) | AI मॉडेल्स तैनात आणि संरचीत करणे | 30 मिनिटे |
| 4 | [AI कार्यशाळा लॅब](ai-workshop-lab.md) | प्रत्यक्ष काम: तुमचे AI समाधान AZD साठी तयार करा | 60 मिनिटे |

---

## 🚀 जलद प्रारंभ

```bash
# पर्याय 1: RAG चॅट अनुप्रयोग
azd init --template azure-search-openai-demo
azd up

# पर्याय 2: AI एजंट्स
azd init --template get-started-with-ai-agents
azd up

# पर्याय 3: जलद चॅट अनुप्रयोग
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 वैशिष्ट्यीकृत AI साचे

| साचा | वर्णन | सेवा |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG चॅट संदर्भांसह | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | साधनांसह AI एजंट | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | मूलभूत AI चॅट | OpenAI + Container Apps |

---

## 💰 खर्चाची जाणीव

| वातावरण | अंदाजे मासिक खर्च |
|-------------|----------------------|
| विकास | $80-150 |
| स्टेजिंग | $150-300 |
| उत्पादन | $300-3,500+ |

**सूचना:** शुल्क टाळण्यासाठी चाचणी नंतर `azd down` चालवा.

---

## 🔗 नेव्हिगेशन

| दिशा | प्रकरण |
|-----------|---------|
| **मागील** | [अध्याय 1: पाया](../chapter-01-foundation/README.md) |
| **पुढील** | [अध्याय 3: संरचना](../chapter-03-configuration/README.md) |
| **थेट जा** | [अध्याय 8: उत्पादन नमुने](../chapter-08-production/README.md) |

---

## 📖 संबंधित संसाधने

- [AI समस्यांचे निराकरण](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [उत्पादन AI पद्धती](../chapter-08-production/production-ai-practices.md)
- [अॅप्लिकेशन इनसाइट्स](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->