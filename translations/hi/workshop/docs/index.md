# AZD for AI Developers Workshop

> मान्य किया गया `azd 1.25.6` के साथ जून 2026 में।
> 
> [!IMPORTANT]  
> **यह कार्यशाला एक वर्कशॉप गाइड के साथ instrumented है जिसे आप अपने स्थानीय ब्राउज़र में पूर्वावलोकन कर सकते हैं। शुरू करने के लिए, रेपो को GitHub Codespaces, एक dev container, या MkDocs स्थापित किए हुए एक स्थानीय क्लोन में खोलें—फिर तब तक प्रतीक्षा करें जब तक आप एक सक्रिय VS Code टर्मिनल नहीं देखते और टाइप करें:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **आपको ब्राउज़र में पूर्वावलोकन पेज खोलने के लिए एक पॉप-अप डायलॉग दिखाई देना चाहिए।**

स्वागत है Azure Developer CLI (AZD) सीखने के लिए आधारित हैंड्स-ऑन वर्कशॉप में, जो AI एप्लिकेशन डिप्लॉयमेंट पर केंद्रित है। यह कार्यशाला आपको AZD टेम्पलेट्स का व्यावहारिक समझ 3 चरणों में प्राप्त करने में मदद करती है:

1. **Discovery** - उस टेम्पलेट को खोजें जो आपके लिए सही है।
1. **Deployment** - डिप्लॉय करें और सत्यापित करें कि यह काम करता है
1. **Customization** - संशोधित करें और इसे अपना बनाएं!

इस कार्यशाला के दौरान, आपको कोर डेवलपर टूल्स और वर्कफ़्लोज़ से भी परिचित कराया जाएगा, ताकि आप अपने एंड-टू-एंड विकास यात्रा को सुव्यवस्थित कर सकें।

| | | 
|:---|:---|
| **📚 पाठ्यक्रम मुख्य पृष्ठ**| [AZD For Beginners](../README.md)|
| **📖 दस्तावेज़ीकरण** | [AI टेम्पलेट्स के साथ आरंभ करें](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI टेम्पलेट्स** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 अगले कदम** | [चुनौती लें](#workshop-challenge) |
| | |

## कार्यशाला अवलोकन

**अवधि:** 3-4 घंटे  
**स्तर:** शुरुआती से मध्यवर्ती  
**पूर्वापेक्षाएँ:** Azure, AI अवधारणाओं, VS Code और कमांड-लाइन टूल्स की परिचितता।

यह एक हैंड्स-ऑन कार्यशाला है जहाँ आप करके सीखते हैं। एक बार जब आप अभ्यास पूरे कर लेंगे, तो हम अनुशंसा करते हैं कि आप Security और Productivity सर्वोत्तम प्रथाओं में अपनी सीख जारी रखने के लिए AZD For Beginners पाठ्यक्रम की समीक्षा करें।

| Time| Module  | Objective |
|:---|:---|:---|
| 15 mins | Introduction | Set the stage, understand the goals |
| 30 mins | Select AI Template | Explore options and pick starter | 
| 30 mins | Validate AI Template | Deploy default solution to Azure |
| 30 mins | Deconstruct AI Template | Explore structure and configuration |
| 30 mins | Configure AI Template | Activate and try available features |
| 30 mins | Customize AI Template | Adapt the template to your needs |
| 30 mins | Teardown Infrastructure | Cleanup and release resources |
| 15 mins | Wrap-Up & Next Steps | Learning resources, Workshop challenge |
| | |

## आप क्या सीखेंगे

AZD टेम्पलेट को एक लर्निंग सैंडबॉक्स के रूप में सोचें ताकि आप Microsoft Foundry पर एंड-टू-एंड विकास के विभिन्न क्षमता और टूल्स का अन्वेषण कर सकें। इस कार्यशाला के अंत तक, आपको इस संदर्भ में विभिन्न टूल्स और अवधारणाओं की सहज समझ होनी चाहिए।

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | Understand tool commands and workflows|
| **AZD Templates**| Understand project structure and config|
| **Azure AI Agent**| Provision & deploy Microsoft Foundry project  |
| **Azure AI Search**| Enable context engineering with agents |
| **Observability**| Explore tracing, monitoring and evaluations |
| **Red Teaming**| Explore adversarial testing and mitigations |
| | |

## कार्यशाला मॉड्यूल

शुरू करने के लिए तैयार हैं? कार्यशाला मॉड्यूल में नेविगेट करें:

- [Module 1: Select AI Template](instructions/1-Select-AI-Template.md)
- [Module 2: Validate AI Template](instructions/2-Validate-AI-Template.md) 
- [Module 3: Deconstruct AI Template](instructions/3-Deconstruct-AI-Template.md)
- [Module 4: Configure AI Template](instructions/4-Configure-AI-Template.md)
- [Module 5: Customize AI Template](instructions/5-Customize-AI-Template.md)
- [Module 6: Teardown Infrastructure](instructions/6-Teardown-Infrastructure.md)
- [Module 7: Wrap-up & Next Steps](instructions/7-Wrap-up.md)

## प्रतिक्रिया है?

इस रेपो पर एक इश्यू पोस्ट करें (इसे टैग करें `Workshop`) या हमारे साथ जुड़ें [Discord](https://aka.ms/foundry/discord) पर और हमारे `#get-help` चैनल में पोस्ट करें

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->