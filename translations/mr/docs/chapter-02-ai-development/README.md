# अध्याय 2: AI-प्रथम विकास

**📚 कोर्स**: [AZD सुरुवातीसाठी](../../README.md) | **⏱️ कालावधी**: 1-2 तास | **⭐ कठीणपणा**: मध्यम

---

## आढावा

हा अध्याय Azure Developer CLI आणि Microsoft Foundry सेवा वापरून AI-शक्तीप्राप्त अनुप्रयोग तैनात करण्यावर लक्ष केंद्रित करतो. सोप्या AI चॅट ऍप्स पासून साधने असलेल्या बुद्धिमान एजंटपर्यंत.

> **पडताळणी नोंद (2026-03-25):** The command flow and extension guidance in this chapter were reviewed against `azd` `1.23.12` and the current preview AI agent extension release `azure.ai.agents` `0.1.18-preview`. If you are on an older AZD build, update first and then continue with the exercises.

## शिकण्याची उद्दिष्टे

By completing this chapter, you will:
- पूर्व-निर्मित AZD टेम्पलेट्स वापरून AI अनुप्रयोग तैनात करा
- Microsoft Foundry चे AZD सोबत समाकलन समजून घ्या
- साधने वापरून AI एजंट्स संरचीत आणि सानुकूलित करा
- RAG (Retrieval-Augmented Generation) अनुप्रयोग तैनात करा

---

## 📚 धडे

| # | पाठ | वर्णन | वेळ |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry समाकलन](microsoft-foundry-integration.md) | AZD ला Foundry सेवांशी जोडा | 30 मिनिटे |
| 2 | [AI Agents Guide](agents.md) | साधनांसह बुद्धिमान एजंट तैनात करा | 45 मिनिटे |
| 3 | [AI मॉडेल तैनाती](ai-model-deployment.md) | AI मॉडेल तैनात आणि संरचीत करा | 30 मिनिटे |
| 4 | [AI कार्यशाळा लॅब](ai-workshop-lab.md) | हाताने: आपले AI सोल्यूशन AZD-योग्य बनवा | 60 मिनिटे |

---

## 🚀 त्वरित प्रारंभ

```bash
# पर्याय 1: RAG चॅट अनुप्रयोग
azd init --template azure-search-openai-demo
azd up

# पर्याय 2: AI एजंट्स
azd init --template get-started-with-ai-agents
azd up

# पर्याय 3: झटपट चॅट अॅप
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 प्रमुख AI टेम्पलेट्स

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | उद्धरणांसह RAG चॅट | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | साधनांसह AI एजंट | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | मूलभूत AI चॅट | OpenAI + Container Apps |

---

## 💰 खर्चाबद्दल माहिती

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**टीप:** Run `azd down` after testing to avoid charges.

---

## 🔗 नेव्हिगेशन

| Direction | Chapter |
|-----------|---------|
| **मागील** | [अध्याय 1: पाया](../chapter-01-foundation/README.md) |
| **पुढील** | [अध्याय 3: कॉन्फिगरेशन](../chapter-03-configuration/README.md) |
| **थेट जा** | [अध्याय 8: उत्पादन पॅटर्न](../chapter-08-production/README.md) |

---

## 📖 संबंधित संसाधने

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [उत्पादन AI सराव](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला गेला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, परंतु कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेच्या त्रुटी आढळू शकतात. मूळ भाषेतील दस्तऐवज अधिकृत स्रोत मानले जावे. महत्त्वाची माहिती असल्यास व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवलेल्या कोणत्याही गैरसमजुतीं किंवा चुकीच्या अर्थ लावण्याबद्दल आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->