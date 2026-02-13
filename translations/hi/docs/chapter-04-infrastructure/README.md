# अध्याय 4: इंफ्रास्ट्रक्चर ऐज़ कोड और परिनियोजन

**📚 Course**: [AZD शुरुआती के लिए](../../README.md) | **⏱️ Duration**: 1-1.5 घंटे | **⭐ Complexity**: मध्यम

---

## अवलोकन

यह अध्याय Bicep टेम्पलेट्स के साथ Infrastructure as Code (IaC) पैटर्न, संसाधन प्रोविजनिंग, और Azure Developer CLI का उपयोग करके परिनियोजन रणनीतियों को कवर करता है।

## सीखने के उद्देश्य

By completing this chapter, you will:
- Bicep टेम्पलेट की संरचना और सिन्टैक्स को समझें
- Azure संसाधनों का प्रोविजन `azd provision` के साथ करें
- एप्लिकेशन परिनियोजित करें `azd deploy` के साथ
- ब्लू-ग्रीन और रोलिंग परिनियोजन रणनीतियों को लागू करें

---

## 📚 पाठ

| # | पाठ | विवरण | समय |
|---|--------|-------------|------|
| 1 | [संसाधन प्रोविजनिंग](provisioning.md) | AZD के साथ Azure संसाधन प्रबंधन | 45 मिनट |
| 2 | [परिनियोजन गाइड](deployment-guide.md) | एप्लिकेशन परिनियोजन रणनीतियाँ | 45 मिनट |

---

## 🚀 त्वरित शुरुआत

```bash
# टेम्पलेट से प्रारंभ करें
azd init --template azure-functions-python-v2-http

# जो बनाया जाएगा उसका पूर्वावलोकन
azd provision --preview

# केवल इन्फ्रास्ट्रक्चर का प्रावधान करें
azd provision

# केवल कोड तैनात करें
azd deploy

# या दोनों एक साथ
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

## 🔧 आवश्यक कमांड

| कमांड | विवरण |
|---------|-------------|
| `azd init` | प्रोजेक्ट आरम्भ करें |
| `azd provision` | Azure संसाधन बनाएँ |
| `azd deploy` | एप्लिकेशन कोड परिनियोजित करें |
| `azd up` | प्रोविजन + परिनियोजन |
| `azd down` | सभी संसाधनों को हटाएँ |

---

## 🔗 नेविगेशन

| दिशा | अध्याय |
|-----------|---------|
| **पिछला** | [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/README.md) |
| **अगला** | [अध्याय 5: मल्टी-एजेंट समाधान](../chapter-05-multi-agent/README.md) |

---

## 📖 संबंधित संसाधन

- [पूर्व-परिनियोजन जाँच](../chapter-06-pre-deployment/README.md)
- [कंटेनर ऐप उदाहरण](../../examples/container-app/README.md)
- [डेटाबेस ऐप उदाहरण](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यह दस्तावेज़ एआई अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनूदित किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान रखें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल भाषा में उपलब्ध दस्तावेज़ को अधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सलाह दी जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफ़हमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->