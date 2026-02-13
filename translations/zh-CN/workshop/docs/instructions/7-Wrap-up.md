# 7. 结语与下一步

!!! tip "主要收获要点"

    - [ ] AZD 模板将 AI 应用开发从数天缩短到数小时
    - [ ] 发现 → 部署 → 定制 方法论提供结构化学习路径
    - [ ] 在 MCP 服务器上使用 GitHub Copilot 可以以自然语言探索复杂代码库
    - [ ] Microsoft Foundry 提供内置的可观测性、评估和安全测试

---

## 1. 你完成的内容

恭喜！在本次研讨会中，你已成功完成：

| 模块 | 成果 |
|:---|:---|
| **模块 1** | 发现了 Azure Developer CLI 并选择了一个 AI 模板 |
| **模块 2** | 部署并验证了完整的 AI 代理解决方案 |
| **模块 3** | 拆解模板以理解其架构 |
| **模块 4** | 探索了 `azure.yaml` 配置和生命周期钩子 |
| **模块 5** | 为你的场景定制了模板 |
| **模块 6** | 安全地拆除基础设施并管理资源 |

---

## 2. 掌握的关键概念

### Azure Developer CLI (azd)
- `azd init` - 从模板初始化项目
- `azd up` - 一条命令完成预配和部署
- `azd env` - 管理环境变量
- `azd down` - 安全地清理资源

### AZD 模板结构
- `azure.yaml` - 配置与部署钩子
- `infra/` - Bicep 基础设施即代码
- `src/` - 应用源代码
- `scripts/` - 自动化与设置脚本

### Microsoft Foundry 功能
- 面向智能助手的 AI Agent 服务
- 用于知识检索的文件搜索和 Azure AI Search
- 内置的追踪、监控和评估
- 用于 AI 安全验证的红队测试

---

## 3. 继续你的学习之旅

### 推荐的下一步

| 路径 | 资源 | 时间 |
|:---|:---|:---|
| **完整课程** | [AZD 初学者课程](../../README.md) | 8-12 小时 |
| **尝试另一个模板** | [Microsoft Foundry 模板](https://ai.azure.com/templates) | 1-2 小时 |
| **深入学习** | [Azure Developer CLI 文档](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | 持续进行 |
| **社区** | [Azure Discord](https://aka.ms/foundry/discord) | 立即加入！ |

### 建议接下来的模板

1. **[开始使用 AI 聊天](https://github.com/Azure-Samples/get-started-with-ai-chat)** - 使用你的数据进行基础聊天
2. **[Azure Search OpenAI 示例](https://github.com/Azure-Samples/azure-search-openai-demo)** - 高级 RAG 模式
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - 企业零售场景

---

## 4. 研讨会挑战

准备好测试你的技能了吗？尝试这些挑战：

| 挑战 | 描述 | 难度 |
|:---|:---|:---|
| **1. 多代理场景** | 为不同行业部署并定制（例如：医疗、金融） | ⭐⭐ |
| **2. 自定义知识库** | 添加你自己的数据文件并创建自定义搜索索引 | ⭐⭐⭐ |
| **3. 生产环境部署** | 使用 `azd pipeline config` 通过 GitHub Actions 设置 CI/CD | ⭐⭐⭐⭐ |

---

## 5. 分享你的反馈

你的反馈有助于我们改进本次研讨会！

- **GitHub Issues**: [提交反馈](https://github.com/microsoft/azd-for-beginners/issues) - 标记为 `Workshop`
- **Discord**: 加入 [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - 在 `#get-help` 发布
- **贡献**：通过提交 Pull Requests 来帮助改进研讨会！

---

## 感谢！ 🎉

感谢你完成 AZD for AI Developers 研讨会。我们希望这次体验能让你具备在 Azure 上构建和部署 AI 应用的技能与信心。

**继续构建，持续学习，欢迎加入 Azure AI 开发者社区！**

---

| | |
|:---|:---|
| **📚 课程主页** | [AZD 入门](../../README.md) |
| **📖 文档** | [Azure Developer CLI 文档](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI 模板** | [Microsoft Foundry 模板](https://ai.azure.com/templates) |
| **💬 社区** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文件已使用 AI 翻译服务 Co-op Translator（https://github.com/Azure/co-op-translator）进行翻译。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版本的文档应被视为权威来源。对于关键信息，建议采用专业人工翻译。我们不对因使用本翻译而引起的任何误解或误释承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->