# 6. 拆除基础设施

!!! tip "本模块结束时，您将能够"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## 额外练习

在拆除项目之前，花几分钟时间进行一些开放式探索。

!!! info "试试这些探索提示"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## 撤销基础设施

!!! warning "如果您也完成了 GA 托管代理练习"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. 拆除基础设施非常简单：
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. 确认所选环境并检查将被删除的资源。这会移除 Azure 资源并可能破坏数据。为本学习工作流保留确认提示。完成后，您将看到类似的输出：
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. 在门户中验证删除，并检查部署范围外的资源。成本报告和配额更新可能有延迟。除非您明确删除，否则本地 `.azure` 配置将保留。

1. `azd down --purge` 还请求永久删除支持的软删除资源。仅当不需要恢复且了解保留/清理保护策略时使用。它不保证立即释放配额。

1. 不要仅为验证清理而重新部署。稍后有意的 `azd up` 可以使用剩余的本地输入重新创建资源，并会再次产生费用。模型更新通常使用受支持的配置更改，而非拆除。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->