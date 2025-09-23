# AZD for AI Developers Workshop

Welcome to the hands-on workshop for learning Azure Developer CLI (AZD) with a focus on AI application deployment. This workshop helps you gain an applied understanding of AZD templates in 3 steps:

1. **Discovery** - find the template that is right for you.
1. **Deployment** - deploy and validate that it works
1. **Customization** - modify and iterate to make it yours!

Over the course of this workshop, you will also be introduced to core developer tools and workflows, to help you streamline your end-to-end development journey.

| | | 
|:---|:---|
| **📚 Course Home**| [AZD For Beginners](../README.md)|
| **📖 Documentation** | [Chapter 1](../README.md#-chapter-1-foundation--quick-start), [Chapter 2](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers), [Chapter 5](../README.md#-chapter-5-multi-agent-ai-solutions-advanced)|
| **🛠️AI Templates** | [AI Template Gallery](https://aka.ms/ai-apps) |
|**🚀 Next Steps** | [Take The Challenge](#workshop-challenge) |
| | |


## Workshop Overview

**Duration:** 3-4 hours  
**Level:** Beginner to Intermediate  
**Prerequisites:** Familiarity with Azure, AI concepts, VS Code & command-line tools.

This is a hands-on workshop where you learn by doing. Once you have completed the exercises, we recommend reviewing the AZD For Beginners curriculum to continue your learning journey into Security and Productivity best practices.

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


## What You'll Learn

Think of the AZD Template as a learning sandbox to explore various capabilities and tools for end-to-end development on Azure AI Foundry. By the end of this workshop, you should have an intuitive sense for various tools and concepts in this context.

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | Understand tool commands and workflows|
| **AZD Templates**| Understand project structure and config|
| **Azure AI Agent**| Provision & deploy Azure AI Foundry project  |
| **Azure AI Search**| Enable context engineering with agents |
| **Observability**| Explore tracing, monitoring and evaluations |
| **Red Teaming**| Explore adversarial testing and mitigations |
| | |


## Workshop Structure

The workshop is structured to take you on a journey from template discovery, to deployment, deconstruction, and customization - using the official [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) starter template as the basis.

### Module 1: Select AI Template (30 mins)

- What are AI Templates?
- Where can I find AI Templates?
- How can I get started building AI Agents?
- **Lab**: Quickstart with GitHub Codespaces

### Module 2: Validate AI Template (30 mins)

- What is the AI Template Architecture?
- What is the AZD Development Workflow?
- How can I get help with AZD Development?
- **Lab**: Deploy & Validate AI Agents template

### Module 3: Deconstruct AI Template (30 mins)

- Explore your environment in `.azure/` 
- Explore your resource setup in `infra/` 
- Explore your AZD configuration in `azure.yaml`s
- **Lab**: Modify Environment Variables & Redeploy

### Module 4: Configure AI Template (30 mins)
- Explore: Retrieval Augmented Generation
- Explore: Agent Evaluation & Red Teaming
- Explore: Tracing & Monitoring
- **Lab**: Explore AI Agent + Observability 

### Module 5: Customize AI Template (30 mins)
- Define: PRD with Scenario Requirements
- Configure: Environment Variables for AZD
- Implement: Lifecycle Hooks for added tasks
- **Lab**: Customize template for my scenario

### Module 6: Teardown Infrastructure (30 mins)
- Recap: What are AZD Templates?
- Recap: Why use Azure Developer CLI?
- Next Steps: Try a different template!
- **Lab**: Deprovision infrastructure & cleanup


## Workshop Challenge

Want to challenge yourself to do more? Here are some project suggestions - or share your ideas with us!!

| Project | Description |
|:---|:---|
|1. **Deconstruct A Complex AI Template** | Use the workflow and tools we outlined and see if you can deploy, validate, and customize a different AI solution template. _What did you learn?_|
|2. **Customize With Your Scenario**  | Try writing a PRD (Product Requirements Document) for a different scenario. Then use GitHub Copilot in your template repo in Agent Model - and ask it to generate a customization workflow for you. _What did you learn? How could you improve on these suggestions?_|
| | |

## Have feedback?

Post an issue on this repo (tag it `Workshop`) or join us on Discord and post to our `#get-help` channel

<br/>

---

**Previous:** [AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md) | **Next:** Begin with [Lab 1: AZD Basics](./lab-1-azd-basics/)

**Ready to start building AI applications with AZD?**

[Begin Lab 1: AZD Foundations →](./lab-1-azd-basics/README.md)