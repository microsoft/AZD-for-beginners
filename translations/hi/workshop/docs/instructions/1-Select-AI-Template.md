# 1. एक टेम्प्लेट चुनें

!!! tip "BY THE END OF THIS MODULE YOU WILL BE ABLE TO"

    - [ ] AZD टेम्पलेट क्या हैं, इसका वर्णन करें
    - [ ] AI के लिए AZD टेम्पलेट खोजें और उपयोग करें
    - [ ] AI Agents टेम्पलेट के साथ शुरुआत करें
    - [ ] **Lab 1:** GitHub Codespaces के साथ AZD क्विकस्टार्ट

---

## 1. एक बिल्डर उपमा

Building a modern enterprise-ready AI application _from scratch_ can be daunting. It's a little bit like building your new home on your own, brick by brick. Yes, it can be done! But it is not the most effective way to get the desired end result! 

Instead, we often start with an existing _डिज़ाइन ब्लूप्रिंट_, and work with an architect to customize it to our personal requirements. And that's exactly the approachto take when building intelligent applications. First, find a good design architecture that fits your problem space. Then work with a solution architect to customize and develop the solution for your specific scenario.

But where can we find these design blueprints? And how do we find an architect that is willing to teach us how to customize and deploy these blueprints on our own? In this workshop, we answer those questions by introducing you to three technologies:

1. [Azure Developer CLI](https://aka.ms/azd) - एक ओपन-सोर्स टूल जो लोकल डेवलपमेंट (build) से क्लाउड डिप्लॉयमेंट (ship) तक डेवलपर के रास्ते को तेज़ करता है।
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - मानकीकृत ओपन-सोर्स रिपॉज़िटरीज़ जो एआई सॉल्यूशन आर्किटेक्चर तैनात करने के लिए सैम्पल कोड, इन्फ्रास्ट्रक्चर और कॉन्फिगरेशन फ़ाइलें रखती हैं।
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - Azure ज्ञान पर आधारित एक कोडिंग एजेंट, जो प्राकृतिक भाषा का उपयोग करके हमें कोडबेस में नेविगेट करने और परिवर्तन करने में मार्गदर्शन कर सकता है।

With these tools in hand, we can now _discover_ the right template, _deploy_ it to validate it works, and _customize_ it to suit our specific scenarios. Let's dive in and learn how these work.


---

## 2. Azure Developer CLI

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (or `azd`) is an open-source commandline tool that can speed up your code-to-cloud journey with a set of developer-friendly commands that work consistently across your IDE (development) and CI/CD (devops) environments.

With `azd`, your deployment journey can be as simple as:

- `azd init` - एक मौजूदा AZD टेम्पलेट से एक नया AI प्रोजेक्ट इनिशियलाइज़ करता है।
- `azd up` - एक ही चरण में इन्फ्रास्ट्रक्चर प्रोविजन करता है और आपके एप्लिकेशन को डिप्लॉय करता है।
- `azd monitor` - आपके डिप्लॉय किए गए एप्लिकेशन के लिए रीयल-टाइम मॉनिटरिंग और डायग्नोस्टिक्स प्राप्त करें।
- `azd pipeline config` - Azure पर डिप्लॉयमेंट को स्वचालित करने के लिए CI/CD पाइपलाइनों को सेटअप करें।

**🎯 | EXERCISE**: <br/> अपने GitHub Codespaces वातावरण में अभी `azd` कमांडलाइन टूल का अन्वेषण करें। यह देखने के लिए कि टूल क्या कर सकता है, इस कमांड को टाइप करके शुरू करें:

```bash title="" linenums="0"
azd help
```

![फ़्लो](../../../../../translated_images/hi/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. AZD टेम्पलेट

For `azd` to achieve this, it needs to know the infrastructure to provision, the configuration settings to enforce, and the application to deploy. This is where [AZD templates](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) come in. 

AZD टेम्पलेट ओपन-सोर्स रिपॉज़िटरीज़ हैं जो सॉल्यूशन आर्किटेक्चर को डिप्लॉय करने के लिए आवश्यक सैम्पल कोड को इन्फ्रास्ट्रक्चर और कॉन्फ़िगरेशन फ़ाइलों के साथ मिलाती हैं।
By using an _Infrastructure-as-Code_ (IaC) approach, they allow template resource definitions and configuration settings to be version-controller (just like the app source code) - creating reusable and consistent workflows across users of that project.

When creating or reusing an AZD template for _your_ scenario, consider these questions:

1. What are you building? → क्या उस परिदृश्य के लिए कोई टेम्पलेट मौजूद है जिसमें प्रारंभिक कोड हो?
1. How is your solution architected? → क्या कोई टेम्पलेट है जिसमें आवश्यक संसाधन हों?
1. How is your solution deployed? → Think `azd deploy` with pre/post-processing hooks!
1. How can you optimize it further? → Think built-in monitoring and automation pipelines!

**🎯 | EXERCISE**: <br/> 
Visit the [Awesome AZD](https://azure.github.io/awesome-azd/) gallery and use the filters to explore the 250+ templates currently available. See if you can find on that aligns to _your_ scenario requirements.

![कोड](../../../../../translated_images/hi/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI ऐप टेम्पलेट्स

For AI-powered applications, Microsoft provides specialized templates featuring **Microsoft Foundry** and **Foundry Agents**. These templates accelerate your path to building intelligent, production-ready applications.

### Microsoft Foundry & Foundry Agents Templates

Select a template below to deploy. Each template is available on [Awesome AZD](https://azure.github.io/awesome-azd/) and can be initialized with a single command.

| टेम्पलेट | विवरण | डिप्लॉय कमांड |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Microsoft Foundry का उपयोग करके Retrieval Augmented Generation के साथ चैट एप्लिकेशन | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | स्वायत्त कार्य निष्पादन के लिए Foundry Agents के साथ AI एजेंट बनाएं | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | जटिल वर्कफ़्लोज़ के लिए कई Foundry Agents का समन्वय करें | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Microsoft Foundry मॉडल्स के साथ दस्तावेज़ों को एक्सट्रैक्ट और एनालाइज करें | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Microsoft Foundry इंटीग्रेशन के साथ बुद्धिमान चैटबॉट बनाएं | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Microsoft Foundry के माध्यम से DALL-E का उपयोग करके इमेज जनरेट करें | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | Foundry Agents के साथ Semantic Kernel का उपयोग करते हुए AI एजेंट | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | AutoGen फ्रेमवर्क का उपयोग करते हुए मल्टी-एजेंट सिस्टम | `azd init -t azure-samples/autogen-multi-agent` |

### त्वरित शुरुआत

1. **टेम्पलेट ब्राउज़ करें**: Visit [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) और `AI`, `Agents`, या `Microsoft Foundry` द्वारा फ़िल्टर करें
2. **अपना टेम्पलेट चुनें**: Choose one that matches your use case
3. **इनिशियलाइज़ करें**: Run the `azd init` command for your chosen template
4. **डिप्लॉय**: Run `azd up` to provision and deploy

**🎯 | EXERCISE**: <br/>
Select one of the templates above based on your scenario:

- **क्या आप चैटबॉट बना रहे हैं?** → **AI Chat with RAG** या **Conversational AI Bot** से शुरू करें
- **क्या आपको स्वायत्त एजेंट चाहिए?** → **Foundry Agent Service Starter** या **Multi-Agent Orchestration** आज़माएँ
- **दस्तावेज़ प्रोसेस कर रहे हैं?** → **AI Document Intelligence** का उपयोग करें
- **क्या आप AI कोडिंग सहायता चाहते हैं?** → **Semantic Kernel Agent** या **AutoGen Multi-Agent** को एक्सप्लोर करें

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Explore More Templates"
    The [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) contains 250+ templates. Use the filters to find templates matching your specific requirements for language, framework, and Azure services.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यह दस्तावेज़ AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) का उपयोग करके अनूदित किया गया है। हम सटीकता के लिए प्रयास करते हैं, पर कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या असंगतियाँ हो सकती हैं। मूल दस्तावेज़ को उसकी मूल भाषा में अधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सलाह दी जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->