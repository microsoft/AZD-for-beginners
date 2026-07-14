# 2. 验证模板

> 验证于2026年7月使用 `azd 1.27.1`。

!!! tip "完成本模块后，您将能够"

    - [ ] 分析 AI 解决方案架构
    - [ ] 理解 AZD 部署工作流程
    - [ ] 使用 GitHub Copilot 获取 AZD 使用帮助
    - [ ] **实验2：** 部署并验证 AI Agents 模板

---


## 1. 介绍

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) 或 `azd` 是一款开源命令行工具，可简化开发者在构建和部署应用程序到 Azure 时的工作流程。

[AZD 模板](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) 是包含示例应用代码、_基础设施即代码_ 资源和 `azd` 配置文件的标准化仓库，构成统一的解决方案架构。基础设施的配置变得像执行 `azd provision` 命令一样简单，而使用 `azd up` 则能够一次性完成基础设施的配置和应用的部署！

因此，启动您的应用开发流程可以简单地找到最接近您应用和基础设施需求的 _AZD Starter 模板_，然后定制仓库以满足您的场景需求。

在开始之前，让我们确认您已安装 Azure Developer CLI。

1. 打开 VS Code 终端并输入命令：

      ```bash title="" linenums="0"
      azd version
      ```

1. 您应会看到类似下述内容！

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**您现在已准备好使用 azd 选择并部署模板**

---

## 2. 模板选择

Microsoft Foundry 平台提供了一套[推荐的 AZD 模板](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)，涵盖了诸如_多代理工作流自动化_与_多模态内容处理_等热门解决方案场景。您也可以通过访问 Microsoft Foundry 门户发现这些模板。

1. 访问 [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. 按提示登录 Microsoft Foundry 门户 - 您将看到类似界面。

![Pick](../../../../../translated_images/zh-CN/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** 选项即为您的入门模板：

1. [ ] [AI Chat 入门](https://github.com/Azure-Samples/get-started-with-ai-chat)，可部署一个基础聊天应用程序，_用您的数据_ 部署到 Azure Container Apps。通过它探索基础 AI 聊天机器人场景。
1. [X] [AI Agents 入门](https://github.com/Azure-Samples/get-started-with-ai-agents)，同时也部署一个标准 AI Agent（含 Foundry Agents）。通过它熟悉涉及工具和模型的代理式 AI 解决方案。

在新浏览器标签中访问第二个链接（或点击相关卡片的 `Open in GitHub`）。您应看到此 AZD 模板的仓库。花点时间浏览 README。应用架构如下：

![Arch](../../../../../translated_images/zh-CN/architecture.8cec470ec15c65c7.webp)

---

## 3. 模板激活

让我们尝试部署此模板并验证它的有效性。我们将遵循[入门指南](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started)部分的步骤。

1. 选择模板仓库的工作环境：

      - **GitHub Codespaces**：点击[此链接](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents)，并确认 `Create codespace`
      - <strong>本地克隆或开发容器</strong>：克隆 `Azure-Samples/get-started-with-ai-agents` 并在 VS Code 中打开

1. 等待 VS Code 终端就绪，输入以下命令：

   ```bash title="" linenums="0"
   azd up
   ```

完成将触发的工作流程步骤：

1. 系统会提示您登录 Azure - 按照指示进行身份验证
1. 输入一个唯一的环境名 - 例如我的 `nitya-mshack-azd`
1. 这会创建 `.azure/` 文件夹 - 您会在其中看到以环境名命名的子文件夹
1. 系统会提示选择订阅名称 - 请选择默认项
1. 系统会提示选择位置 - 使用 `East US 2`

现在，您等待配置完成。**此过程需要10-15分钟**

1. 完成后，控制台将显示类似如下的成功消息：
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. 您的 Azure 门户现在会有一个以您的环境名命名的资源组：

      ![Infra](../../../../../translated_images/zh-CN/02-provisioned-infra.46c706b14f56e0bf.webp)

1. <strong>您现在可以验证已部署的基础设施和应用程序了</strong>。

---

## 4. 模板验证

1. 访问 Azure 门户的 [资源组](https://portal.azure.com/#browse/resourcegroups) 页面 - 登录。
1. 点击您环境名对应的资源组 - 您会看到上述页面

      - 点击 Azure Container Apps 资源
      - 点击 _Essentials_ 部分（右上角）中的应用程序 URL

1. 应显示类似的托管应用前端界面：

   ![App](../../../../../translated_images/zh-CN/03-test-application.471910da12c3038e.webp)

1. 尝试提出几个[示例问题](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. 问：```法国的首都是什么？```
      1. 问：```预算200美元以下两人帐篷推荐及其特点？```

1. 您应该看到与下方类似的答案。_这到底是如何工作的？_

      ![App](../../../../../translated_images/zh-CN/03-test-question.521c1e863cbaddb6.webp)

---

## 5. 代理验证

Azure Container App 部署了一个端点，用于连接此模板中 Microsoft Foundry 项目中部署的 AI 代理。让我们看看这意味着什么。

1. 返回 Azure 门户中资源组的 _概览_ 页面

1. 点击列表中的 `Microsoft Foundry` 资源

1. 您应看到此页面。点击 `转到 Microsoft Foundry 门户` 按钮。
   ![Foundry](../../../../../translated_images/zh-CN/04-view-foundry-project.fb94ca41803f28f3.webp)

1. 您应看到您的 AI 应用 Foundry 项目页面
   ![Project](../../../../../translated_images/zh-CN/05-visit-foundry-portal.d734e98135892d7e.webp)

1. 点击 `Agents` - 您将看到项目中默认部署的代理
   ![Agents](../../../../../translated_images/zh-CN/06-visit-agents.bccb263f77b00a09.webp)

1. 选中它 - 看到代理详情。注意如下：

      - 代理默认使用文件搜索（始终如此）
      - 代理的 `Knowledge` 显示已上传32个文件（用于文件搜索）
      ![Agents](../../../../../translated_images/zh-CN/07-view-agent-details.0e049f37f61eae62.webp)

1. 在左侧菜单中找到 `Data+indexes` 选项并点击查看详情。

      - 您应看到为知识库上传的32个数据文件。
      - 这些文件对应于 `src/files` 下的12个客户文件和20个产品文件
      ![Data](../../../../../translated_images/zh-CN/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**您已经验证了代理的运行！**

1. 代理的回答基于这些文件中的知识。
1. 您现在可以针对那数据提问，并获得基于知识的回答。
1. 示例：`customer_info_10.json` 描述了 "Amanda Perez" 的3次购买记录。

回到浏览器标签页中的 Container App 端点，问：`Amanda Perez 拥有哪些产品？`。您应看到如下：

![Data](../../../../../translated_images/zh-CN/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. 代理操场

让我们通过在代理操场中体验代理，以增进对 Microsoft Foundry 功能的直观感受。

1. 返回 Microsoft Foundry 的 `Agents` 页面 - 选择默认代理
1. 点击 `Try in Playground` 选项 - 您应看到如下操场界面
1. 提出相同问题：`Amanda Perez 拥有哪些产品？`

    ![Data](../../../../../translated_images/zh-CN/09-ask-in-playground.a1b93794f78fa676.webp)

您会获得相同（或类似）的回答，同时还能获得额外信息，用以理解您的代理应用的质量、成本及性能。例如：

1. 注意回答中引用了用于“支撑”该回答的数据文件
1. 将鼠标悬停在任意文件标签上 - 数据是否与您的查询和显示的回答相匹配？

您还会看到回答下方有一行_统计_数据。

1. 将鼠标悬停在任意指标上 - 比如安全性。您会看到如下内容
1. 评估的评级是否符合您对回答安全性的直觉判断？

      ![Data](../../../../../translated_images/zh-CN/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. 内置可观察性

可观察性是指为您的应用添加度量，以生成可用于理解、调试和优化其运行的数据。体验一下：

1. 点击 `查看运行信息(View Run Info)` 按钮 - 您将看到此视图。这是[代理跟踪](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground)功能的示例。_您也可以通过点击顶层菜单的 Thread Logs 获得此视图_。

   - 了解代理执行的步骤和调用的工具
   - 看到响应的令牌总数（以及输出令牌消耗）
   - 了解延迟及执行时间分布

      ![Agent](../../../../../translated_images/zh-CN/10-view-run-info.b20ebd75fef6a1cc.webp)

1. 点击 `元数据(Metadata)` 标签，查看运行的附加属性，可能对后续调试提供上下文。

      ![Agent](../../../../../translated_images/zh-CN/11-view-run-info-metadata.7966986122c7c2df.webp)


1. 点击 `评估(Evaluations)` 标签查看对代理回答的自动评估。这包括安全性评估（如自残风险）和代理特定评估（如意图解析、任务执行）。

      ![Agent](../../../../../translated_images/zh-CN/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. 最后，点击侧边栏菜单中的 `监控(Monitoring)` 标签。

      - 选择显示页中的 `资源使用(Resource usage)` 标签 - 查看相关指标。
      - 监控应用的成本（令牌数）和负载（请求数）。
      - 监控应用从输入处理到输出的延迟时间。

      ![Agent](../../../../../translated_images/zh-CN/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. 环境变量

目前我们已经在浏览器中完成部署，并验证了基础设施已配置且应用正常运行。但如果要采用 _代码优先_ 的方式开发应用，我们需要为本地开发环境配置相关变量以使用这些资源。使用 `azd` 使这一过程变得简单。

1. Azure Developer CLI [使用环境变量](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash)来存储和管理应用部署的配置设置。

1. 环境变量存储在 `.azure/<env-name>/.env` 文件中 - 这样它们被限定在部署时使用的 `env-name` 环境中，有助于您在相同仓库下隔离不同部署目标的环境。

1. 当执行某个命令（如 `azd up`）时，`azd` 会自动加载环境变量。注意，`azd` 不会自动读取 _操作系统级别_ 的环境变量（如 shell 中设置的）——应使用 `azd set env` 和 `azd get env` 在脚本中传递信息。


让我们尝试几个命令：

1. 获取当前环境中为 `azd` 设置的所有环境变量：

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      您会看到类似内容：

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. 获取某个特定值 - 例如，我想知道有没有设置 `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      您将看到类似结果 - 默认未设置！

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. 为 `azd` 设置一个新的环境变量。在此示例中，我们更新代理模型名称。_注意：任何更改会立即反映到 `.azure/<env-name>/.env` 文件中。

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      现在，查看该值是否已设置：

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. 请注意，有些资源是持久的（例如模型部署），仅通过 `azd up` 可能无法强制重新部署。我们尝试先拆除原有部署，再带更改后的环境变量重新部署。

1. <strong>刷新</strong> 若先前使用 azd 模板部署过基础设施，您可以使用此命令基于 Azure 部署的当前状态_刷新_本地环境变量的状态：

      ```bash title="" linenums="0"
      azd env refresh
      ```


      这是一种强大的方式，可以在两个或更多本地开发环境之间_同步_环境变量（例如，多开发者的团队）——使已部署的基础设施作为环境变量状态的真实来源。团队成员只需_刷新_变量即可重新同步。

---

## 9. 恭喜 🏆

你刚刚完成了一个端到端的工作流程，你：

- [X] 选择了你想使用的 AZD 模板
- [X] 在支持的开发环境中打开了该模板
- [X] 部署了模板并验证其可用

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->