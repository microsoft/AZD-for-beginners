# प्रकरण 4: इन्फ्रास्ट्रक्चर अ‍ॅज कोड आणि तैनाती

**📚 कोर्स**: [AZD For Beginners](../../README.md) | **⏱️ कालावधी**: 1-1.5 तास | **⭐ कठीणपणा**: मध्यम

---

## आढावा

हे प्रकरण Bicep टेम्पलेट्ससह Infrastructure as Code (IaC) नमुने, संसाधन तैनाती, आणि Azure Developer CLI वापरून तैनाती धोरणे कव्हर करते.

> `azd 1.23.12` च्या विरुद्ध मार्च 2026 मध्ये पडताळले.

## शिकण्याची उद्दिष्टे

हे प्रकरण पूर्ण केल्यावर, आपण:
- Bicep टेम्पलेट संरचना आणि सिन्टॅक्स समजून घेणार
- `azd provision` ने Azure संसाधने प्राव्हिजन करणार
- `azd deploy` ने अनुप्रयोग तैनात करणार
- ब्लू-ग्रीन आणि रोलिंग तैनाती धोरणे लागू करणार

---

## 📚 पाठ

| # | पाठ | वर्णन | वेळ |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | AZD सह Azure संसाधन व्यवस्थापन | 45 min |
| 2 | [Deployment Guide](deployment-guide.md) | अ‍ॅप्लिकेशन तैनाती धोरणे | 45 min |

---

## 🚀 त्वरित प्रारंभ

```bash
# टेम्पलेटमधून प्रारंभ करा
azd init --template azure-functions-python-v2-http

# जे तयार होणार आहे ते पूर्वावलोकन करा
azd provision --preview

# केवळ पायाभूत सुविधा पुरवा
azd provision

# केवळ कोड तैनात करा
azd deploy

# किंवा दोन्ही एकत्र करा
azd up
```

---

## 📁 AZD प्रकल्प रचना

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 महत्त्वाचे आदेश

| कमांड | वर्णन |
|---------|-------------|
| `azd init` | प्रकल्प सुरू करा |
| `azd provision` | Azure संसाधने तयार करा |
| `azd deploy` | अॅप्लिकेशन कोड तैनात करा |
| `azd up` | प्राव्हिजन + तैनात |
| `azd down` | सर्व संसाधने हटवा |

---

## 🔗 नेव्हिगेशन

| Direction | Chapter |
|-----------|---------|
| **मागील** | [प्रकरण 3: कॉन्फिगरेशन](../chapter-03-configuration/README.md) |
| **पुढचे** | [प्रकरण 5: मल्टी-एजंट सोल्यूशन्स](../chapter-05-multi-agent/README.md) |

---

## 📖 संबंधित संसाधने

- [पूर्व-तैनाती तपासण्या](../chapter-06-pre-deployment/README.md)
- [कंटेनर अॅप उदाहरणे](../../examples/container-app/README.md)
- [डेटाबेस अॅप उदाहरण](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, परंतु कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला जावा. गंभीर माहितीसाठी व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे झालेल्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थलावनांसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->