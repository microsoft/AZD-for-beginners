# 常见问题 (FAQ)

**按章节获取帮助**
- **📚 课程首页**: [azd 初学者指南](../README.md)
- **🚆 安装问题**: [第1章：安装与设置](../docs/getting-started/installation.md)
- **🤖 AI 相关问题**: [第2章：以 AI 为先的开发](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 故障排除**: [第7章：故障排查与调试](../docs/troubleshooting/common-issues.md)

## 介绍

本综合常见问题解答提供有关 Azure 开发者 CLI (azd) 和 Azure 部署的常见问题答案。查找常见问题的快速解决方法，了解最佳实践，并澄清 azd 的概念和工作流。

## 学习目标

通过查看本常见问题解答，您将能够：
- 快速找到有关 Azure 开发者 CLI 的常见问题和解决方案
- 通过实用的问答形式理解关键概念和术语
- 获取常见问题和错误场景的故障排除解决方案
- 通过常见问题学习优化方面的最佳实践
- 通过专家级问题发现高级功能和能力
- 高效查阅成本、安全性和部署策略指南

## 学习成果

定期参考本常见问题解答，您将能够：
- 使用提供的解决方案独立解决常见的 Azure 开发者 CLI 问题
- 就部署策略和配置做出明智决策
- 理解 azd 与其他 Azure 工具和服务之间的关系
- 根据社区经验和专家建议应用最佳实践
- 有效排查身份验证、部署和配置问题
- 使用常见问题中的见解和建议优化成本和性能

## 目录

- [入门](../../../resources)
- [认证与访问](../../../resources)
- [模板与项目](../../../resources)
- [部署与基础设施](../../../resources)
- [配置与环境](../../../resources)
- [故障排除](../../../resources)
- [成本与计费](../../../resources)
- [最佳实践](../../../resources)
- [高级主题](../../../resources)

---

## 入门

### 问：什么是 Azure 开发者 CLI (azd)？
**答**：Azure 开发者 CLI (azd) 是一个面向开发者的命令行工具，可加速将应用程序从本地开发环境推送到 Azure 的时间。它通过模板提供最佳实践，并帮助管理整个部署生命周期。

### 问：azd 与 Azure CLI 有何不同？
**答**： 
- **Azure CLI**：用于管理 Azure 资源的通用工具
- **azd**：面向开发者的应用部署工作流工具
- azd 在内部使用 Azure CLI，但为常见的开发场景提供了更高级的抽象
- azd 包含模板、环境管理和部署自动化

### 问：使用 azd 是否需要安装 Azure CLI？
**答**：是的，azd 需要 Azure CLI 来进行身份验证和某些操作。请先安装 Azure CLI，然后再安装 azd。

### 问：azd 支持哪些编程语言？
**答**：azd 与语言无关。它可配合以下语言使用：
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- 静态网站
- 容器化应用程序

### 问：我可以在现有项目中使用 azd 吗？
**答**：可以！您可以选择：
1. 使用 `azd init` 为现有项目添加 azd 配置
2. 调整现有项目以符合 azd 模板结构
3. 基于现有架构创建自定义模板

---

## 认证与访问

### 问：如何使用 azd 进行 Azure 身份验证？
**答**：使用 `azd auth login`，它会打开浏览器窗口进行 Azure 身份验证。对于 CI/CD 场景，请使用服务主体或托管身份。

### 问：我可以在多个 Azure 订阅中使用 azd 吗？
**答**：可以。使用 `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` 为每个环境指定要使用的订阅。

### 问：部署时我需要哪些权限？
**答**：通常您需要：
- **Contributor** 角色（在资源组或订阅上）
- **User Access Administrator**（如果部署资源需要分配角色）
- 具体权限取决于模板和要部署的资源

### 问：我可以在 CI/CD 管道中使用 azd 吗？
**答**：当然可以！azd 专为 CI/CD 集成而设计。使用服务主体进行身份验证，并设置环境变量以进行配置。

### 问：如何在 GitHub Actions 中处理身份验证？
**答**：使用带有服务主体凭据的 Azure Login 操作：
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## 模板与项目

### 问：我在哪里可以找到 azd 模板？
**答**： 
- 官方模板： [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- 社区模板：在 GitHub 上搜索 "azd-template"
- 使用 `azd template list` 浏览可用模板

### 问：如何创建自定义模板？
**答**： 
1. 从现有模板结构开始
2. 修改 `azure.yaml`、基础设施文件和应用代码
3. 使用 `azd up` 彻底测试
4. 将其以适当的标签发布到 GitHub

### 问：我可以在没有模板的情况下使用 azd 吗？
**答**：可以，在现有项目中使用 `azd init` 创建必要的配置文件。您需要手动配置 `azure.yaml` 和基础设施文件。

### 问：官方模板与社区模板有什么区别？
**答**： 
- **官方模板**：由 Microsoft 维护，定期更新，文档全面
- **社区模板**：由开发者创建，可能具有专用用例，质量和维护情况各异

### 问：如何更新项目中的模板？
**答**：模板不会自动更新。您可以：
1. 手动比较并合并源模板的更改
2. 使用更新后的模板重新运行 `azd init`
3. 从更新的模板中挑选特定改进

---

## 部署与基础设施

### 问：azd 可以部署哪些 Azure 服务？
**答**：azd 可以通过 Bicep/ARM 模板部署任何 Azure 服务，包括：
- App Services、Container Apps、Functions
- 数据库（SQL、PostgreSQL、Cosmos DB）
- 存储、Key Vault、Application Insights
- 网络、安全和监控资源

### 问：我可以部署到多个区域吗？
**答**：可以，在 Bicep 模板中配置多个区域，并为每个环境适当设置 location 参数。

### 问：如何处理数据库架构迁移？
**答**：在 `azure.yaml` 中使用部署钩子：
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### 问：我可以只部署基础设施而不部署应用程序吗？
**答**：可以，使用 `azd provision` 仅部署模板中定义的基础设施组件。

### 问：如何将部署到现有的 Azure 资源？
**答**：这比较复杂且没有直接支持。您可以：
1. 将现有资源导入到您的 Bicep 模板中
2. 在模板中使用现有资源引用
3. 修改模板以有条件地创建或引用资源

### 问：我可以使用 Terraform 替代 Bicep 吗？
**答**：目前，azd 主要支持 Bicep/ARM 模板。Terraform 支持并非官方提供，尽管可能存在社区解决方案。

---

## 配置与环境

### 问：如何管理不同的环境（dev、staging、prod）？
**答**：使用 `azd env new <environment-name>` 创建独立环境，并为每个环境配置不同设置：
```bash
azd env new development
azd env new staging  
azd env new production
```

### 问：环境配置存储在哪里？
**答**：在项目目录内的 `.azure` 文件夹中。每个环境都有自己的文件夹和配置文件。

### 问：如何设置环境特定的配置？
**答**：使用 `azd env set` 配置环境变量：
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### 问：我可以在团队成员之间共享环境配置吗？
**答**：`.azure` 文件夹包含敏感信息，不应提交到版本控制。替代方案：
1. 记录所需的环境变量
2. 使用部署脚本来设置环境
3. 对于敏感配置使用 Azure Key Vault

### 问：如何覆盖模板的默认值？
**答**：设置与模板参数对应的环境变量：
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## 故障排除

### 问：为什么 `azd up` 失败？
**答**：常见原因：
1. **身份验证问题**：运行 `azd auth login`
2. **权限不足**：检查您的 Azure 角色分配
3. **资源命名冲突**：更改 AZURE_ENV_NAME
4. **配额/容量问题**：检查区域可用性
5. **模板错误**：验证 Bicep 模板

### 问：如何调试部署失败？
**答**： 
1. 使用 `azd deploy --debug` 获取详细输出
2. 检查 Azure 门户中的部署历史
3. 查看 Azure 门户中的活动日志
4. 使用 `azd show` 显示当前环境状态

### 问：为什么我的环境变量不起作用？
**答**：检查：
1. 变量名称与模板参数完全匹配
2. 如果值包含空格，请正确加引号
3. 已选择正确环境：`azd env select <environment>`
4. 变量已在正确的环境中设置

### 问：如何清理失败的部署？
**答**： 
```bash
azd down --force --purge
```
这将删除所有资源和环境配置。

### 问：为什么我的应用部署后无法访问？
**答**：检查：
1. 部署是否成功完成
2. 应用是否在运行（在 Azure 门户中检查日志）
3. 网络安全组是否允许流量
4. DNS/自定义域名是否正确配置

---

## 成本与计费

### 问：azd 部署大概需要多少钱？
**答**：费用取决于：
- 部署的 Azure 服务
- 选择的服务层级/SKU
- 区域价格差异
- 使用模式

使用 [Azure 定价计算器](https://azure.microsoft.com/pricing/calculator/) 进行估算。

### 问：如何在 azd 部署中控制成本？
**答**： 
1. 在开发环境使用较低层级的 SKU
2. 设置 Azure 预算和警报
3. 使用 `azd down` 在不需要时删除资源
4. 选择合适的区域（不同位置费用不同）
5. 使用 Azure 成本管理工具

### 问：azd 模板有免费层选项吗？
**答**：许多 Azure 服务提供免费层：
- App Service：提供免费层
- Azure Functions：每月 100 万次免费执行
- Cosmos DB：提供 400 RU/s 的免费层
- Application Insights：前 5GB/月免费

在可用时将模板配置为使用免费层。

### 问：如何在部署前估算费用？
**答**： 
1. 检查模板的 `main.bicep` 以了解会创建哪些资源
2. 使用 Azure 定价计算器并选择具体 SKU
3. 先部署到开发环境以监控实际费用
4. 使用 Azure 成本管理进行详细成本分析

---

## 最佳实践

### 问：azd 项目结构的最佳实践是什么？
**答**： 
1. 将应用代码与基础设施分离
2. 在 `azure.yaml` 中使用有意义的服务名称
3. 在构建脚本中实现适当的错误处理
4. 使用环境特定配置
5. 包含详尽的文档

### 问：我应该如何组织 azd 中的多个服务？
**答**：使用推荐的结构：
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### 问：我应该将 `.azure` 文件夹提交到版本控制吗？
**答**：**不！** `.azure` 文件夹包含敏感信息。将其添加到 `.gitignore`：
```gitignore
.azure/
```

### 问：如何处理机密和敏感配置？
**答**： 
1. 使用 Azure Key Vault 存储机密
2. 在应用配置中引用 Key Vault 机密
3. 切勿将机密提交到版本控制
4. 使用托管身份进行服务间身份验证

### 问：使用 azd 的 CI/CD 推荐方法是什么？
**答**： 
1. 为每个阶段使用独立环境（dev/staging/prod）
2. 在部署前实现自动化测试
3. 使用服务主体进行身份验证
4. 在管道机密/变量中存储敏感配置
5. 对生产部署实现审批门控

---

## 高级主题

### 问：我可以通过自定义功能扩展 azd 吗？
**答**：可以，通过在 `azure.yaml` 中使用部署钩子：
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### 问：如何将 azd 与现有的 DevOps 流程集成？
**答**： 
1. 在现有管道脚本中使用 azd 命令
2. 在团队间标准化 azd 模板
3. 与现有的监控和告警集成
4. 在管道集成中使用 azd 的 JSON 输出

### 问：我可以在 Azure DevOps 中使用 azd 吗？
**答**：可以，azd 可与任何 CI/CD 系统配合使用。创建使用 azd 命令的 Azure DevOps 管道即可。

### 问：我如何为 azd 做贡献或创建社区模板？
1. **azd 工具**：贡献到 [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **模板**：按照 [模板指南](https://github.com/Azure-Samples/awesome-azd) 创建模板
3. **文档**：在 [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs) 贡献文档

### 问：azd 的路线图是什么？
**答**：查看 [官方路线图](https://github.com/Azure/azure-dev/projects) 以了解计划的功能和改进。

### 问：如何将其他部署工具迁移到 azd？
**答**： 
1. 分析当前的部署架构
2. 创建等效的 Bicep 模板
3. 配置 `azure.yaml` 以匹配当前服务
4. 在开发环境中彻底测试
5. 逐步迁移各个环境

---

## 还有疑问吗？

### **先搜索**
- 查看 [官方文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- 在 [GitHub issues](https://github.com/Azure/azure-dev/issues) 中搜索类似问题

### **获取帮助**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - 社区支持
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - 技术问题
- [Azure Discord](https://discord.gg/azure) - 实时社区聊天

### **报告问题**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - 错误报告和功能请求
- 请包含相关日志、错误信息和重现步骤

### **了解更多**
- [Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架构中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 良好架构框架](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*此常见问题解答会定期更新。最后更新：2025年9月9日*

---

**导航**
- **上一课**: [术语表](glossary.md)
- **下一课**: [学习指南](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文档已使用 AI 翻译服务 Co-op Translator (https://github.com/Azure/co-op-translator) 进行翻译。尽管我们努力保证准确性，但请注意自动翻译可能存在错误或不准确之处。原文应被视为权威来源。对于重要信息，建议使用专业人工翻译。因使用本翻译而产生的任何误解或曲解，我们概不负责。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->