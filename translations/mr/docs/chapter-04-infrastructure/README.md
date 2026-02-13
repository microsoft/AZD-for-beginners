# अध्याय 4: Infrastructure as Code आणि तैनाती

**📚 कोर्स**: [AZD नवशिक्यांसाठी](../../README.md) | **⏱️ कालावधी**: 1-1.5 तास | **⭐ जटिलता**: मध्यम

---

## आढावा

हा अध्याय Bicep टेम्पलेट्स वापरून Infrastructure as Code (IaC) पॅटर्न, संसाधन प्राव्हिजनिंग, आणि Azure Developer CLI वापरून तैनाती धोरणे यावर केंद्रित आहे.

## अभ्यासाचे उद्दिष्टे

हा अध्याय पूर्ण केल्यावर, आपण:
- Bicep टेम्पलेटची संरचना आणि सिंटॅक्स समजून घेणे
- `azd provision` वापरून Azure संसाधने प्राव्हिजन करणे
- `azd deploy` वापरून अनुप्रयोग तैनात करणे
- ब्लू-ग्रीन आणि रोलिंग तैनात धोरणे अंमलात आणणे

---

## 📚 धडे

| # | धडा | वर्णन | वेळ |
|---|--------|-------------|------|
| 1 | [संसाधने प्राव्हिजन करणे](provisioning.md) | AZD सह Azure संसाधन व्यवस्थापन | 45 मिनिटे |
| 2 | [तैनाती मार्गदर्शक](deployment-guide.md) | अनुप्रयोग तैनाती धोरणे | 45 मिनिटे |

---

## 🚀 त्वरीत प्रारंभ

```bash
# साच्यापासून प्रारंभ करा
azd init --template azure-functions-python-v2-http

# काय तयार होईल ते पूर्वावलोकन करा
azd provision --preview

# फक्त पायाभूत सुविधा तयार करा
azd provision

# फक्त कोड तैनात करा
azd deploy

# किंवा दोन्ही एकत्र
azd up
```

---

## 📁 AZD प्रकल्प संरचना

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

## 🔧 आवश्यक आदेश

| आदेश | वर्णन |
|---------|-------------|
| `azd init` | प्रकल्प प्रारंभ करा |
| `azd provision` | Azure संसाधने तयार करा |
| `azd deploy` | अनुप्रयोग कोड तैनात करा |
| `azd up` | प्राव्हिजन + तैनात |
| `azd down` | सर्व संसाधने हटवा |

---

## 🔗 नेव्हिगेशन

| दिशा | अध्याय |
|-----------|---------|
| **मागील** | [अध्याय 3: कॉन्फिगरेशन](../chapter-03-configuration/README.md) |
| **पुढील** | [अध्याय 5: बहु-एजंट समाधान](../chapter-05-multi-agent/README.md) |

---

## 📖 संबंधित संसाधने

- [तैनातीपूर्व तपासण्या](../chapter-06-pre-deployment/README.md)
- [कंटेनर अ‍ॅप उदाहरणे](../../examples/container-app/README.md)
- [डेटाबेस अ‍ॅप उदाहरण](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, परंतु कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये त्रुटी किंवा अपूर्णता असू शकते. मूळ दस्तऐवज त्याच्या स्थानिक भाषेत अधिकृत स्रोत म्हणून मानले पाहिजे. महत्त्वाच्या माहितीकरिता व्यावसायिक मानव अनुवाद शिफारस केला जातो. या अनुवादाच्या वापरामुळे उद्भवलेल्या कोणत्याही गैरसमजांबद्दल किंवा चुकीच्या अर्थनिर्देशांबद्दल आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->