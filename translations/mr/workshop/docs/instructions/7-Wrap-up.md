# 7. समारोप आणि पुढील टप्पे

!!! tip "मुख्य शिकवणूक संदेश आहेत"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. तुम्ही काय साध्य केले

अभिनंदन! या कार्यशाळेत, तुम्ही यशस्वीपणे खालील गोष्टी केल्या आहेत:

| मॉड्यूल | साध्य केलेले काम |
|:---|:---|
| **मॉड्यूल 1** | Azure Developer CLI शोधले आणि AI टेम्प्लेट निवडला |
| **मॉड्यूल 2** | संपूर्ण AI एजंट्स सोल्यूशन डिप्लॉय आणि प्रमाणीकरण केले |
| **मॉड्यूल 3** | टेम्प्लेटचे विघटन करून त्याची आर्किटेक्चर समजावून घेतली |
| **मॉड्यूल 4** | `azure.yaml` कॉन्फिगरेशन आणि जीवनचक्र हुक्सचा शोध घेतला |
| **मॉड्यूल 5** | तुमच्या स्वतःच्या परिदृष्यांसाठी टेम्प्लेट सानुकूलित केले |
| **मॉड्यूल 6** | सुरक्षितपणे इन्फ्रास्ट्रक्चर काढले आणि संसाधने व्यवस्थापित केली |

---

## 2. प्रमुख संकल्पना आत्मसात केल्या

### Azure Developer CLI (azd)
- `azd init` - टेम्प्लेट्स पासून प्रकल्प प्रारंभ करा
- `azd up` - एका आदेशात Provision आणि deploy करा
- `azd env` - पर्यावरणीय चल निवड्णे व्यवस्थापित करा
- `azd down` - संसाधने सुरक्षितपणे साफ करा

### AZD टेम्प्लेट रचना
- `azure.yaml` - कॉन्फिगरेशन आणि डिप्लॉयमेंट हुक्स
- `infra/` - बाइसेप इन्फ्रास्ट्रक्चर-एज-कोड
- `src/` - अ‍ॅप्लिकेशन स्रोत कोड
- `scripts/` - ऑटोमेशन आणि सेटअप स्क्रिप्ट्स

### Microsoft Foundry क्षमताएं
- बुद्धिमान सहाय्यकांसाठी AI एजंट सेवा
- ज्ञान पुनर्प्राप्तीसाठी फाइल शोध आणि Azure AI शोध
- अंगभूत ट्रेसिंग, मॉनिटरिंग, आणि मूल्यांकन
- AI सुरक्षा प्रमाणीकरणासाठी रेड टीमिंग

---

## 3. तुमचा शिक्षण प्रवास सुरू ठेवा

### शिफारस केलेले पुढील टप्पे

| मार्ग | स्रोत | वेळ |
|:---|:---|:---|
| **पूर्ण कोर्स** | [AZD for Beginners Curriculum](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | स्वत:च्या गतीने |
| **दुसरा टेम्प्लेट वापरून पहा** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1-2 तास |
| **सखोल अभ्यास** | [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | चालू आहे |
| **समुदाय** | [Azure Discord](https://aka.ms/foundry/discord) | आजच सहभागी व्हा! |

### पुढे वापरासाठी सुचवलेले टेम्प्लेट्स

1. **[AI Chat सह सुरू करा](https://github.com/Azure-Samples/get-started-with-ai-chat)** - तुमच्या डेटासह मूलभूत चॅट
2. **[Azure Search OpenAI डेमो](https://github.com/Azure-Samples/azure-search-openai-demo)** - प्रगत RAG नमुने
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - एंटरप्राइझ रिटेल परिदृश्य

---

## 4. कार्यशाळा आव्हान

तुमच्या कौशल्याची चाचणी द्यायला तयार आहात का? हे आव्हानं वापरून पहा:

| आव्हान | वर्णन | कठीणाई |
|:---|:---|:---|
| **1. मल्टी-एजंट परिदृश्य** | वेगळ्या उद्योगासाठी डिप्लॉय आणि सानुकूलित करा (उदा., आरोग्यसेवा, वित्त) | ⭐⭐ |
| **2. सानुकूल ज्ञान आधार** | तुमची स्वतःची डेटा फाइल्स जोडा आणि सानुकूल शोध निर्देशांक तयार करा | ⭐⭐⭐ |
| **3. उत्पादन डिप्लॉयमेंट** | GitHub Actions सह CI/CD सेट अप करा वापरून `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. तुमचे अभिप्राय द्या

तुमचा अभिप्राय आम्हाला ही कार्यशाळा सुधारण्यास मदत करतो!

- **GitHub Issues**: [अभिप्राय नोंदवा](https://github.com/microsoft/azd-for-beginners/issues) - टॅग सह `Workshop`  
- **Discord**: [Microsoft Foundry Discord](https://aka.ms/foundry/discord) मध्ये सामील व्हा - मध्ये पोस्ट करा `#get-help`  
- **योगदान**: पुल विनंत्या सादर करून कार्यशाळा सुधारण्यात मदत करा!  

---

## धन्यवाद! 🎉

AI डेव्हलपर्स वर्कशॉपसाठी AZD पूर्ण केल्याबद्दल धन्यवाद. आम्हाला आशा आहे की या अनुभवाने आपल्याला Azure वर AI अनुप्रयोग तयार करण्यासाठी आणि तैनात करण्यासाठी कौशल्ये आणि आत्मविश्वास मिळवून दिला आहे.

**बांधकाम करत राहा, शिकत राहा, आणि Azure AI डेव्हलपर समुदायात आपले स्वागत आहे!**

---

| | |
|:---|:---|
| **📚 अभ्यासक्रम मुख्यपृष्ठ** | [AZD नवशिक्यांसाठी](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 दस्तऐवज** | [Azure Developer CLI दस्तऐवज](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI टेम्प्लेट्स** | [Microsoft Foundry टेम्प्लेट्स](https://ai.azure.com/templates) |
| **💬 समुदाय** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->