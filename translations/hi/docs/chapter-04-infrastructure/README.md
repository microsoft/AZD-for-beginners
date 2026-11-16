# अध्याय 4: इंफ्रास्ट्रक्चर ऐज कोड और डिप्लॉयमेंट

**📚 कोर्स**: [AZD फॉर बिगिनर्स](../../README.md) | **⏱️ अवधि**: 2-3 घंटे पढ़ाई; डिप्लॉयमेंट अभ्यास के लिए अतिरिक्त समय दें | **⭐ जटिलता**: मध्यवर्ती

---

## अवलोकन

यह अध्याय Bicep टेम्पलेट्स, संसाधन प्राविजनिंग, और Azure डेवलपर CLI का उपयोग करके डिप्लॉयमेंट रणनीतियों के साथ इंफ्रास्ट्रक्चर ऐज कोड (IaC) पैटर्न को कवर करता है।

> कमांड और कॉन्फ़िगरेशन समीक्षा लक्ष्य: `azd 1.37.2` (नवंबर 2026)। समीक्षा के दौरान लाइव Azure प्राविजनिंग नहीं चलाया गया था।

## सीखने के उद्देश्य

इस अध्याय को पूरा करके, आप:
- Bicep टेम्पलेट संरचना और सिंटैक्स को समझेंगे
- `azd provision` के साथ Azure संसाधनों का प्राविजन करेंगे
- `azd deploy` के साथ एप्लिकेशन डिप्लॉय करेंगे
- ब्लू-ग्रीन और रोलिंग डिप्लॉयमेंट रणनीतियों को लागू करेंगे

---

## 📚 पाठ्यक्रम

| # | पाठ | विवरण | समय |
|---|--------|-------------|------|
| 1 | [संसाधन प्राविजनिंग](provisioning.md) | AZD के साथ Azure संसाधन प्रबंधन | 45 मिनट |
| 2 | [डिप्लॉयमेंट गाइड](deployment-guide.md) | एप्लिकेशन डिप्लॉयमेंट रणनीतियां | 45 मिनट |
| 3 | [अपना स्वयं का टेम्पलेट बनाना](custom-templates.md) | पुन: उपयोग योग्य azd टेम्पलेट्स बनाएं और प्रकाशित करें | 30 मिनट |

---

## 🚀 त्वरित प्रारंभ

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

## 🔧 आवश्यक कमांड

| कमांड | विवरण |
|---------|-------------|
| `azd init` | प्रोजेक्ट प्रारंभ करें |
| `azd provision` | Azure संसाधन बनाएं |
| `azd deploy` | एप्लिकेशन कोड डिप्लॉय करें |
| `azd up` | प्राविजन + डिप्लॉय |
| `azd down` | सभी संसाधन हटाएं |

---

## 🔗 नेविगेशन

| दिशा | अध्याय |
|-----------|---------|
| **पिछला** | [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/README.md) |
| **आगामी** | [अध्याय 5: मल्टी-एजेंट समाधान](../chapter-05-multi-agent/README.md) |

---

## 📖 संबंधित संसाधन

- [प्रारंभिक-डिप्लॉयमेंट जांच](../chapter-06-pre-deployment/README.md)
- [कंटेनर ऐप उदाहरण](../../examples/container-app/README.md)
- [डेटाबेस ऐप उदाहरण](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->