<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-11-18T19:03:14+00:00",
  "source_file": "workshop/README.md",
  "language_code": "pcm"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Workshop Dey Under Construction 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Dis workshop still dey under active development.</strong><br>
      E fit no complete or e fit change. Abeg check back later for updates!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Last Updated: October 2025
      </span>
    </div>
  </div>
</div>

# AZD Workshop for AI Developers

Welcome to di hands-on workshop wey go teach you how to use Azure Developer CLI (AZD) to deploy AI applications. Dis workshop go help you sabi how to use AZD templates in 3 steps:

1. **Discovery** - find di template wey go fit you.
1. **Deployment** - deploy am and confirm say e dey work.
1. **Customization** - change am and make am your own!

For dis workshop, you go also learn about di main developer tools and workflows wey go help you make your development journey smooth from start to finish.

<br/>

## Browser-Based Guide

Di workshop lessons dey for Markdown. You fit check dem directly for GitHub - or you fit open browser-based preview like di screenshot below.

![Workshop](../../../translated_images/workshop.75906f133e6f8ba0.pcm.png)

To use dis option - fork di repository go your profile, then open GitHub Codespaces. Once di VS Code terminal don active, type dis command:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

After some seconds, you go see pop-up dialog. Select di option wey talk say `Open in browser`. Di web-based guide go open for new browser tab. Benefits of dis preview include:

1. **Built-in search** - find keywords or lessons quick quick.
1. **Copy icon** - hover over codeblocks to see di option.
1. **Theme toggle** - switch between dark and light themes.
1. **Get help** - click di Discord icon for footer to join!

<br/>

## Workshop Overview

**Duration:** 3-4 hours  
**Level:** Beginner to Intermediate  
**Prerequisites:** You need to sabi Azure, AI concepts, VS Code & command-line tools.

Dis na hands-on workshop wey you go learn by doing. After you finish di exercises, we go recommend make you check di AZD For Beginners curriculum to continue your learning journey about Security and Productivity best practices.

| Time| Module  | Objective |
|:---|:---|:---|
| 15 mins | [Introduction](docs/instructions/0-Introduction.md) | Understand di goals and set di stage |
| 30 mins | [Select AI Template](docs/instructions/1-Select-AI-Template.md) | Explore options and choose starter | 
| 30 mins | [Validate AI Template](docs/instructions/2-Validate-AI-Template.md) | Deploy default solution go Azure |
| 30 mins | [Deconstruct AI Template](docs/instructions/3-Deconstruct-AI-Template.md) | Check di structure and configuration |
| 30 mins | [Configure AI Template](docs/instructions/4-Configure-AI-Template.md) | Activate and test di features wey dey |
| 30 mins | [Customize AI Template](docs/instructions/5-Customize-AI-Template.md) | Change di template to fit your needs |
| 30 mins | [Teardown Infrastructure](docs/instructions/6-Teardown-Infrastructure.md) | Cleanup and release resources |
| 15 mins | [Wrap-Up & Next Steps](docs/instructions/7-Wrap-up.md) | Learning resources, Workshop challenge |

<br/>

## Wetin You Go Learn

Think of di AZD Template as learning sandbox wey you fit use explore different tools and capabilities for end-to-end development on Azure AI Foundry. By di end of dis workshop, you go sabi di tools and concepts well well.

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | Sabi di tool commands and workflows |
| **AZD Templates**| Understand project structure and config |
| **Azure AI Agent**| Provision & deploy Azure AI Foundry project  |
| **Azure AI Search**| Enable context engineering with agents |
| **Observability**| Check tracing, monitoring and evaluations |
| **Red Teaming**| Test for adversarial issues and fix dem |

<br/>

## Workshop Structure

Di workshop dey structured to carry you go from template discovery, to deployment, deconstruction, and customization - using di official [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) starter template as di base.

### [Module 1: Select AI Template](docs/instructions/1-Select-AI-Template.md) (30 mins)

- Wetin be AI Templates?
- Where I fit find AI Templates?
- How I fit start to build AI Agents?
- **Lab**: Quickstart with GitHub Codespaces

### [Module 2: Validate AI Template](docs/instructions/2-Validate-AI-Template.md) (30 mins)

- Wetin be di AI Template Architecture?
- Wetin be di AZD Development Workflow?
- How I fit get help with AZD Development?
- **Lab**: Deploy & Validate AI Agents template

### [Module 3: Deconstruct AI Template](docs/instructions/3-Deconstruct-AI-Template.md) (30 mins)

- Check your environment for `.azure/` 
- Check your resource setup for `infra/` 
- Check your AZD configuration for `azure.yaml`s
- **Lab**: Change Environment Variables & Redeploy

### [Module 4: Configure AI Template](docs/instructions/4-Configure-AI-Template.md) (30 mins)
- Explore: Retrieval Augmented Generation
- Explore: Agent Evaluation & Red Teaming
- Explore: Tracing & Monitoring
- **Lab**: Explore AI Agent + Observability 

### [Module 5: Customize AI Template](docs/instructions/5-Customize-AI-Template.md) (30 mins)
- Define: PRD with Scenario Requirements
- Configure: Environment Variables for AZD
- Implement: Lifecycle Hooks for added tasks
- **Lab**: Customize template for my scenario

### [Module 6: Teardown Infrastructure](docs/instructions/6-Teardown-Infrastructure.md) (30 mins)
- Recap: Wetin be AZD Templates?
- Recap: Why I go use Azure Developer CLI?
- Next Steps: Try another template!
- **Lab**: Deprovision infrastructure & cleanup

<br/>

## Workshop Challenge

You wan challenge yourself do more? Check dis project suggestions - or share your ideas with us!!

| Project | Description |
|:---|:---|
|1. **Deconstruct A Complex AI Template** | Use di workflow and tools wey we talk about and see if you fit deploy, validate, and customize another AI solution template. _Wetin you learn?_|
|2. **Customize With Your Scenario**  | Try write PRD (Product Requirements Document) for another scenario. Then use GitHub Copilot for your template repo in Agent Model - and ask am to generate customization workflow for you. _Wetin you learn? How you fit improve di suggestions?_|
| | |

## You Get Feedback?

1. Post issue for dis repo - tag am `Workshop` for easy identification.
1. Join di Azure AI Foundry Discord - connect with your peers!


| | | 
|:---|:---|
| **📚 Course Home**| [AZD For Beginners](../README.md)|
| **📖 Documentation** | [Get started with AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Templates** | [Azure AI Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Next Steps** | [Take The Challenge](../../../workshop) |
| | |

<br/>

---

**Previous:** [AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md) | **Next:** Start with [Lab 1: AZD Basics](../../../workshop/lab-1-azd-basics)

**Ready to start to build AI applications with AZD?**

[Start Lab 1: AZD Foundations →](./lab-1-azd-basics/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make am accurate, abeg make you sabi say automated translations fit get mistake or no dey correct well. Di original dokyument for di native language na di main source wey you go trust. For important information, e better make professional human translation dey use. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->