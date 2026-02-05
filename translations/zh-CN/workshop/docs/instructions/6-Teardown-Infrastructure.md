# 6. 拆除基础设施

!!! tip "完成本模块后，你将能够："

    - [ ] 项目
    - [ ] 项目
    - [ ] 项目

---

## 额外练习

在拆除项目之前，花几分钟进行一些开放式探索。

!!! danger "NITYA-TODO: 列出一些可以尝试的提示"

---

## 取消基础设施配置

1. 拆除基础设施非常简单，只需执行以下步骤：
      
      ```bash title="" linenums="0"
      azd down --purge
      ```

1. `--purge` 标志确保同时清除软删除的认知服务资源，从而释放这些资源占用的配额。完成后，你会看到类似以下的内容：
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. （可选）如果你现在再次运行 `azd up`，你会注意到 gpt-4.1 模型被部署了，因为环境变量已在本地 `.azure` 文件夹中更改并保存。

      以下是模型部署的 **之前** 状态：

      ![初始状态](../../../../../translated_images/zh-CN/14-deploy-initial.30e4cf1c29b587bc.webp)

      以下是 **之后** 的状态：
      ![新状态](../../../../../translated_images/zh-CN/14-deploy-new.f7f3c355a3cf7299.webp)

---

