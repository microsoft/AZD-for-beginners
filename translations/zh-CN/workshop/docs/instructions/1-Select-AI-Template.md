# 1. 选择模板

!!! tip "在本模块结束时您将能够"

    - [ ] 描述什么是 AZD 模板
    - [ ] 探索并使用面向 AI 的 AZD 模板
    - [ ] 开始使用 AI Agents 模板
    - [ ] **实验 1：** 使用 GitHub Codespaces 的 AZD 快速入门

---

## 1. 建造者类比

从头开始（_从头开始_）构建一个面向企业的现代 AI 应用可能令人望而生畏。这有点像你亲手一砖一瓦地建造新家。是的，这可以做到！但这并不是获得理想结果的最有效方式！

相反，我们通常从现有的 _设计蓝图_ 开始，并与架构师合作，将其定制为满足我们的个人需求。这正是构建智能应用时应采取的方法。首先，找到一个适合您问题领域的良好设计架构。然后与解决方案架构师合作，为您的特定场景定制并开发解决方案。

但是我们在哪里可以找到这些设计蓝图？我们如何找到愿意教我们如何自定义并自行部署这些蓝图的架构师？在本次研讨会中，我们通过向您介绍三种技术来回答这些问题：

1. [Azure Developer CLI](https://aka.ms/azd) - 一个开源工具，加速从本地开发（构建）到云部署（发布）的开发者路径。
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - 标准化的开源存储库，包含用于部署 AI 解决方案架构的示例代码、基础设施和配置文件。
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - 一个以 Azure 知识为基础的编码代理，可以使用自然语言指导我们浏览代码库并进行更改。

有了这些工具，我们现在可以 _发现_ 合适的模板，_部署_ 它以验证其可行性，并根据我们的具体场景进行 _定制_。让我们深入了解这些工具的工作方式。

---

## 2. Azure 开发者 CLI

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (or `azd`) 是一个开源命令行工具，通过一组对开发人员友好的命令来加速您从本地开发（开发）到云部署（运维）的代码到云之旅，这些命令在您的 IDE（开发）和 CI/CD（DevOps）环境中保持一致。

使用 `azd`，您的部署过程可以简单到：

- `azd init` - 从现有 AZD 模板初始化一个新的 AI 项目。
- `azd up` - 在一步中预配基础设施并部署您的应用。
- `azd monitor` - 获取已部署应用的实时监控和诊断。
- `azd pipeline config` - 设置 CI/CD 管道以自动化部署到 Azure。

**🎯 | 练习**: <br/> 在您的 GitHub Codespaces 环境中探索 `azd` 命令行工具。首先键入此命令以查看该工具可以执行的操作：

```bash title="" linenums="0"
azd help
```

![流程](../../../../../translated_images/zh-CN/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. AZD 模板

为了让 `azd` 实现这些功能，它需要知道要预配的基础设施、要强制执行的配置设置以及要部署的应用。这就是 [AZD 模板](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) 的作用。

AZD 模板是开源存储库，将示例代码与部署解决方案架构所需的基础设施和配置文件相结合。通过采用基础设施即代码（IaC）的方法，它们允许模板资源定义和配置设置像应用源代码一样进行版本控制——在该项目的用户之间创建可重用且一致的工作流。

在为 _您的_ 场景创建或重用 AZD 模板时，请考虑以下问题：

1. 您正在构建什么？ → 是否存在针对该场景的入门代码模板？
1. 您的解决方案如何构建？ → 是否存在具有所需资源的模板？
1. 您的解决方案如何部署？ → 考虑带有预/后处理挂钩的 `azd deploy`！
1. 如何进一步优化？ → 考虑内置监控和自动化管道！

**🎯 | 练习**: <br/> 
访问 [Awesome AZD](https://azure.github.io/awesome-azd/) 库并使用筛选器探索当前可用的 250+ 个模板。看看是否能找到与 _您的_ 场景需求相符的模板。

![代码](../../../../../translated_images/zh-CN/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI 应用模板

对于 AI 驱动的应用，Microsoft 提供了以 **Microsoft Foundry** 和 **Foundry Agents** 为特色的专用模板。这些模板加速您构建智能、可投入生产的应用的路径。

### Microsoft Foundry 与 Foundry Agents 模板

选择下面的一个模板进行部署。每个模板都可在 [Awesome AZD](https://azure.github.io/awesome-azd/) 上获取，并可通过单个命令初始化。

| 模板 | 描述 | 部署命令 |
|----------|-------------|----------------|
| **[带 RAG 的 AI 聊天](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | 使用 Microsoft Foundry 的检索增强生成（RAG）聊天应用 | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent 服务入门](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | 使用 Foundry Agents 构建用于自主任务执行的 AI 代理 | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[多代理编排](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | 协调多个 Foundry Agents 以处理复杂工作流 | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI 文档智能](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | 使用 Microsoft Foundry 模型提取并分析文档 | `azd init -t azure-samples/ai-document-processing` |
| **[会话式 AI 机器人](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | 构建与 Microsoft Foundry 集成的智能聊天机器人 | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI 图像生成](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | 通过 Microsoft Foundry 使用 DALL-E 生成图像 | `azd init -t azure-samples/ai-image-generation` |
| **[语义内核代理](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | 使用 Semantic Kernel 与 Foundry Agents 的 AI 代理 | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen 多代理](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | 使用 AutoGen 框架的多代理系统 | `azd init -t azure-samples/autogen-multi-agent` |

### 快速开始

1. **浏览模板**: 访问 [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) 并按 `AI`、`Agents` 或 `Microsoft Foundry` 进行筛选
2. **选择模板**: 选择一个符合您用例的模板
3. **初始化**: 运行您所选模板的 `azd init` 命令
4. **部署**: 运行 `azd up` 进行预配和部署

**🎯 | 练习**: <br/>
根据您的场景从上面的模板中选择一个：

- **要构建聊天机器人？** → 从 **带 RAG 的 AI 聊天** 或 **会话式 AI 机器人** 开始
- **需要自主代理？** → 试试 **Foundry Agent 服务入门** 或 **多代理编排**
- **处理文档？** → 使用 **AI 文档智能**
- **想要 AI 编码辅助？** → 探索 **语义内核代理** 或 **AutoGen 多代理**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "探索更多模板"
    [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) 包含 250+ 个模板。使用筛选器查找符合您在语言、框架和 Azure 服务方面特定要求的模板。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文件已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们努力确保准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的原文应被视为权威来源。对于重要信息，建议采用专业人工翻译。我们不对因使用本翻译而产生的任何误解或曲解承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->