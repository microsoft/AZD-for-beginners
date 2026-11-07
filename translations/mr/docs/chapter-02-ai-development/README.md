# अध्याय २: AI-प्रथम विकास

**📚 कोर्स**: [AZD For Beginners](../../README.md) | **⏱️ कालावधी**: ४-५ तास कार्यशाळेसह | **⭐ गुंतागुंत**: मध्यम

---

## आढावा

हा अध्याय Azure Developer CLI आणि Microsoft Foundry सेवा वापरून AI-सक्षम अनुप्रयोग तैनात करण्यावर केंद्रित आहे. सोपी AI चॅट अॅप्स पासून साधने वापरणाऱ्या बुद्धिमान एजंटपर्यंत.

> **रिलीज पुनरावलोकन (2026-11-04):** AI CLI मार्गदर्शन प्रकाशित `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, आणि `azure.ai.evaluations` `1.0.0-beta.2` दस्तऐवज/स्रोत यांच्याशी तपासले गेले. संयुक्त कार्यप्रवाहासाठी `azd >= 1.37.0` वापरा. मूल्यांकन आता वेगळ्या `azd ai eval` namespace वापरतात; पहा [रिलीज बदल आणि स्थलांतर मार्गदर्शन](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). हे थेट तैनाती तपासणी नाही.

## शिक्षण उद्दिष्टे

हा अध्याय पूर्ण करून, तुम्ही:
- पूर्व-निर्मित AZD टेम्पलेट्स वापरून AI अनुप्रयोग तैनात कराल
- AZD सह Microsoft Foundry एकत्रीकरण समजून घ्याल
- साधने वापरून AI एजंट कॉन्फिगर व सानुकूलित कराल
- RAG (Retrieval-Augmented Generation) अनुप्रयोग तैनात कराल

---

## 📚 धडे

| # | धडा | वर्णन | वेळ |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD ला Foundry सेवांशी जोडणे | ३० मिनिटे |
| 2 | [AI Agents Guide](agents.md) | साधनांसह बुद्धिमान एजंट तैनात करणे | ४५ मिनिटे |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AI मॉडेल तैनात आणि कॉन्फिगर करणे | ३० मिनिटे |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | हाताळणी: एका टेम्पलेटची तपासणी आणि तुमचे रुपांतरण योजने तयार करणे | २-३ तास |

---

## 🚀 जलद सुरुवात

नवीन रिकाम्या निर्देशिकेत एक पर्याय निवडा. शेवटचा `.` चालू निर्देशिका प्रारंभित करतो; अन्यथा AZD तुमच्या शेलच्या कार्यरत निर्देशिकेत बदल न करता उपनिर्देशिका तयार करू शकतो.

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

## 🤖 वैशिष्ट्यीकृत AI टेम्पलेट्स

| टेम्पलेट | वर्णन | सेवा |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | दाखल्यांसह RAG चॅट | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | साधने वापरून AI एजंट | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | प्राथमिक AI चॅट | OpenAI + Container Apps |

---

## 💰 खर्चाची माहिती

हे सूचक श्रेणी आहेत, कोट किंवा मर्यादा नाहीत; मॉडेल ट्रॅफिक, Search/compute SKUs, प्रदेश, आणि ऐच्छिक वैशिष्ट्ये यापेक्षा जास्त असू शकतात. तुमच्या निवडलेल्या नमुन्याच्या वर्तमान किंमती मार्गदर्शनाचे पुनरावलोकन तैनातीपूर्वी करा.

| वातावरण | अंदाजे मासिक खर्च |
|-------------|----------------------|
| विकास | $80-150 |
| टेस्टिंग | $150-300 |
| उत्पादन | $300-3,500+ |

**टीप:** शुल्क टाळण्यासाठी चाचणी नंतर `azd down` चालवा.

---

## 🔗 नेव्हिगेशन

| दिशा | प्रकरण |
|-----------|---------|
| **पूर्वीचे** | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| **पुढचे** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **थेट जा** | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 संबंधित स्रोत

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->