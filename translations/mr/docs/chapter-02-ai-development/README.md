# अध्याय 2: AI-प्रथम विकास

**📚 कोर्स**: [AZD For Beginners](../../README.md) | **⏱️ कालावधी**: 1-2 तास | **⭐ जटिलता**: मध्यम

---

## आढावा

हा अध्याय Azure Developer CLI आणि Microsoft Foundry सेवा वापरून AI-शक्तिकृत अनुप्रयोग तैनात करण्यावर लक्ष केंद्रित करतो. सोप्या AI चॅट अॅप्सपासून उपकरणांसह बुद्धिमान एजंट्सपर्यंत.

> **प्रमाणन नोंद (2026-07-13):** या अध्यायातील आदेश प्रवाह आणि विस्तार मार्गदर्शन `azd` `1.27.1` आणि सध्या उपलब्ध प्रिव्ह्यू AI एजंट विस्तार प्रकाशन `azure.ai.agents` `1.0.0-beta.5` यांच्याशी तपासले गेले. तुम्ही जुन्या AZD बिल्डवर असाल तर प्रथम अद्यतन करा आणि नंतर सरावांसह पुढे जा.

## शिकण्याचा उद्देश

हा अध्याय पूर्ण केल्यावर, तुम्ही:
- पूर्व-निर्मित AZD टेम्प्लेट्स वापरून AI अनुप्रयोग तैनात कराल
- AZD सह Microsoft Foundry एकत्रीकरण समजून घेणार
- उपकरणांसह AI एजंट्स सानुकूलित आणि संरचीत कराल
- RAG (Retrieval-Augmented Generation) अनुप्रयोग तैनात कराल

---

## 📚 धडे

| # | धडा | वर्णन | वेळ |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD सह Foundry सेवा कनेक्ट करा | 30 मिनिटे |
| 2 | [AI Agents Guide](agents.md) | उपकरणांसह बुद्धिमान एजंट्स तैनात करा | 45 मिनिटे |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AI मॉडेल्स तैनात आणि संरचीत करा | 30 मिनिटे |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | प्रत्यक्ष काम: तुमचे AI सोल्यूशन AZD-तयार करा | 60 मिनिटे |

---

## 🚀 लवकर सुरूवात

```bash
# पर्याय 1: RAG चॅट अॅप्लिकेशन
azd init --template azure-search-openai-demo
azd up

# पर्याय 2: AI एजंट्स
azd init --template get-started-with-ai-agents
azd up

# पर्याय 3: क्विक चॅट अॅप
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 वैशिष्ट्यीकृत AI टेम्प्लेट्स

| टेम्प्लेट | वर्णन | सेवा |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | संदर्भांसह RAG चॅट | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | उपकरणांसह AI एजंट | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | मूलभूत AI चॅट | OpenAI + कंटेनर अॅप्स |

---

## 💰 खर्चाविशेष माहिती

| पर्यावरण | अंदाजित मासिक खर्च |
|-------------|----------------------|
| विकास | $80-150 |
| स्टेजिंग | $150-300 |
| उत्पादन | $300-3,500+ |

**टीप:** चाचणी नंतर शुल्क टाळण्यासाठी `azd down` चालवा.

---

## 🔗 नेव्हिगेशन

| दिशा | अध्याय |
|-----------|---------|
| **मागील** | [अध्याय 1: पाया](../chapter-01-foundation/README.md) |
| **पुढील** | [अध्याय 3: संरचना](../chapter-03-configuration/README.md) |
| **स्किप करा** | [अध्याय 8: उत्पादन पॅटर्न्स](../chapter-08-production/README.md) |

---

## 📖 संबंधित संसाधने

- [AI समस्या निवारण](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [उत्पादन AI सराव](../chapter-08-production/production-ai-practices.md)
- [अॅप्लिकेशन इनसाइट्स](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->