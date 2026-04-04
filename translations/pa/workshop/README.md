<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 AZD AI ਵਿਕਾਸਕਰਤਿਆਂ ਲਈ ਵਰਕਸ਼ਾਪ
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Azure Developer CLI ਨਾਲ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਬਣਾਉਣ ਲਈ ਇੱਕ ਹੱਥ-ਅਨੁਭਵ ਵਰਕਸ਼ਾਪ।</strong><br>
      AZD ਟੈਂਪਲੇਟ ਅਤੇ AI ਡਿਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋਜ਼ 'ਤੇ ਮਾਹਿਰ ਹੋਣ ਲਈ 7 ਮੌਡੀਊਲ ਪੂਰੇ ਕਰੋ।
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 ਆਖਰੀ ਅਪਡੇਟ: ਮਾਰਚ 2026
      </span>
    </div>
  </div>
</div>

# AZD AI ਵਿਕਾਸਕਰਤਿਆਂ ਲਈ ਵਰਕਸ਼ਾਪ

Welcome to the hands-on workshop for learning Azure Developer CLI (AZD) with a focus on AI application deployment. This workshop helps you gain an applied understanding of AZD templates in 3 steps:

1. **ਖੋਜ** - ਆਪਣੇ ਲਈ ਸਹੀ ਟੈਂਪਲੇਟ ਲੱਭੋ.
1. **ਡਿਪਲੋਇਮੈਂਟ** - ਡਿਪਲੋਇ ਕਰੋ ਅਤੇ ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ ਇਹ ਕੰਮ ਕਰਦਾ ਹੈ
1. **ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ** - ਸੋਧੋ ਅਤੇ ਦੁਹਰਾਓ ਤਾਂ ਜੋ ਇਹ ਤੁਹਾਡਾ ਬਣ ਜਾਵੇ!

Over the course of this workshop, you will also be introduced to core developer tools and workflows, to help you streamline your end-to-end development journey.

<br/>

## ਬ੍ਰਾਊਜ਼ਰ-ਅਧਾਰਤ ਗਾਈਡ

The workshop lessons are in Markdown. You can navigate them directly in GitHub - or launch a browser-based preview as shown in the screenshot below.

![ਵਰਕਸ਼ਾਪ](../../../translated_images/pa/workshop.75906f133e6f8ba0.webp)

To use this option - fork the repository to your profile, and launch GitHub Codespaces. Once the VS Code terminal is active, type this command:

This browser preview works in GitHub Codespaces, dev containers, or a local clone with Python and MkDocs installed.

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

In a few seconds, you will see a pop-up dialog. Select the option to `ਬਰਾਊਜ਼ਰ ਵਿੱਚ ਖੋਲ੍ਹੋ`. The web-based guide will now open in a new browser tab. Some benefits of this preview:

1. **ਬਿਲਟ-ਇਨ ਖੋਜ** - ਕੀਵਰਡ ਜਾਂ ਪਾਠ ਤੁਰੰਤ ਲੱਭੋ.
1. **ਕਾਪੀ ਆਈਕਨ** - ਕੋਡਬਲਾਕ 'ਤੇ ਕਰਸਰ ਰੱਖੋ ਤਾਂ ਜੋ ਇਹ ਵਿਕਲਪ ਦਿਖੇ
1. **ਥੀਮ ਟੌਗਲ** - ਡਾਰਕ ਅਤੇ ਲਾਈਟ ਥੀਮਾਂ ਵਿੱਚ ਬਦਲੋ
1. **ਮਦਦ ਲਵੋ** - ਸ਼ਾਮਲ ਹੋਣ ਲਈ ਫੂਟਰ ਵਿੱਚ Discord ਆਈਕਨ 'ਤੇ ਕਲਿਕ ਕਰੋ!

<br/>

## ਵਰਕਸ਼ਾਪ ਓਵਰਵਿਊ

**ਅवਧੀ:** 3-4 hours  
**ਸਤਰ:** Beginner to Intermediate  
**ਪੂਰਵ-ਸ਼ਰਤਾਂ:** Familiarity with Azure, AI concepts, VS Code & command-line tools.

This is a hands-on workshop where you learn by doing. Once you have completed the exercises, we recommend reviewing the AZD For Beginners curriculum to continue your learning journey into Security and Productivity best practices.

| ਸਮਾਂ| ਮੌਡੀਊਲ  | ਉਦੇਸ਼ |
|:---|:---|:---|
| 15 ਮਿੰਟ | [ਪਰਿਚਯ](docs/instructions/0-Introduction.md) | ਸਟੇਜ ਸੈੱਟ ਕਰੋ, ਲਕਸ਼ਾਂ ਨੂੰ ਸਮਝੋ |
| 30 ਮਿੰਟ | [AI ਟੈਂਪਲੇਟ ਚੁਣੋ](docs/instructions/1-Select-AI-Template.md) | ਵਿਕਲਪਾਂ ਦੀ ਪੜਤਾਲ ਕਰੋ ਅਤੇ ਸ਼ੁਰੂਆਤੀ ਪਿਕ ਕਰੋ | 
| 30 ਮਿੰਟ | [Validate AI Template](docs/instructions/2-Validate-AI-Template.md) | ਡਿਫੋਲਟ ਹੱਲ ਨੂੰ Azure 'ਤੇ ਡਿਪਲੋਇ ਕਰੋ |
| 30 ਮਿੰਟ | [Deconstruct AI Template](docs/instructions/3-Deconstruct-AI-Template.md) | ਸੰਰਚਨਾ ਅਤੇ ਕੰਫਿਗਰੇਸ਼ਨ ਦੀ ਪੜਤਾਲ ਕਰੋ |
| 30 ਮਿੰਟ | [Configure AI Template](docs/instructions/4-Configure-AI-Template.md) | ਉਪਲਬਧ ਫੀਚਰਾਂ ਨੂੰ ਸਰਗਰਮ ਕਰੋ ਅਤੇ ਅਜ਼ਮਾਓ |
| 30 ਮਿੰਟ | [Customize AI Template](docs/instructions/5-Customize-AI-Template.md) | ਟੈਂਪਲੇਟ ਨੂੰ ਆਪਣੀਆਂ ਲੋੜਾਂ ਅਨੁਸਾਰ ਅਨੁਕੂਲ ਕਰੋ |
| 30 ਮਿੰਟ | [Teardown Infrastructure](docs/instructions/6-Teardown-Infrastructure.md) | ਸਫਾਈ ਕਰੋ ਅਤੇ ਸਰੋਤ ਰਿਲੀਜ਼ ਕਰੋ |
| 15 ਮਿੰਟ | [Wrap-Up & Next Steps](docs/instructions/7-Wrap-up.md) | ਸਿੱਖਣ ਦੇ ਸਰੋਤ, ਵਰਕਸ਼ਾਪ ਚੈਲੇਂਜ |

<br/>

## ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ

Think of the AZD Template as a learning sandbox to explore various capabilities and tools for end-to-end development on Microsoft Foundry. By the end of this workshop, you should have an intuitive sense for various tools and concepts in this context.

| ਧਾਰਨਾ  | ਉਦੇਸ਼ |
|:---|:---|
| **Azure Developer CLI** | ਟੂਲ ਕਮਾਂਡ ਅਤੇ ਵਰਕਫਲੋਅਜ਼ ਨੂੰ ਸਮਝੋ|
| **AZD Templates**| ਪ੍ਰੋਜੈਕਟ ਸੰਰਚਨਾ ਅਤੇ ਕੰਫਿਗ ਨੂੰ ਸਮਝੋ|
| **Azure AI Agent**| Microsoft Foundry ਪ੍ਰੋਜੈਕਟ ਨੂੰ ਪ੍ਰੋਵਿਜ਼ਨ ਅਤੇ ਡਿਪਲੋਇ ਕਰੋ  |
| **Azure AI Search**| ਏਜੰਟਸ ਨਾਲ ਸੰਦਰਭ ਇੰਜੀਨੀਅਰਿੰਗ ਯੋਗ ਬਣਾਓ |
| **Observability**| ਟਰੇਸਿੰਗ, ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਮੁਲਾਂਕਣ ਦੀ ਪੜਤਾਲ ਕਰੋ |
| **Red Teaming**| ਵਿਰੋਧੀ ਜਾਂਚ ਅਤੇ ਰੋਕਥਾਮਾਂ ਦੀ ਪੜਤਾਲ ਕਰੋ |

<br/>

## ਵਰਕਸ਼ਾਪ ਦੀ ਸੰਰਚਨਾ

The workshop is structured to take you on a journey from template discovery, to deployment, deconstruction, and customization - using the official [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) starter template as the basis.

### [ਮੌਡੀਊਲ 1: AI ਟੈਂਪਲੇਟ ਚੁਣੋ](docs/instructions/1-Select-AI-Template.md) (30 ਮਿੰਟ)

- AI ਟੈਂਪਲੇਟ ਕੀ ਹਨ?
- ਤੁਸੀਂ AI ਟੈਂਪਲੇਟ ਕਿੱਥੇ ਲੱਭ ਸਕਦੇ ਹੋ?
- ਤੁਸੀਂ AI ਏਜੰਟ ਬਣਾਉਣਾ ਕਿਵੇਂ ਸ਼ੁਰੂ ਕਰ ਸਕਦੇ ਹੋ?
- **ਲੈਬ**: Codespaces ਜਾਂ dev container ਵਿੱਚ Quickstart

### [ਮੌਡੀਊਲ 2: Validate AI Template](docs/instructions/2-Validate-AI-Template.md) (30 ਮਿੰਟ)

- AI ਟੈਂਪਲੇਟ ਆਰਕੀਟੈਕਚਰ ਕੀ ਹੈ?
- AZD ਵਿਕਾਸ ਵਰਕਫਲੋ ਕੀ ਹੈ?
- AZD ਵਿਕਾਸ ਲਈ ਮਦਦ ਕਿਵੇਂ ਪ੍ਰਾਪਤ ਕਰ ਸਕਦੇ ਹੋ?
- **ਲੈਬ**: Deploy & Validate AI Agents template

### [ਮੌਡੀਊਲ 3: Deconstruct AI Template](docs/instructions/3-Deconstruct-AI-Template.md) (30 ਮਿੰਟ)

- ਆਪਣੇ ਵਾਤਾਵਰਣ `.azure/` ਵਿੱਚ ਖੋਜੋ 
- ਆਪਣੇ ਰਿਸੋਰਸ ਸੈਟਅਪ `infra/` ਵਿੱਚ ਖੋਜੋ 
- ਆਪਣੀ AZD ਕੰਫਿਗਰੇਸ਼ਨ `azure.yaml`s ਵਿੱਚ ਖੋਜੋ
- **ਲੈਬ**: Environment Variables ਸੋਧੋ & ਦੁਬਾਰਾ ਡਿਪਲੋਇ ਕਰੋ

### [ਮੌਡੀਊਲ 4: Configure AI Template](docs/instructions/4-Configure-AI-Template.md) (30 ਮਿੰਟ)
- ਖੋਜੋ: Retrieval Augmented Generation
- ਖੋਜੋ: Agent Evaluation & Red Teaming
- ਖੋਜੋ: Tracing & Monitoring
- **ਲੈਬ**: AI Agent + Observability ਖੋਜੋ 

### [ਮੌਡੀਊਲ 5: Customize AI Template](docs/instructions/5-Customize-AI-Template.md) (30 ਮਿੰਟ)
- ਪਰਿਭਾਸ਼ਿਤ ਕਰੋ: PRD ਨਾਲ ਸਿਨੇਰੀਓ ਲੋੜਾਂ
- ਕੰਫਿਗਰ ਕਰੋ: AZD ਲਈ Environment Variables
- ਲਾਗੂ ਕਰੋ: ਜੁੜੇ ਟਾਸਕਾਂ ਲਈ Lifecycle Hooks
- **ਲੈਬ**: ਮੇਰੇ ਸਿਨੇਰੀਓ ਲਈ ਟੈਂਪਲੇਟ ਕਸਟਮਾਈਜ਼ ਕਰੋ

### [ਮੌਡੀਊਲ 6: Teardown Infrastructure](docs/instructions/6-Teardown-Infrastructure.md) (30 ਮਿੰਟ)
- ਸੰਖੇਪ: AZD ਟੈਂਪਲੇਟ ਕੀ ਹਨ?
- ਸੰਖੇਪ: Azure Developer CLI ਕਿਉਂ ਵਰਤਣਾ?
- ਅਗਲੇ ਕਦਮ: ਕੋਈ ਵੱਖਰਾ ਟੈਂਪਲੇਟ ਅਜ਼ਮਾਓ!
- **ਲੈਬ**: ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਨੂੰ ਡੀ-ਪ੍ਰੋਵਿਜ਼ਨ ਕਰੋ & ਸਫਾਈ ਕਰੋ

<br/>

## ਵਰਕਸ਼ਾਪ ਚੈਲੇਂਜ

Want to challenge yourself to do more? Here are some project suggestions - or share your ideas with us!!

| ਪ੍ਰੋਜੈਕਟ | ਵੇਰਵਾ |
|:---|:---|
|1. **ਇੱਕ ਜਟਿਲ AI ਟੈਂਪਲੇਟ ਨੂੰ ਵਿਭਾਜਿਤ ਕਰੋ** | ਉਹ ਵਰਕਫਲੋ ਅਤੇ ਟੂਲ ਵਰਤੋ ਜੋ ਅਸੀਂ ਦਰਸਾਏ ਹਨ ਅਤੇ ਵੇਖੋ ਕਿ ਕੀ ਤੁਸੀਂ ਕਿਸੇ ਵੱਖਰੇ AI ਹੱਲ ਟੈਂਪਲੇਟ ਨੂੰ ਡਿਪਲੋਇ, ਵੈਲਿਡੇਟ, ਅਤੇ ਕਸਟਮਾਈਜ਼ ਕਰ ਸਕਦੇ ਹੋ। _ਤੁਸੀਂ ਕੀ ਸਿੱਖਿਆ?_|
|2. **ਆਪਣੇ ਸਿਨੇਰੀਓ ਨਾਲ ਕਸਟਮਾਈਜ਼ ਕਰੋ**  | ਇੱਕ ਵੱਖਰੇ ਸਿਨੇਰੀਓ ਲਈ PRD (Product Requirements Document) ਲਿਖਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ। ਫਿਰ ਆਪਣੇ ਟੈਂਪਲੇਟ ਰੇਪੋ ਵਿੱਚ Agent Model ਵਿੱਚ GitHub Copilot ਦੀ ਵਰਤੋਂ ਕਰੋ - ਅਤੇ ਇਸਨੂੰ ਕਹੋ ਕਿ ਤੁਹਾਡੇ ਲਈ ਇੱਕ ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ ਵਰਕਫਲੋ ਬਣਾਵੇ। _ਤੁਸੀਂ ਕੀ ਸਿੱਖਿਆ? ਤੁਸੀਂ ਇਨ੍ਹਾਂ ਸੁਝਾਵਾਂ ਨੂੰ ਕਿਵੇਂ ਸੁਧਾਰ ਸਕਦੇ ਹੋ?_|
| | |

## ਫੀਡਬੈਕ?

1. ਇਸ ਰੇਪੋ 'ਤੇ ਇਕ issue ਪੋਸਟ ਕਰੋ - ਸੁਵਿਧਾ ਲਈ ਇਸਨੂੰ `Workshop` ਨਾਲ ਟੈਗ ਕਰੋ.
1. Microsoft Foundry Discord ਵਿੱਚ ਸ਼ਾਮਿਲ ਹੋਵੋ - ਆਪਣੇ ਸਹਿਯੋਗੀਆਂ ਨਾਲ ਜੁੜੋ!


| | | 
|:---|:---|
| **📚 ਕੋਰਸ ਮੁੱਖ**| [AZD For Beginners](../README.md)|
| **📖 ਦਸਤਾਵੇਜ਼** | [Get started with AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Templates** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 ਅਗਲੇ ਕਦਮ** | [ਵਰਕਸ਼ਾਪ ਸ਼ੁਰੂ ਕਰੋ](#ਵਰਕਸ਼ਾਪ-ਓਵਰਵਿਊ) |
| | |

<br/>

---

**ਨੈਵੀਗੇਸ਼ਨ:** [ਮੁੱਖ ਕੋਰਸ](../README.md) | [ਪਰਿਚਯ](docs/instructions/0-Introduction.md) | [ਮੌਡੀਊਲ 1: AI ਟੈਂਪਲੇਟ ਚੁਣੋ](docs/instructions/1-Select-AI-Template.md)

**ਕੀ AZD ਨਾਲ AI ਐਪਲੀਕੇਸ਼ਨ ਬਣਾਉਣ ਲਈ ਤਿਆਰ ਹੋ?**

[ਵਰਕਸ਼ਾਪ ਸ਼ੁਰੂ ਕਰੋ: ਪਰਿਚਯ →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੇਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸਹੀਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੌਜੂਦ ਅਸਲੀ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਸੰਵੇਦਨਸ਼ੀਲ ਜਾਂ ਜ਼ਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਉਪਜਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->