# 7. समापन और अगले कदम

!!! tip "मुख्य संदेश हैं"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. आपने क्या किया

बधाई हो! इस कार्यशाला में, आपने सफलतापूर्वक:

| मॉड्यूल | उपलब्धि |
|:---|:---|
| **मॉड्यूल 1** | Azure Developer CLI खोजा और एक AI टेम्प्लेट चुना |
| **मॉड्यूल 2** | एक पूर्ण AI एजेंट समाधान तैनात और सत्यापित किया |
| **मॉड्यूल 3** | टेम्प्लेट को उसके वास्तुकरण को समझने के लिए विखंडित किया |
| **मॉड्यूल 4** | `azure.yaml` कॉन्फ़िगरेशन और जीवनचक्र हुक्स का अन्वेषण किया |
| **मॉड्यूल 5** | अपने परिदृश्य के लिए टेम्प्लेट को अनुकूलित किया |
| **मॉड्यूल 6** | स्वच्छता से इंफ्रास्ट्रक्चर को हटाया और संसाधनों का प्रबंधन किया |

---

## 2. महत्वपूर्ण अवधारणाएं जो आप में निपुण हुईं

### Azure Developer CLI (azd)
- `azd init` - टेम्प्लेट से प्रोजेक्ट शुरू करना
- `azd up` - एक कमांड में प्रोविजन और तैनाती
- `azd env` - पर्यावरण चर प्रबंधन
- `azd down` - संसाधनों को सुरक्षित रूप से साफ करना

### AZD टेम्प्लेट संरचना
- `azure.yaml` - कॉन्फ़िगरेशन और तैनाती हुक्स
- `infra/` - Bicep इन्फ्रास्ट्रक्चर-एज-कोड
- `src/` - एप्लिकेशन स्रोत कोड
- `scripts/` - स्वचालन और सेटअप स्क्रिप्ट्स

### Microsoft Foundry की क्षमताएं
- बुद्धिमान सहायकों के लिए AI एजेंट सेवा
- ज्ञान पुनर्प्राप्ति के लिए फ़ाइल खोज और Azure AI खोज
- अंतर्निर्मित ट्रेसिंग, निगरानी और मूल्यांकन
- AI सुरक्षा सत्यापन के लिए रेड टीमिंग

---

## 3. अपनी सीखने की यात्रा जारी रखें

### अनुशंसित अगले कदम

| मार्ग | संसाधन | समय |
|:---|:---|:---|
| **पूरा कोर्स** | [AZD शुरूआती पाठ्यक्रम](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | स्व-अध्ययन |
| **अलग टेम्प्लेट आज़माएं** | [Microsoft Foundry टेम्प्लेट](https://ai.azure.com/templates) | 1-2 घंटे |
| **गहराई में जाएं** | [Azure Developer CLI दस्तावेज़](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | निरंतर |
| **समुदाय** | [Azure Discord](https://aka.ms/foundry/discord) | आज ही जुड़ें! |

### अगला आजमाने के लिए सुझाए गए टेम्प्लेट

1. **[AI चैट के साथ शुरू करें](https://github.com/Azure-Samples/get-started-with-ai-chat)** - अपनी डेटा के साथ बुनियादी चैट
2. **[Azure Search OpenAI डेमो](https://github.com/Azure-Samples/azure-search-openai-demo)** - उन्नत RAG पैटर्न
3. **[Contoso चैट](https://github.com/Azure-Samples/contoso-chat)** - एंटरप्राइज़ रिटेल परिदृश्य

---

## 4. कार्यशाला चुनौती

अपनी क्षमताओं का परीक्षण करने के लिए तैयार हैं? इन चुनौतियों को आजमाएं:

| चुनौती | विवरण | कठिनाई |
|:---|:---|:---|
| **1. मल्टी-एजेंट परिदृश्य** | एक अलग उद्योग (जैसे, स्वास्थ्य सेवा, वित्त) के लिए तैनात और अनुकूलित करें | ⭐⭐ |
| **2. कस्टम नॉलेज बेस** | अपने डेटा फ़ाइलें जोड़ें और एक कस्टम खोज सूचकांक बनाएं | ⭐⭐⭐ |
| **3. उत्पादन तैनाती** | `azd pipeline config` का उपयोग करके GitHub Actions के साथ CI/CD सेट करें | ⭐⭐⭐⭐ |

---

## 5. अपनी प्रतिक्रिया साझा करें

आपकी प्रतिक्रिया हमें इस कार्यशाला में सुधार करने में मदद करती है!

- **GitHub Issues**: [प्रतिपुष्टि पोस्ट करें](https://github.com/microsoft/azd-for-beginners/issues) - टैग के साथ `Workshop`
- **Discord**: [Microsoft Foundry Discord](https://aka.ms/foundry/discord) में शामिल हों - पोस्ट करें `#get-help`
- **योगदान**: पुल रिक्वेस्ट सबमिट करके कार्यशाला को बेहतर बनाने में मदद करें!

---

## धन्यवाद! 🎉

AZD for AI Developers कार्यशाला पूरी करने के लिए धन्यवाद। हमें उम्मीद है कि इस अनुभव ने आपको Azure पर AI अनुप्रयोगों को बनाने और तैनात करने के लिए आवश्यक कौशल और आत्मविश्वास प्रदान किया है।

**बनाते रहें, सीखते रहें, और Azure AI डेवलपर समुदाय में आपका स्वागत है!**

---

| | |
|:---|:---|
| **📚 कोर्स होम** | [AZD For Beginners](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 दस्तावेज़ीकरण** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI टेम्प्लेट्स** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 समुदाय** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->