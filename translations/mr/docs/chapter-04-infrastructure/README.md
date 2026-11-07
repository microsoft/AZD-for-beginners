# अध्याय 4: इन्फ्रास्ट्रक्चर एज कोड आणि तैनाती

**📚 कोर्स**: [AZD नवशिक्यांसाठी](../../README.md) | **⏱️ कालावधी**: 2-3 तास वाचन; तैनातीचे सराव करण्यासाठी अतिरिक्त वेळ द्या | **⭐ जटिलता**: मध्यम

---

## आढावा

हा अध्याय Bicep टेम्पलेट्ससह इन्फ्रास्ट्रक्चर एज कोड (IaC) पॅटर्न्स, रिसोर्स प्रोव्हीजनिंग, आणि Azure Developer CLI वापरून तैनातीच्या रणनीतींवर आधारित आहे.

> आदेश आणि संरचना पुनरावलोकन लक्ष्य: `azd 1.37.2` (नोव्हेंबर 2026). पुनरावलोकनादरम्यान थेट Azure प्रोव्हीजनिंग चालवले गेले नाही.

## शिकण्याचे उद्दिष्टे

या अध्यायाचा पूर्ण केल्यावर, आपण:
- Bicep टेम्पलेट संरचना आणि सिंटॅक्स समजून घ्या
- `azd provision` वापरून Azure संसाधने प्रोव्हझन करा
- `azd deploy` वापरून अनुप्रयोग तैनात करा
- ब्लू-ग्रीन आणि रोलिंग तैनाती रणनीतींची अंमलबजावणी करा

---

## 📚 धडे

| # | धडा | वर्णन | वेळ |
|---|--------|-------------|------|
| 1 | [संसाधने प्रोव्हीजनिंग](provisioning.md) | AZD सह Azure संसाधन व्यवस्थापन | 45 मिनिटे |
| 2 | [तैनाती मार्गदर्शक](deployment-guide.md) | अनुप्रयोग तैनातीच्या रणनीती | 45 मिनिटे |
| 3 | [आपले स्वतःचे टेम्पलेट तयार करणे](custom-templates.md) | पुनर्वापर करण्यायोग्य azd टेम्पलेट तयार करा आणि प्रकाशित करा | 30 मिनिटे |

---

## 🚀 झटपट सुरूवात

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
azd up
```

---

## 📁 AZD प्रोजेक्ट संरचना

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
| `azd init` | प्रोजेक्ट प्रारंभ करा |
| `azd provision` | Azure संसाधने तयार करा |
| `azd deploy` | अनुप्रयोग कोड तैनात करा |
| `azd up` | प्रोव्हीजन + तैनात करा |
| `azd down` | सर्व संसाधने हटवा |

---

## 🔗 नेव्हिगेशन

| दिशा | अध्याय |
|-----------|---------|
| **मागील** | [अध्याय 3: संरचना](../chapter-03-configuration/README.md) |
| **पुढील** | [अध्याय 5: मल्टी-एजंट सोल्यूशन्स](../chapter-05-multi-agent/README.md) |

---

## 📖 संबंधित संसाधने

- [पूर्व-तैनाती तपासण्या](../chapter-06-pre-deployment/README.md)
- [कंटेनर अनुप्रयोग उदाहरणे](../../examples/container-app/README.md)
- [डेटाबेस अनुप्रयोग उदाहरण](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->