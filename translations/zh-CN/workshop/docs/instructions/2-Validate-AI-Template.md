# 2. 验证模板

> 在 2026 年 6 月使用 `azd 1.25.6` 验证通过。

!!! tip "在本模块结束时您将能够"

    - [ ] 分析 AI 解决方案架构
    - [ ] 了解 AZD 部署工作流
    - [ ] 使用 GitHub Copilot 获取有关 AZD 使用的帮助
    - [ ] **实验 2：** 部署并验证 AI Agents 模板

---


## 1. 简介

The [Azure 开发者 CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) or `azd` 是一个开源的命令行工具，可在将应用部署到 Azure 时简化开发者的工作流程。 

[AZD 模板](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) 是包含示例应用代码、_基础设施即代码_ 资产和 `azd` 配置文件的标准化仓库，用于构建一致的解决方案架构。基础设施的配置只需运行 `azd provision` 命令 —— 使用 `azd up` 则可以一次性同时配置基础设施并部署应用程序！

因此，启动应用开发流程可能只需要找到最符合您应用和基础设施需求的 _AZD 入门模板_，然后定制该仓库以满足您的场景需求。

在开始之前，让我们确保您已安装 Azure 开发者 CLI。

1. 打开 VS Code 终端并输入以下命令：

      ```bash title="" linenums="0"
      azd version
      ```

1. 您应看到如下内容！

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**您现在已准备好使用 azd 选择并部署模板**

---

## 2. 模板选择

The Microsoft Foundry platform comes with a [一组推荐的 AZD 模板](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) that cover popular solution scenarios like _多代理工作流自动化_ and _多模态内容处理_. You can also discover these templates by visiting the Microsoft Foundry portal.

1. Visit [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. 在提示时登录 Microsoft Foundry 门户 - 您会看到类似如下内容。

![选择](../../../../../translated_images/zh-CN/01-pick-template.60d2d5fff5ebc374.webp)


The **Basic** options are your starter templates:

1. [ ] [开始使用 AI 聊天](https://github.com/Azure-Samples/get-started-with-ai-chat) that deploys a basic chat application _with your data_ to Azure Container Apps. Use this to explore a basic AI chatbot scenario.
1. [X] [开始使用 AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) that also deploys a standard AI Agent (with the Foundry Agents). Use this to get familiar with agentic AI solutions involving tools and models.

Visit the second link in a new browser tab (or click `Open in GitHub` for the related card). You should see the repository for this AZD Template. Take a minute to explore the README. The application architecture looks like this:

![架构](../../../../../translated_images/zh-CN/architecture.8cec470ec15c65c7.webp)

---

## 3. 模板激活

让我们尝试部署此模板并确保其有效。我们将遵循 [入门](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) 部分的指南。

1. 为模板仓库选择一个工作环境：

      - **GitHub Codespaces**：点击 [此链接](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) 并确认 `Create codespace`
      - <strong>本地克隆或开发容器</strong>：克隆 `Azure-Samples/get-started-with-ai-agents` 并在 VS Code 中打开

1. 等待 VS Code 终端就绪，然后输入以下命令：

   ```bash title="" linenums="0"
   azd up
   ```

Complete the workflow steps that this will trigger:

1. 系统会提示您登录 Azure —— 按照指示进行身份验证
1. 输入一个唯一的环境名称，例如我使用了 `nitya-mshack-azd`
1. 这将创建一个 `.azure/` 文件夹 - 您会看到以环境名命名的子文件夹
1. 系统会提示您选择订阅名称 - 请选择默认项
1. 系统会提示您选择位置 - 使用 `East US 2`

Now, you wait for the provisioning to complete. **这需要 10-15 分钟**

1. 完成后，控制台将显示类似如下的 SUCCESS 消息：
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. 您的 Azure 门户现在将有一个使用该环境名称的已配置资源组：

      ![基础设施](../../../../../translated_images/zh-CN/02-provisioned-infra.46c706b14f56e0bf.webp)

1. <strong>您现在已准备好验证已部署的基础设施和应用程序</strong>。

---

## 4. 模板验证

1. 访问 Azure 门户的 [资源组](https://portal.azure.com/#browse/resourcegroups) 页面 - 在提示时登录
1. 点击与您环境名称对应的资源组 - 您将看到上面的页面

      - 点击 Azure Container Apps 资源
      - 点击 _Essentials_ 部分（右上方）中的 应用程序 URL

1. 您应该会看到托管的应用前端界面，如下：

   ![应用](../../../../../translated_images/zh-CN/03-test-application.471910da12c3038e.webp)

1. 尝试询问几个 [示例问题](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. 问：```法国的首都是什么？``` 
      1. 问：```两人用、价格低于 $200 的最佳帐篷是什么？它包含哪些特性？```

1. 您应该会得到类似下方所示的答案。_但这是如何工作的？_ 

      ![应用](../../../../../translated_images/zh-CN/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  代理验证

Azure Container App 部署了一个端点，该端点连接到为此模板在 Microsoft Foundry 项目中配置的 AI Agent。让我们看看这意味着什么。

1. 返回 Azure 门户中资源组的 _概览_ 页面

1. 在列表中点击 `Microsoft Foundry` 资源

1. 您应看到此界面。点击 `Go to Microsoft Foundry Portal` 按钮。 
   ![Foundry 项目](../../../../../translated_images/zh-CN/04-view-foundry-project.fb94ca41803f28f3.webp)

1. 您应该会看到用于您 AI 应用的 Foundry 项目页面
   ![项目](../../../../../translated_images/zh-CN/05-visit-foundry-portal.d734e98135892d7e.webp)

1. 点击 `Agents` - 您将看到在项目中配置的默认 Agent
   ![代理](../../../../../translated_images/zh-CN/06-visit-agents.bccb263f77b00a09.webp)

1. 选择它 - 您会看到 Agent 详情。注意以下几点：

      - 该 Agent 默认使用 File Search（始终如此）
      - Agent 的 `Knowledge` 显示已上传 32 个文件（用于文件搜索）
      ![代理](../../../../../translated_images/zh-CN/07-view-agent-details.0e049f37f61eae62.webp)

1. 在左侧菜单中查找 `Data+indexes` 选项并点击查看详情。 

      - 您应该会看到为知识上传的 32 个数据文件。
      - 这些对应于 `src/files` 下的 12 个客户文件和 20 个产品文件 
      ![数据](../../../../../translated_images/zh-CN/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**您已验证 Agent 的运行！** 

1. Agent 的响应基于这些文件中的知识。 
1. 您现在可以就这些数据提问，并获得有据可依的响应。
1. 示例：`customer_info_10.json` 描述了 "Amanda Perez" 所做的 3 次购买

回到包含 Container App 端点的浏览器选项卡并提问：`Amanda Perez 拥有什么产品？`。您应会看到如下内容：

![数据](../../../../../translated_images/zh-CN/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent 游乐场

让我们通过在 Agent 游乐场中试用该 Agent，来更深入了解 Microsoft Foundry 的能力。 

1. 返回 Microsoft Foundry 中的 `Agents` 页面 - 选择默认 Agent
1. 点击 `Try in Playground` 选项 - 您会看到如下的 Playground UI
1. 提问相同的问题：`Amanda Perez 拥有什么产品？`

    ![数据](../../../../../translated_images/zh-CN/09-ask-in-playground.a1b93794f78fa676.webp)

您会得到相同（或相似）的响应——但您还会获得其他信息，可用于了解您具代理性应用的质量、成本和性能。例如：

1. 注意响应中引用了用于“支撑”响应的数据文件
1. 将鼠标悬停在任一这些文件标签上 - 数据是否与您的查询和显示的响应相匹配？

您还会在响应下方看到一行 _stats_（统计信息）。 

1. 将鼠标悬停在任一指标上 - 例如 Safety。您会看到类似如下内容
1. 评估的评分是否与您对响应安全级别的直觉相符？

      ![数据](../../../../../translated_images/zh-CN/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. 内置可观测性

可观测性是指为您的应用添加监测机制，以生成可用于理解、调试和优化其运行的数据。要了解这一点：

1. 点击 `View Run Info` 按钮 - 您应看到此视图。这是 [Agent 跟踪](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) 的一个示例在运行中。_您也可以通过在顶级菜单中点击 Thread Logs 来获取此视图_。

   - 了解运行步骤和 Agent 调用的工具
   - 了解响应的总 Token 数（与输出令牌使用量的对比）
   - 了解延迟以及执行过程中时间消耗在哪些环节

      ![Agent 运行信息](../../../../../translated_images/zh-CN/10-view-run-info.b20ebd75fef6a1cc.webp)

1. 点击 `Metadata` 选项卡以查看运行的附加属性，可能为以后调试问题提供有用上下文。   

      ![Agent 元数据](../../../../../translated_images/zh-CN/11-view-run-info-metadata.7966986122c7c2df.webp)


1. 点击 `Evaluations` 选项卡以查看对 Agent 响应的自动评估。包括安全评估（例如，自我伤害）以及 Agent 特有的评估（例如，意图解析、任务遵循）。

      ![Agent 评估](../../../../../translated_images/zh-CN/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. 最后，点击侧边栏菜单中的 `Monitoring` 选项卡。

      - 在显示的页面中选择 `Resource usage` 选项卡 - 查看指标。
      - 按成本（tokens）和负载（请求）跟踪应用使用情况。
      - 跟踪应用的首字节延迟（输入处理）和末字节延迟（输出）。

      ![Agent 监控资源](../../../../../translated_images/zh-CN/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. 环境变量

到目前为止，我们已经在浏览器中完成了部署演练，并验证了基础设施已配置且应用可运行。但要以 _代码优先_ 的方式处理应用，我们需要在本地开发环境中配置与这些资源交互所需的相关变量。使用 `azd` 可以简化此操作。

1. Azure 开发者 CLI [使用环境变量](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) 来存储和管理应用部署的配置设置。

1. 环境变量保存在 `.azure/<env-name>/.env` —— 这将其限定到部署时使用的 `env-name` 环境，有助于您在同一仓库的不同部署目标之间隔离环境。

1. 每当执行特定命令（例如 `azd up`）时，`azd` 命令会自动加载环境变量。注意，`azd` 不会自动读取 _操作系统级别_ 的环境变量（例如，在 shell 中设置的变量）——相反，请使用 `azd set env` 和 `azd get env` 在脚本中传递信息。


让我们试几个命令：

1. 获取此环境中为 `azd` 设置的所有环境变量：

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      您将看到类似如下内容：

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. 获取特定值 - 例如，我想知道是否设置了 `AZURE_AI_AGENT_MODEL_NAME` 值

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      您将看到类似这样的输出 —— 默认未设置！

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. 为 `azd` 设置一个新的环境变量。在此示例中，我们更新 Agent 的模型名称。_注意：所做的任何更改将立即反映在 `.azure/<env-name>/.env` 文件中。_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      现在，我们应该可以看到该值已被设置：

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. 请注意，某些资源是持久的（例如，模型部署），仅运行 `azd up` 可能不足以强制重新部署。我们尝试拆除原始部署并在更改环境变量后重新部署。

1. <strong>刷新</strong> 如果您之前使用 azd 模板部署了基础设施 - 您可以使用此命令根据 Azure 部署的当前状态 _刷新_ 本地环境变量的状态：

      ```bash title="" linenums="0"
      azd env refresh
      ```

      这是一种强大的方式，可以在两个或更多本地开发环境之间_同步_环境变量（例如，拥有多个开发人员的团队） - 允许已部署的基础设施作为环境变量状态的最终依据。团队成员只需_刷新_变量即可重新同步。

---

## 9. 恭喜 🏆

您刚刚完成了一个端到端的工作流程，在该流程中您：

- [X] 已选择要使用的 AZD 模板
- [X] 在受支持的开发环境中打开了模板
- [X] 已部署模板并验证其工作正常

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->