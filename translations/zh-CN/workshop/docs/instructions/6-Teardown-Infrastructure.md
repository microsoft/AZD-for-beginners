# 6. 拆除基础设施

!!! tip "完成本模块后，您将能够"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## 额外练习

在拆除项目之前，花几分钟进行一些开放式探索。

!!! info "尝试这些探索提示"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## 取消配置基础设施

1. 拆除基础设施很简单：
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. 确认所选环境并审查将被删除的资源。这会移除 Azure 资源并可能销毁数据。在此学习流程中保留确认提示。完成后，您将看到类似的输出：
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. 在门户中验证删除并检查部署范围外的资源。成本报告和配额更新可能有延迟。本地 `.azure` 配置保留，除非您显式地将其移除。

1. `azd down --purge` 还会请求永久删除支持的软删除资源。仅在不需要恢复且您理解保留/清除保护策略时使用。它不能保证立即释放配额。

1. 不要仅为了验证清理而重新部署。后期有意的 `azd up` 可以使用剩余的本地输入重新创建资源，并会再次产生费用。模型更新通常使用支持的配置更改，而不是拆除。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->