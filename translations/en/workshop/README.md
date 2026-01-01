<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T15:15:10+00:00",
  "source_file": "workshop/README.md",
  "language_code": "en"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Workshop Under Construction 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>This workshop is currently in active development.</strong><br>
      Content may be incomplete or subject to change. Check back soon for updates!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Last Updated: October 2025
      </span>
    </div>
  </div>
</div>

# AZD for AI Developers Workshop

Welcome to the hands-on workshop for learning Azure Developer CLI (AZD) with a focus on AI application deployment. This workshop helps you gain practical knowledge of AZD templates in 3 steps:

1. **Discovery** - find the template that suits your needs.
1. **Deployment** - deploy and ensure it works.
1. **Customization** - modify and adapt it to your requirements!

Throughout this workshop, you will also be introduced to essential developer tools and workflows to streamline your end-to-end development process.

<br/>

## Browser-Based Guide

The workshop lessons are written in Markdown. You can access them directly on GitHub or launch a browser-based preview as shown in the screenshot below.

![Workshop](../../../translated_images/workshop.75906f133e6f8ba0.en.png)

To use this option, fork the repository to your profile and launch GitHub Codespaces. Once the VS Code terminal is active, type this command:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

In a few seconds, a pop-up dialog will appear. Select the option to `Open in browser`. The web-based guide will open in a new browser tab. Benefits of this preview include:

1. **Built-in search** - quickly find keywords or lessons.
1. **Copy icon** - hover over code blocks to see this option.
1. **Theme toggle** - switch between dark and light modes.
1. **Get help** - click the Discord icon in the footer to join!

<br/>

## Workshop Overview

**Duration:** 3-4 hours  
**Level:** Beginner to Intermediate  
**Prerequisites:** Familiarity with Azure, AI concepts, VS Code, and command-line tools.

This is a hands-on workshop where you learn by doing. After completing the exercises, we recommend exploring the AZD For Beginners curriculum to deepen your understanding of Security and Productivity best practices.

| Time| Module  | Objective |
|:---|:---|:---|
| 15 mins | [Introduction](docs/instructions/0-Introduction.md) | Set the stage, understand the goals |
| 30 mins | [Select AI Template](docs/instructions/1-Select-AI-Template.md) | Explore options and choose a starter | 
| 30 mins | [Validate AI Template](docs/instructions/2-Validate-AI-Template.md) | Deploy the default solution to Azure |
| 30 mins | [Deconstruct AI Template](docs/instructions/3-Deconstruct-AI-Template.md) | Explore structure and configuration |
| 30 mins | [Configure AI Template](docs/instructions/4-Configure-AI-Template.md) | Activate and test available features |
| 30 mins | [Customize AI Template](docs/instructions/5-Customize-AI-Template.md) | Adapt the template to your needs |
| 30 mins | [Teardown Infrastructure](docs/instructions/6-Teardown-Infrastructure.md) | Clean up and release resources |
| 15 mins | [Wrap-Up & Next Steps](docs/instructions/7-Wrap-up.md) | Learning resources, Workshop challenge |

<br/>

## What You'll Learn

Think of the AZD Template as a sandbox for exploring various tools and capabilities for end-to-end development on Azure AI Foundry. By the end of this workshop, you should have a solid understanding of the tools and concepts in this context.

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | Learn tool commands and workflows|
| **AZD Templates**| Understand project structure and configuration|
| **Azure AI Agent**| Provision & deploy Azure AI Foundry projects  |
| **Azure AI Search**| Enable context engineering with agents |
| **Observability**| Explore tracing, monitoring, and evaluations |
| **Red Teaming**| Learn adversarial testing and mitigations |

<br/>

## Workshop Structure

The workshop is designed to guide you through template discovery, deployment, deconstruction, and customization using the official [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) starter template.

### [Module 1: Select AI Template](docs/instructions/1-Select-AI-Template.md) (30 mins)

- What are AI Templates?
- Where can I find AI Templates?
- How can I start building AI Agents?
- **Lab**: Quickstart with GitHub Codespaces

### [Module 2: Validate AI Template](docs/instructions/2-Validate-AI-Template.md) (30 mins)

- What is the AI Template Architecture?
- What is the AZD Development Workflow?
- How can I get help with AZD Development?
- **Lab**: Deploy & Validate AI Agents template

### [Module 3: Deconstruct AI Template](docs/instructions/3-Deconstruct-AI-Template.md) (30 mins)

- Explore your environment in `.azure/` 
- Explore your resource setup in `infra/` 
- Explore your AZD configuration in `azure.yaml`s
- **Lab**: Modify Environment Variables & Redeploy

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
- Recap: What are AZD Templates?
- Recap: Why use Azure Developer CLI?
- Next Steps: Try a different template!
- **Lab**: Deprovision infrastructure & cleanup

<br/>

## Workshop Challenge

Want to push yourself further? Here are some project ideas—or share your own with us!

| Project | Description |
|:---|:---|
|1. **Deconstruct A Complex AI Template** | Use the workflow and tools outlined to deploy, validate, and customize a different AI solution template. _What did you learn?_|
|2. **Customize With Your Scenario**  | Write a PRD (Product Requirements Document) for a different scenario. Then use GitHub Copilot in your template repo in Agent Model and ask it to generate a customization workflow for you. _What did you learn? How could you improve these suggestions?_|
| | |

## Have feedback?

1. Post an issue on this repo—tag it `Workshop` for easy identification.
1. Join the Azure AI Foundry Discord—connect with your peers!


| | | 
|:---|:---|
| **📚 Course Home**| [AZD For Beginners](../README.md)|
| **📖 Documentation** | [Get started with AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Templates** | [Azure AI Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Next Steps** | [Take The Challenge](../../../workshop) |
| | |

<br/>

---

**Previous:** [AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md) | **Next:** Begin with [Lab 1: AZD Basics](../../../workshop/lab-1-azd-basics)

**Ready to start building AI applications with AZD?**

[Begin Lab 1: AZD Foundations →](./lab-1-azd-basics/README.md)

---

**Disclaimer**:  
This document has been translated using the AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we aim for accuracy, please note that automated translations may include errors or inaccuracies. The original document in its native language should be regarded as the authoritative source. For critical information, professional human translation is advised. We are not responsible for any misunderstandings or misinterpretations resulting from the use of this translation.