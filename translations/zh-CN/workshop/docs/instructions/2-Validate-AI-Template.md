# 2. 验证模板

!!! tip "在本模块结束时您将能够"

    - [ ] 分析 AI 解决方案架构
    - [ ] 了解 AZD 部署工作流
    - [ ] 使用 GitHub Copilot 获取 AZD 使用帮助
    - [ ] **实验 2：** 部署并验证 AI Agents 模板

---


## 1. 介绍

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) 或 `azd` 是一个开源命令行工具，在将应用构建并部署到 Azure 时可以简化开发人员的工作流。

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) 是标准化的代码仓库，包含示例应用代码、_基础设施即代码_ 资产以及用于一致解决方案架构的 `azd` 配置文件。通过运行 `azd provision` 命令即可简化基础设施的配置，而使用 `azd up` 则可以一次性完成基础设施的配置**并**部署你的应用！

因此，启动你的应用开发流程可能只需找到最接近你应用和基础设施需求的 _AZD 入门模板_，然后根据场景需求自定义该仓库即可。

在我们开始之前，先确保你已安装 Azure Developer CLI。

1. 打开 VS Code 终端并输入以下命令：

      ```bash title="" linenums="0"
      azd version
      ```

1. 你应该会看到类似以下的输出！

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**你现在已准备好使用 azd 选择并部署一个模板**

---

## 2. 模板选择

Microsoft Foundry 平台提供了一组[推荐的 AZD 模板](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)，涵盖诸如 _多代理工作流自动化_ 和 _多模态内容处理_ 等常见解决方案场景。你也可以通过访问 Microsoft Foundry 门户来发现这些模板。

1. 访问 [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. 在提示时登录 Microsoft Foundry 门户 - 你会看到类似下面的界面。

![选择](../../../../../translated_images/zh-CN/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** 选项是你的入门模板：

1. [ ] [开始使用 AI 聊天](https://github.com/Azure-Samples/get-started-with-ai-chat) ，它会将一个基本的聊天应用（使用你的数据）部署到 Azure Container Apps。使用此模板可以探索一个基础的 AI 聊天机器人场景。
1. [X] [开始使用 AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) ，它也会部署一个标准的 AI Agent（使用 Foundry Agents）。使用此模板可以熟悉涉及工具和模型的自治式 AI 解决方案。

在新浏览器选项卡中打开第二个链接（或在相关卡片上点击 `Open in GitHub`）。你应该会看到该 AZD 模板的仓库。花一点时间浏览 README。应用架构如下所示：

![架构](../../../../../translated_images/zh-CN/architecture.8cec470ec15c65c7.webp)

---

## 3. 模板激活

让我们尝试部署此模板并确认其有效性。我们将按照[入门](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) 部分中的指南操作。

1. 点击[此链接](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - 确认默认操作为 `Create codespace`
1. 这会在新标签页中打开一个页面 - 等待 GitHub Codespaces 会话完成加载
1. 在 Codespaces 中打开 VS Code 终端 - 输入以下命令：

   ```bash title="" linenums="0"
   azd up
   ```

完成该命令将触发的工作流步骤：

1. 系统会提示你登录 Azure - 按照说明进行身份验证
1. 输入一个对你唯一的环境名称 - 例如，我使用了 `nitya-mshack-azd`
1. 这将创建一个 `.azure/` 文件夹 - 你会看到以环境名命名的子文件夹
1. 系统会提示你选择订阅名称 - 选择默认订阅
1. 系统会提示你选择位置 - 使用 `East US 2`

现在，等待配置完成。**这需要 10-15 分钟**

1. 完成后，控制台将显示类似这样的 SUCCESS 消息：
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. 你的 Azure 门户现在将有一个以该环境名称命名的已配置资源组：

      ![已部署基础设施](../../../../../translated_images/zh-CN/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **你现在已准备好验证已部署的基础设施和应用程序**。

---

## 4. 模板验证

1. 访问 Azure 门户 [资源组](https://portal.azure.com/#browse/resourcegroups) 页面 - 在提示时登录
1. 点击与你的环境名称对应的 RG - 你会看到上面的页面

      - 点击 Azure Container Apps 资源
      - 点击 _Essentials_ 部分（右上）的 应用 URL

1. 你应该会看到一个托管的应用前端 UI，类似如下：

   ![应用](../../../../../translated_images/zh-CN/03-test-application.471910da12c3038e.webp)

1. 尝试提出几个[示例问题](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. 提问： ```法国的首都是什么？``` 
      1. 提问： ```在 200 美元以下，适合两人的最佳帐篷是什么，它有哪些特性？```

1. 你应该会得到与下图类似的答案。_但这是如何工作的？_

      ![应用](../../../../../translated_images/zh-CN/03-test-question.521c1e863cbaddb6.webp)

---

## 5. 代理验证

Azure Container App 部署了一个端点，该端点连接到为此模板在 Microsoft Foundry 项目中配置的 AI Agent。让我们看看这意味着什么。

1. 返回 Azure 门户中你资源组的 _概览_ 页面

1. 在列表中点击 `Microsoft Foundry` 资源

1. 你应该会看到这个。点击 `Go to Microsoft Foundry Portal` 按钮。 
   ![Foundry](../../../../../translated_images/zh-CN/04-view-foundry-project.fb94ca41803f28f3.webp)

1. 你应该会看到你的 AI 应用的 Foundry 项目页面
   ![项目](../../../../../translated_images/zh-CN/05-visit-foundry-portal.d734e98135892d7e.webp)

1. 点击 `Agents` - 你会看到项目中配置的默认代理
   ![代理](../../../../../translated_images/zh-CN/06-visit-agents.bccb263f77b00a09.webp)

1. 选择它 - 你会看到代理详情。注意以下几点：

      - 该代理默认使用文件搜索（始终）
      - 代理的 `Knowledge` 表示它已上传 32 个文件（用于文件搜索）
      ![代理](../../../../../translated_images/zh-CN/07-view-agent-details.0e049f37f61eae62.webp)

1. 在左侧菜单中查找 `Data+indexes` 选项并点击以查看详细信息。 

      - 你应该能看到为知识上传的 32 个数据文件。
      - 这些将对应于 `src/files` 下的 12 个客户文件和 20 个产品文件 
      ![数据与索引](../../../../../translated_images/zh-CN/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**你已验证代理运行！** 

1. 代理的响应基于这些文件中的知识。 
1. 你现在可以提出与这些数据相关的问题，并获得有依据的响应。
1. 示例：`customer_info_10.json` 描述了 "Amanda Perez" 的 3 次购买

重新访问包含 Container App 端点的浏览器标签页并提问： `Amanda Perez 拥有哪些产品？`。你应该会看到类似如下内容：

![数据查询结果](../../../../../translated_images/zh-CN/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. 代理试验场

让我们通过在 Agents Playground 中试用该代理，进一步建立对 Microsoft Foundry 能力的直观理解。

1. 返回 Microsoft Foundry 中的 `Agents` 页面 - 选择默认代理
1. 点击 `Try in Playground` 选项 - 你应该会得到如下的试验场 UI
1. 提问同样的问题： `Amanda Perez 拥有哪些产品？`

    ![试验场查询](../../../../../translated_images/zh-CN/09-ask-in-playground.a1b93794f78fa676.webp)

你会得到相同（或类似）的响应——但你还会获得额外的信息，用于了解你的代理应用的质量、成本和性能。例如：

1. 注意响应引用了用于“落地”响应的数据文件
1. 将鼠标悬停在这些文件标签上 - 数据是否与查询和显示的响应匹配？

你还会在响应下方看到一行 _stats_。

1. 将鼠标悬停在任一指标上 - 例如 Safety。你会看到类似如下信息
1. 评估的评分是否与您对响应安全级别的直觉一致？

      ![运行信息计量视图](../../../../../translated_images/zh-CN/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. 内置可观测性

可观测性是指对你的应用进行监测以生成可用于理解、调试和优化其运行的数据。要感受一下这一点：

1. 点击 `View Run Info` 按钮 - 你应该会看到此视图。这是[代理追踪](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) 的一个示例。_你也可以通过在顶级菜单中点击 Thread Logs 来获得此视图_。

   - 了解运行步骤以及代理调用的工具
   - 了解响应的总 Token 数（与输出 token 使用量的对比）
   - 了解延迟以及执行中时间的消耗位置

      ![代理运行视图](../../../../../translated_images/zh-CN/10-view-run-info.b20ebd75fef6a1cc.webp)

1. 点击 `Metadata` 选项卡以查看该运行的其他属性，这些属性可能为以后调试问题提供有用的上下文。   

      ![元数据视图](../../../../../translated_images/zh-CN/11-view-run-info-metadata.7966986122c7c2df.webp)


1. 点击 `Evaluations` 选项卡以查看对代理响应的自动评估。这些评估包括安全评估（例如自残类）以及代理特定的评估（例如意图解析、任务遵从性）。

      ![评估视图](../../../../../translated_images/zh-CN/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. 最后但并非最不重要，点击侧边栏菜单中的 `Monitoring` 选项卡。

      - 在显示的页面中选择 `Resource usage` 选项卡 - 并查看指标。
      - 跟踪应用的使用情况（成本：tokens）和负载（请求）。
      - 跟踪应用延迟，从首字节（输入处理）到末字节（输出）。

      ![监控资源](../../../../../translated_images/zh-CN/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. 环境变量

到目前为止，我们已经在浏览器中完成了部署演练并验证了基础设施和应用正在运行。但要以“代码优先”的方式与应用程序协同工作，我们需要在本地开发环境中配置与这些资源交互所需的相关变量。使用 `azd` 可以很容易实现这一点。

1. Azure Developer CLI [使用环境变量](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) 来存储和管理应用部署的配置信息。

1. 环境变量存储在 `.azure/<env-name>/.env` 中 - 这使它们与部署时使用的 `env-name` 环境相关联，并帮助你在同一仓库的不同部署目标之间隔离环境。

1. 每当 `azd` 执行特定命令（例如 `azd up`）时，会自动加载环境变量。注意 `azd` 不会自动读取操作系统级别的环境变量（例如在 shell 中设置的），而是使用 `azd set env` 和 `azd get env` 在脚本中传输信息。


让我们试几个命令：

1. 获取在此环境中为 `azd` 设置的所有环境变量：

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      你会看到类似内容：

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. 获取一个特定的值 - 例如，我想知道是否设置了 `AZURE_AI_AGENT_MODEL_NAME` 值

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      你会看到类似内容 - 默认情况下未设置该值！

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. 为 `azd` 设置一个新的环境变量。在这里，我们更新代理模型名称。_注意：所做的任何更改将立即反映在 `.azure/<env-name>/.env` 文件中。_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      现在，我们应该能看到该值已设置：

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. 注意某些资源是持久的（例如模型部署），仅仅运行 `azd up` 无法强制重新部署它们。我们尝试拆除原始部署并使用更改后的环境变量重新部署。

1. **刷新** 如果你之前使用 azd 模板部署了基础设施 - 你可以使用以下命令基于当前 Azure 部署的状态刷新本地环境变量的状态：

      ```bash title="" linenums="0"
      azd env refresh
      ```

      这是在两个或多个本地开发环境（例如有多个开发者的团队）之间_同步_环境变量的强大方式 - 允许已部署的基础设施作为环境变量状态的权威来源。团队成员只需_刷新_变量即可重新同步。

---

## 9. 恭喜 🏆

您刚刚完成了一个端到端的工作流程，包括：

- [X] 已选择您想使用的 AZD 模板
- [X] 使用 GitHub Codespaces 启动了该模板 
- [X] 部署了该模板并验证其运行正常

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文件由 AI 翻译服务 Co-op Translator（https://github.com/Azure/co-op-translator）翻译而成。尽管我们力求准确，但请注意自动翻译可能包含错误或不准确之处。原始语言的原文应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们不对因使用本翻译而引起的任何误解或曲解承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->