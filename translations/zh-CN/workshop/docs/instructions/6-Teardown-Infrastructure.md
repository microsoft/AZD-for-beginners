# 6. 拆除基础设施

!!! tip "在本模块结束时您将能够"

    - [ ] 了解资源清理和成本管理的重要性
    - [ ] 使用 `azd down` 安全撤销基础设施配置
    - [ ] 根据需要恢复被软删除的认知服务
    - [ ] **实验 6:** 清理 Azure 资源并验证移除

---

## 额外练习

在我们拆除项目之前，花几分钟做一些开放式探索。

!!! info "尝试这些探索提示"

    **使用 GitHub Copilot 进行实验：**
    
    1. 提问：`What other AZD templates could I try for multi-agent scenarios?`
    2. 提问：`How can I customize the agent instructions for a healthcare use case?`
    3. 提问：`What environment variables control cost optimization?`
    
    **探索 Azure 门户：**
    
    1. 查看部署的 Application Insights 指标
    2. 检查已配置资源的成本分析
    3. 再次探索 Microsoft Foundry 门户中的 agent playground

---

## 取消基础设施配置

1. 撤销基础设施配置非常简单：
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. The `--purge` flag ensures that it also purges soft-deleted Cognitive Service resources, thereby releasing quota held by these resources. Once complete you will see something like this:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (可选) 如果现在再次运行 `azd up`，你会注意到 gpt-4.1 模型会被部署，因为环境变量已在本地 `.azure` 文件夹中更改（并保存）。 

      以下是模型部署的**之前**：

      ![部署前](../../../../../translated_images/zh-CN/14-deploy-initial.30e4cf1c29b587bc.webp)

      而这是**之后**：
      ![部署后](../../../../../translated_images/zh-CN/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文件由 AI 翻译服务 Co-op Translator (https://github.com/Azure/co-op-translator) 翻译。尽管我们尽力确保准确性，但请注意自动翻译可能包含错误或不准确之处。原始语言版本的文档应被视为权威来源。对于重要信息，建议使用专业人工翻译。对于因使用本翻译而引起的任何误解或错误解释，我们不承担任何责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->