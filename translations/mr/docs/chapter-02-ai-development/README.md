# अध्याय 2: AI-प्रथम विकास

**📚 कोर्स**: [AZD नवशिक्यांसाठी](../../README.md) | **⏱️ कालावधी**: 1-2 तास | **⭐ कठीणपणा**: मध्यम

---

## आढावा

हा अध्याय Azure Developer CLI आणि Microsoft Foundry सेवा वापरून AI-संचालित अनुप्रयोग तैनात करण्यावर लक्ष केंद्रित करतो. सोप्या AI चॅट अॅपपासून साधने असलेले बुद्धिमान एजंट्स पर्यंत.

## शिकण्याच्या उद्दिष्टे

या अध्यायाला पूर्ण केल्यावर, आपण:
- पूर्वनिर्मित AZD टेम्पलेट्स वापरून AI अनुप्रयोग तैनात कराल
- AZD सह Microsoft Foundry चे एकत्रीकरण समजून घेणार
- साधने वापरून AI एजंट्स कॉन्फिगर आणि सानुकूलित करणार
- RAG (रिट्रीव्हल-ऑगमेंटेड जनरेशन) अनुप्रयोग तैनात कराल

---

## 📚 धडे

| # | धडा | वर्णन | वेळ |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry समाकलन](microsoft-foundry-integration.md) | AZD ला Foundry सेवांशी कनेक्ट करा | 30 मिनिटे |
| 2 | [AI एजंट मार्गदर्शक](agents.md) | साधने वापरून बुद्धिमान एजंट्स तैनात करणे | 45 मिनिटे |
| 3 | [AI मॉडेल तैनाती](ai-model-deployment.md) | AI मॉडेल तैनात आणि कॉन्फिगर करणे | 30 मिनिटे |
| 4 | [AI वर्कशॉप लॅब](ai-workshop-lab.md) | हाताने प्रॅक्टिकल: आपले AI समाधान AZD-योग्य करा | 60 मिनिटे |

---

## 🚀 जलद प्रारंभ

```bash
# पर्याय 1: RAG चॅट अनुप्रयोग
azd init --template azure-search-openai-demo
azd up

# पर्याय 2: एआय एजंट्स
azd init --template get-started-with-ai-agents
azd up

# पर्याय 3: त्वरित चॅट अनुप्रयोग
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 वैशिष्ट्यीकृत AI टेम्पलेट्स

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | उद्धरणांसह RAG चॅट | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | साधनांसह AI एजंट | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | मूलभूत AI चॅट | OpenAI + Container Apps |

---

## 💰 खर्चाची जाणीव

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**टीप:** शुल्क टाळण्यासाठी चाचणी नंतर `azd down` चालवा.

---

## 🔗 नेव्हिगेशन

| Direction | Chapter |
|-----------|---------|
| **मागील** | [अध्याय 1: पायाभूत](../chapter-01-foundation/README.md) |
| **पुढील** | [अध्याय 3: कॉन्फिगरेशन](../chapter-03-configuration/README.md) |
| **थेट जा** | [अध्याय 8: उत्पादन पॅटर्न](../chapter-08-production/README.md) |

---

## 📖 संबंधित स्रोत

- [AI समस्या निवारण](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [उत्पादन AI सराव](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हे दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केले आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात ठेवा की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानले जावे. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवलेल्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलाघवाबद्दल आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->