# 1. Choose a Template

!!! tip "BY THE END OF THIS MODULE YOU WILL BE ABLE"

    - [ ] Tok wetin AZD templates be
    - [ ] Find and use AZD templates for AI
    - [ ] Start wit the AI Agents template
    - [ ] **Lab 1:** AZD Quickstart in Codespaces or a dev container

---

## 1. A Builder Analogy

To build modern enterprise-ready AI application _from scratch_ fit dey heavy. E small like you dey build your new house by yourself, brick by brick. Yes, e fit happen! But e no be the best waya to achieve wetin you want!

Instead, we dey often start with existing _design blueprint_, and work wit architect make e customize am to our own requirements. And na this approachto we suppose use when we dey build intelligent applications. First, find correct design architecture wey match your problem. Then work wit solution architect make e customize and develop solution for your specific scenario.

But where we go find these design blueprints? And how we go find architect wey go ready teach us how to customize and deploy these blueprints by ourselves? For this workshop, we go answer those questions by introducing three technologies:

1. [Azure Developer CLI](https://aka.ms/azd) - na open-source tool wey dey accelerate developer path from local development (build) go cloud deployment (ship).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - standardized open-source repositories wey get sample code, infrastructure and configuration files for deploying AI solution architecture.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - coding agent wey base for Azure knowledge, wey fit guide us to navigate codebase and make changes - using normal language.

With these tools for hand, we fit now _discover_ the correct template, _deploy_ am to check say e dey work, and _customize_ am make e fit our specific scenarios. Make we dive in learn how dem dey work.


---

## 2. Azure Developer CLI

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (or `azd`) na open-source commandline tool wey fit speed up your code-to-cloud journey with developer-friendly commands wey dey work consistent across your IDE (development) and CI/CD (devops) environments.

With `azd`, your deployment journey fit be simple like:

- `azd init` - Initializes a new AI project from an existing AZD template.
- `azd up` - Provisions infrastructure and deploy your application in one step.
- `azd monitor` - Get real-time monitoring and diagnostics for your deployed application.
- `azd pipeline config` - Setup CI/CD pipelines to automate deployment to Azure.

**🎯 | EXERCISE**: <br/> Explore the `azd` commandline tool for your current workshop environment now. This fit be GitHub Codespaces, a dev container, or local clone wey get all prerequisites. Start by typing this command make you see wetin the tool fit do:

```bash title="" linenums="0"
azd help
```

![How e dey flow](../../../../../translated_images/pcm/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. The AZD Template

For `azd` make this thing work, e need sabi the infrastructure to provision, the configuration settings to enforce, and the application to deploy. Na here [AZD templates](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) come enter.

AZD templates na open-source repositories wey combine sample code with infrastructure and configuraton files wey you need to deploy the solution architecture.
By using an _Infrastructure-as-Code_ (IaC) approach, dem allow template resource definitions and configuration settings to dey under version control (just like the app source code) - this one dey create reusable and consistent workflows for everybody wey dey use the project.

When you dey create or reuse AZD template for _your_ scenario, reason these questions:

1. Wetin you dey build? → Get template wey get starter code for that scenario?
1. How your solution dey architected? → Get template wey get the necessary resources?
1. How your solution dey deployed? → Think `azd deploy` wit pre/post-processing hooks!
1. How you fit optimize am more? → Think built-in monitoring and automation pipelines!

**🎯 | EXERCISE**: <br/> 
Visit the [Awesome AZD](https://azure.github.io/awesome-azd/) gallery and use the filters make you explore the 250+ templates wey dey available now. Try find one wey match _your_ scenario requirements.

![Code](../../../../../translated_images/pcm/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI App Templates

For AI-powered applications, Microsoft dey provide special templates wey feature **Microsoft Foundry** and **Foundry Agents**. These templates dey accelerate your way to build intelligent, production-ready applications.

### Microsoft Foundry & Foundry Agents Templates

Select template wey dey below make you deploy. Each template dey available on [Awesome AZD](https://azure.github.io/awesome-azd/) and you fit initialize am with one command.

| Template | Description | Deploy Command |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Chat application wey use Retrieval Augmented Generation with Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Build AI agents wit Foundry Agents for autonomous task execution | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Coordinate many Foundry Agents for complex workflows | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Extract and analyze documents using Microsoft Foundry models | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Build smart chatbots wit Microsoft Foundry integration | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Generate images using DALL-E through Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | AI agents wey use Semantic Kernel with Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Multi-agent systems wey dey use AutoGen framework | `azd init -t azure-samples/autogen-multi-agent` |

### Quick Start

1. **Browse templates**: Visit [https://azure.github.io/awesome-azd/] and filter by `AI`, `Agents`, or `Microsoft Foundry`
2. **Select your template**: Choose one wey match your use case
3. **Initialize**: Run the `azd init` command for the template wey you choose
4. **Deploy**: Run `azd up` make e provision and deploy

**🎯 | EXERCISE**: <br/>
Pick one of the templates wey dey above based on your scenario:

- **Building a chatbot?** → Start wit **AI Chat with RAG** or **Conversational AI Bot**
- **Need autonomous agents?** → Try **Foundry Agent Service Starter** or **Multi-Agent Orchestration**
- **Processing documents?** → Use **AI Document Intelligence**
- **Want AI coding assistance?** → Check **Semantic Kernel Agent** or **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Explore More Templates"
    The [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) get 250+ templates. Use the filters make you find templates wey match your specific requirements for language, framework, and Azure services.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate with AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make am accurate, abeg sabi say automated translations fit get errors or wrong parts. The original document for im native language suppose be the main authority. For critical information, make you use professional human translation. We no dey liable for any misunderstandings or misinterpretations wey fit come from using this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->