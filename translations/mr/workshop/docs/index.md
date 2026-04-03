# AZD for AI Developers Workshop

> Validated against `azd 1.23.12` मार्च 2026 मध्ये.

> [!IMPORTANT]  
> **हे वर्कशॉप एका वर्कशॉप मार्गदर्शकासह सुसज्ज आहे ज्याचे तुम्ही आपल्या स्थानिक ब्राउझरमध्ये पूर्वदृश्य पाहू शकता. सुरू करण्यासाठी, रेपो GitHub Codespaces, dev container किंवा MkDocs स्थापित असलेल्या स्थानिक क्लोनमध्ये उघडा — नंतर सक्रिय VS Code टर्मिनल दिसेपर्यंत प्रतीक्षा करा आणि टाइप करा:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **ब्राउझरमध्ये पूर्वदृश्य पृष्ठ उघडण्यासाठी तुम्हाला एक पॉप-अप संवाद दिसला पाहिजे.**

Welcome to the hands-on workshop for learning Azure Developer CLI (AZD) with a focus on AI application deployment. This workshop helps you gain an applied understanding of AZD templates in 3 steps:

1. **Discovery** - find the template that is right for you.
1. **Deployment** - deploy and validate that it works
1. **Customization** - modify and iterate to make it yours!

Over the course of this workshop, you will also be introduced to core developer tools and workflows, to help you streamline your end-to-end development journey.

| | | 
|:---|:---|
| **📚 अभ्यासक्रम मुखपृष्ठ**| [AZD प्रारंभिकांसाठी](../README.md)|
| **📖 दस्तऐवजीकरण** | [AI टेम्पलेट्ससह प्रारंभ करा](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI टेम्पलेट्स** | [Microsoft Foundry टेम्पलेट्स](https://ai.azure.com/templates) |
|**🚀 पुढील पावल्य़ा** | [आव्हान घ्या](#workshop-challenge) |
| | |

## Workshop Overview

**Duration:** 3-4 hours  
**Level:** Beginner to Intermediate  
**Prerequisites:** Azure, AI संकल्पना, VS Code & कमांड-लाइन साधनांची ओळख.

हे एक हँड्स-ऑन वर्कशॉप आहे जिथे तुम्ही कृती करून शिकता. सराव पूर्ण केल्यानंतर, आम्ही तुम्हाला AZD प्रारंभिकांसाठी अभ्यासक्रम पुनरावलोकन करण्याचा सल्ला देतो, जेणेकरून तुम्ही सुरक्षा आणि उत्पादकता चांगल्या पद्धतींबद्दल पुढील शिकण्याच्या प्रवासास सुरू ठेवू शकता.

| Time| Module  | Objective |
|:---|:---|:---|
| 15 mins | परिचय | भूमिका मांडणे, उद्दिष्टे समजून घेणे |
| 30 mins | AI टेम्पलेट निवडा | पर्याय तपासा आणि प्रारंभीचा टेम्पलेट निवडा | 
| 30 mins | AI टेम्पलेट तपासा | मूळ (डिफॉल्ट) सोल्यूशन Azure वर तैनात करा |
| 30 mins | AI टेम्पलेट विघटन | रचना आणि कॉन्फिगरेशन तपासा |
| 30 mins | AI टेम्पलेट कॉन्फिगर करा | उपलब्ध वैशिष्ट्ये सक्रिय करा आणि प्रयत्न करा |
| 30 mins | AI टेम्पलेट सानुकूलित करा | टेम्पलेट आपल्या गरजेनुसार अनुकूल करा |
| 30 mins | इन्फ्रास्ट्रक्चर काढून टाका | संसाधने क्लीनअप करा व मुक्त करा |
| 15 mins | समारोप व पुढील पावले | शिकण्याची साधने, वर्कशॉप आव्हान |
| | |

## What You'll Learn

AZD टेम्पलेटला Microsoft Foundry वर एंड-टू-एंड डेव्हलपमेंटसाठी विविध क्षमता आणि साधने शोधण्यासाठी एक शिक्षण सॅंडबॉक्स म्हणून विचार करा. या वर्कशॉपच्या शेवटी, तुम्हाला या संदर्भातील विविध साधने आणि संकल्पनांची अंतर्ज्ञानी समज प्राप्त झालेली असावी.

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | साधनाचे कमांड आणि कार्यप्रवाह समजून घ्या|
| **AZD Templates**| प्रोजेक्ट संरचना आणि कॉन्फिगरेशन समजून घ्या|
| **Azure AI Agent**| Microsoft Foundry प्रकल्पाची प्रोव्हिजन आणि डिप्लॉय करा  |
| **Azure AI Search**| एजंटसह संदर्भ अभियांत्रिकी सक्षम करा |
| **Observability**| ट्रेसिंग, मॉनिटरिंग आणि मूल्यमापन तपासा |
| **Red Teaming**| प्रतिद्वंदी चाचणी आणि प्रतिबंधक उपाय तपासा |
| | |

## Workshop Modules

Ready to get started? Navigate through the workshop modules:

- [मॉड्युल 1: AI टेम्पलेट निवडा](instructions/1-Select-AI-Template.md)
- [मॉड्युल 2: AI टेम्पलेट तपासा](instructions/2-Validate-AI-Template.md) 
- [मॉड्युल 3: AI टेम्पलेट विघटन](instructions/3-Deconstruct-AI-Template.md)
- [मॉड्युल 4: AI टेम्पलेट कॉन्फिगर करा](instructions/4-Configure-AI-Template.md)
- [मॉड्युल 5: AI टेम्पलेट सानुकूलित करा](instructions/5-Customize-AI-Template.md)
- [मॉड्युल 6: इन्फ्रास्ट्रक्चर काढून टाका](instructions/6-Teardown-Infrastructure.md)
- [मॉड्युल 7: समारोप व पुढील पावले](instructions/7-Wrap-up.md)

## Have feedback?

या रेपोवर एक इश्यू पोस्ट करा (ते `Workshop` म्हणून टॅग करा) किंवा आमच्यात सामील व्हा [Discord](https://aka.ms/foundry/discord) वर आणि आमच्या `#get-help` चॅनेलवर पोस्ट करा

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, परंतु कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये त्रुटी किंवा अचूकतेच्या अपूर्णतेचा समावेश असू शकतो. मूळ दस्तऐवज त्याच्या स्थानिक भाषेत अधिकृत स्रोत समजला पाहिजे. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवाद शिफारसीय आहे. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थाच्या व्याख्यांसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->