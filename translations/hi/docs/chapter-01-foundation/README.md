# अध्याय 1: आधार और त्वरित शुरुआत

**📚 पाठ्यक्रम**: [शुरुआत के लिए AZD](../../README.md) | **⏱️ अवधि**: 30-45 मिनट | **⭐ जटिलता**: शुरुआती

---

## अवलोकन

यह अध्याय Azure Developer CLI (azd) के मौलिक सिद्धांतों का परिचय कराता है। आप मुख्य अवधारणाएँ सीखेंगे, टूल्स स्थापित करेंगे, और अपना पहला एप्लिकेशन Azure पर तैनात करेंगे।

> `azd 1.25.6` के साथ जून 2026 में सत्यापित।

## सीखने के उद्देश्य

इस अध्याय को पूरा करके, आप:
- समझेंगे कि Azure Developer CLI क्या है और यह Azure CLI से कैसे अलग है
- अपने प्लेटफ़ॉर्म पर AZD स्थापित और कॉन्फ़िगर करना सीखेंगे
- `azd up` के साथ अपना पहला एप्लिकेशन Azure पर तैनात करेंगे
- `azd down` के साथ संसाधनों को साफ़ करेंगे

---

## 📚 पाठ

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [AZD मूल बातें](azd-basics.md) | मूल अवधारणाएँ, शब्दावली, और प्रोजेक्ट संरचना | 15 मिनट |
| 2 | [इंस्टॉलेशन और सेटअप](installation.md) | प्लेटफ़ॉर्म-विशिष्ट इंस्टॉलेशन गाइड | 10 मिनट |
| 3 | [आपकी पहली परियोजना](first-project.md) | हैंड्स-ऑन: Azure पर एक वेब ऐप तैनात करें | 20 मिनट |
| 4 | [अपना ऐप लाएँ](bring-your-own-app.md) | अपने मौजूदा प्रोजेक्ट में azd जोड़ें | 15 मिनट |
| 5 | [डेव कंटेनर और Codespaces](dev-containers.md) | डेव कंटेनरों के साथ पुनरुत्पादन योग्य azd वातावरण | 15 मिनट |

---

## ✅ यहाँ से शुरू करें: अपनी सेटअप सत्यापित करें

Before you begin, confirm that your local machine is ready for the Chapter 1 template:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

यदि स्क्रिप्ट किसी टूल के गायब होने की रिपोर्ट करती है, तो पहले उन समस्याओं को ठीक करें और फिर अध्याय जारी रखें।

---

## 🚀 त्वरित शुरुआत

```bash
# स्थापना की जाँच करें
azd version

# AZD के लिए प्रमाणीकृत करें
# वैकल्पिक: यदि आप Azure CLI कमांड सीधे चलाने की योजना बना रहे हैं तो az login करें
azd auth login

# अपना पहला ऐप तैनात करें
azd init --template todo-nodejs-mongo
azd up

# काम पूरा होने पर साफ़ करें
azd down --force --purge
```

---

## ✅ सफलता के मानदंड

इस अध्याय को पूरा करने के बाद, आप सक्षम होंगे:

```bash
azd version              # इंस्टॉल किए गए संस्करण को दिखाता है
azd init --template todo-nodejs-mongo  # प्रोजेक्ट को प्रारंभ करता है
azd up                   # Azure पर तैनात करता है
azd show                 # चल रहे ऐप का URL दिखाता है
azd down --force --purge # संसाधनों को साफ़ करता है
```

---

## 🔗 नेविगेशन

| Direction | Chapter |
|-----------|---------|
| **Next** | [Chapter 2: AI-First Development](../chapter-02-ai-development/README.md) |
| **Skip to** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |

---

## 📖 संबंधित संसाधन

- [Command Cheat Sheet](../../resources/cheat-sheet.md)
- [अक्सर पूछे जाने वाले प्रश्न (FAQ)](../../resources/faq.md)
- [शब्दावली](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->