<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a82d27b84022e9b7c7a163f99fa1fd25",
  "translation_date": "2025-09-17T12:43:09+00:00",
  "source_file": "resources/faq.md",
  "language_code": "zh"
}
-->
# 常见问题解答 (FAQ)

**按章节获取帮助**
- **📚 课程主页**: [AZD 初学者指南](../README.md)
- **🚆 安装问题**: [第1章: 安装与设置](../docs/getting-started/installation.md)
- **🤖 AI相关问题**: [第2章: AI优先开发](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 故障排除**: [第7章: 故障排除与调试](../docs/troubleshooting/common-issues.md)

## 简介

本综合FAQ提供了关于Azure Developer CLI (azd)和Azure部署的常见问题解答。快速找到问题的解决方案，了解最佳实践，并掌握azd的概念和工作流程。

## 学习目标

通过阅读本FAQ，您将能够：
- 快速找到Azure Developer CLI常见问题和解决方案
- 通过实用的问答形式理解关键概念和术语
- 获取常见问题和错误场景的故障排除方案
- 通过常见优化问题学习最佳实践
- 通过专家级问题发现高级功能和能力
- 高效参考成本、安全性和部署策略指导

## 学习成果

定期参考本FAQ，您将能够：
- 独立解决Azure Developer CLI的常见问题
- 就部署策略和配置做出明智决策
- 理解azd与其他Azure工具和服务之间的关系
- 根据社区经验和专家建议应用最佳实践
- 有效排除身份验证、部署和配置问题
- 利用FAQ中的建议优化成本和性能

## 目录

- [入门](../../../resources)
- [身份验证与访问](../../../resources)
- [模板与项目](../../../resources)
- [部署与基础设施](../../../resources)
- [配置与环境](../../../resources)
- [故障排除](../../../resources)
- [成本与计费](../../../resources)
- [最佳实践](../../../resources)
- [高级主题](../../../resources)

---

## 入门

### 问: 什么是Azure Developer CLI (azd)?
**答**: Azure Developer CLI (azd) 是一个以开发者为中心的命令行工具，可加速将应用程序从本地开发环境部署到Azure的过程。它通过模板提供最佳实践，并帮助完成整个部署生命周期。

### 问: azd与Azure CLI有何不同?
**答**: 
- **Azure CLI**: 用于管理Azure资源的通用工具
- **azd**: 专注于应用程序部署工作流的开发者工具
- azd内部使用Azure CLI，但为常见开发场景提供更高层次的抽象
- azd包括模板、环境管理和部署自动化功能

### 问: 使用azd需要安装Azure CLI吗?
**答**: 是的，azd需要Azure CLI进行身份验证和部分操作。请先安装Azure CLI，然后再安装azd。

### 问: azd支持哪些编程语言?
**答**: azd对语言没有限制。它支持：
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- 静态网站
- 容器化应用程序

### 问: 我可以将azd用于现有项目吗?
**答**: 可以！您可以：
1. 使用`azd init`为现有项目添加azd配置
2. 调整现有项目以匹配azd模板结构
3. 根据现有架构创建自定义模板

---

## 身份验证与访问

### 问: 如何使用azd进行Azure身份验证?
**答**: 使用`azd auth login`命令，它会打开一个浏览器窗口进行Azure身份验证。对于CI/CD场景，可以使用服务主体或托管身份。

### 问: azd可以用于多个Azure订阅吗?
**答**: 可以。使用`azd env set AZURE_SUBSCRIPTION_ID <subscription-id>`为每个环境指定订阅。

### 问: 部署时需要哪些权限?
**答**: 通常需要：
- **Contributor**角色，用于资源组或订阅
- **User Access Administrator**，如果部署的资源需要角色分配
- 具体权限因模板和部署的资源而异

### 问: azd可以用于CI/CD管道吗?
**答**: 完全可以！azd专为CI/CD集成设计。使用服务主体进行身份验证，并设置环境变量进行配置。

### 问: 如何在GitHub Actions中处理身份验证?
**答**: 使用Azure Login操作并提供服务主体凭据：
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## 模板与项目

### 问: 哪里可以找到azd模板?
**答**: 
- 官方模板: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- 社区模板: 在GitHub搜索“azd-template”
- 使用`azd template list`浏览可用模板

### 问: 如何创建自定义模板?
**答**: 
1. 从现有模板结构开始
2. 修改`azure.yaml`、基础设施文件和应用程序代码
3. 使用`azd up`进行全面测试
4. 在GitHub上发布并添加适当标签

### 问: 可以不使用模板直接使用azd吗?
**答**: 可以，使用`azd init`命令在现有项目中创建必要的配置文件。您需要手动配置`azure.yaml`和基础设施文件。

### 问: 官方模板与社区模板有何区别?
**答**: 
- **官方模板**: 由微软维护，定期更新，文档全面
- **社区模板**: 由开发者创建，可能有特定用途，质量和维护情况各异

### 问: 如何更新项目中的模板?
**答**: 模板不会自动更新。您可以：
1. 手动比较并合并源模板的更改
2. 使用更新的模板重新运行`azd init`
3. 从更新的模板中挑选特定改进

---

## 部署与基础设施

### 问: azd可以部署哪些Azure服务?
**答**: azd可以通过Bicep/ARM模板部署任何Azure服务，包括：
- 应用服务、容器应用、函数
- 数据库 (SQL, PostgreSQL, Cosmos DB)
- 存储、密钥保管库、应用程序洞察
- 网络、安全和监控资源

### 问: 可以部署到多个区域吗?
**答**: 可以，在Bicep模板中配置多个区域，并为每个环境设置适当的location参数。

### 问: 如何处理数据库架构迁移?
**答**: 在`azure.yaml`中使用部署钩子：
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### 问: 可以只部署基础设施而不部署应用程序吗?
**答**: 可以，使用`azd provision`命令仅部署模板中定义的基础设施组件。

### 问: 如何部署到现有Azure资源?
**答**: 这较为复杂，无法直接支持。您可以：
1. 将现有资源导入到您的Bicep模板中
2. 在模板中引用现有资源
3. 修改模板以有条件地创建或引用资源

### 问: 可以使用Terraform代替Bicep吗?
**答**: 目前azd主要支持Bicep/ARM模板。Terraform尚未得到官方支持，但可能存在社区解决方案。

---

## 配置与环境

### 问: 如何管理不同环境 (开发、测试、生产)?
**答**: 使用`azd env new <environment-name>`创建单独的环境，并为每个环境配置不同的设置：
```bash
azd env new development
azd env new staging  
azd env new production
```

### 问: 环境配置存储在哪里?
**答**: 存储在项目目录中的`.azure`文件夹内。每个环境都有自己的文件夹和配置文件。

### 问: 如何设置环境特定的配置?
**答**: 使用`azd env set`命令设置环境变量：
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### 问: 可以在团队成员之间共享环境配置吗?
**答**: `.azure`文件夹包含敏感信息，不应提交到版本控制。建议：
1. 记录所需的环境变量
2. 使用部署脚本设置环境
3. 使用Azure Key Vault存储敏感配置

### 问: 如何覆盖模板默认值?
**答**: 设置与模板参数对应的环境变量：
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## 故障排除

### 问: 为什么`azd up`命令失败?
**答**: 常见原因：
1. **身份验证问题**: 运行`azd auth login`
2. **权限不足**: 检查您的Azure角色分配
3. **资源命名冲突**: 更改AZURE_ENV_NAME
4. **配额/容量问题**: 检查区域可用性
5. **模板错误**: 验证Bicep模板

### 问: 如何调试部署失败?
**答**: 
1. 使用`azd deploy --debug`查看详细输出
2. 检查Azure门户中的部署历史记录
3. 查看Azure门户中的活动日志
4. 使用`azd show`显示当前环境状态

### 问: 为什么我的环境变量不起作用?
**答**: 检查：
1. 变量名称与模板参数完全匹配
2. 如果值包含空格，确保正确引用
3. 已选择正确的环境: `azd env select <environment>`
4. 在正确的环境中设置变量

### 问: 如何清理失败的部署?
**答**: 
```bash
azd down --force --purge
```
此命令会删除所有资源和环境配置。

### 问: 为什么部署后我的应用程序无法访问?
**答**: 检查：
1. 部署是否成功完成
2. 应用程序是否正在运行 (在Azure门户中查看日志)
3. 网络安全组是否允许流量
4. DNS/自定义域是否正确配置

---

## 成本与计费

### 问: azd部署的成本是多少?
**答**: 成本取决于：
- 部署的Azure服务
- 服务层级/SKU选择
- 区域定价差异
- 使用模式

使用[Azure定价计算器](https://azure.microsoft.com/pricing/calculator/)进行估算。

### 问: 如何控制azd部署的成本?
**答**: 
1. 在开发环境中使用较低层级的SKU
2. 设置Azure预算和警报
3. 使用`azd down`在不需要时删除资源
4. 选择适当的区域 (成本因位置而异)
5. 使用Azure成本管理工具

### 问: azd模板是否有免费层选项?
**答**: 许多Azure服务提供免费层：
- 应用服务: 提供免费层
- Azure Functions: 每月1百万次免费执行
- Cosmos DB: 免费层提供400 RU/s
- 应用程序洞察: 每月前5GB免费

在模板中配置使用免费层 (如果可用)。

### 问: 如何在部署前估算成本?
**答**: 
1. 查看模板的`main.bicep`文件，了解创建的资源
2. 使用Azure定价计算器选择具体SKU
3. 先部署到开发环境以监控实际成本
4. 使用Azure成本管理进行详细成本分析

---

## 最佳实践

### 问: azd项目结构的最佳实践是什么?
**答**: 
1. 将应用程序代码与基础设施分开
2. 在`azure.yaml`中使用有意义的服务名称
3. 在构建脚本中实现适当的错误处理
4. 使用环境特定的配置
5. 包含全面的文档

### 问: 如何在azd中组织多个服务?
**答**: 使用推荐的结构：
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### 问: `.azure`文件夹是否应该提交到版本控制?
**答**: **不可以！** `.azure`文件夹包含敏感信息。将其添加到`.gitignore`:
```gitignore
.azure/
```

### 问: 如何处理秘密和敏感配置?
**答**: 
1. 使用Azure Key Vault存储秘密
2. 在应用程序配置中引用Key Vault秘密
3. 不要将秘密提交到版本控制
4. 使用托管身份进行服务间身份验证

### 问: 使用azd进行CI/CD的推荐方法是什么?
**答**: 
1. 为每个阶段 (开发/测试/生产) 使用单独的环境
2. 在部署前实现自动化测试
3. 使用服务主体进行身份验证
4. 在管道中存储敏感配置为秘密/变量
5. 为生产部署实施审批流程

---

## 高级主题

### 问: 可以通过自定义功能扩展azd吗?
**答**: 可以，通过在`azure.yaml`中使用部署钩子：
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### 问: 如何将azd与现有DevOps流程集成?
**答**: 
1. 在现有管道脚本中使用azd命令
2. 在团队中标准化azd模板
3. 与现有监控和警报系统集成
4. 使用azd的JSON输出进行管道集成

### 问: azd可以与Azure DevOps一起使用吗?
**答**: 可以，azd适用于任何CI/CD系统。创建使用azd命令的Azure DevOps管道。

### 问: 如何为azd贡献或创建社区模板?
**答**: 
1. **azd工具**: 为[Azure/azure-dev](https://github.com/Azure/azure-dev)项目贡献代码
2. **模板**：按照[模板指南](https://github.com/Azure-Samples/awesome-azd)创建模板  
3. **文档**：在[MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)贡献文档  

### 问：azd 的路线图是什么？  
**答**：查看[官方路线图](https://github.com/Azure/azure-dev/projects)，了解计划中的功能和改进。  

### 问：如何从其他部署工具迁移到 azd？  
**答**：  
1. 分析当前的部署架构  
2. 创建等效的 Bicep 模板  
3. 配置 `azure.yaml` 以匹配当前服务  
4. 在开发环境中进行全面测试  
5. 逐步迁移环境  

---

## 还有问题？  

### **先搜索**  
- 查看[官方文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- 在[GitHub 问题](https://github.com/Azure/azure-dev/issues)中搜索类似问题  

### **寻求帮助**  
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - 社区支持  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - 技术问题  
- [Azure Discord](https://discord.gg/azure) - 实时社区聊天  

### **报告问题**  
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - 提交错误报告和功能请求  
- 包括相关日志、错误信息和复现步骤  

### **了解更多**  
- [Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure 架构中心](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*此常见问题解答会定期更新。最后更新日期：2025 年 9 月 9 日*  

---

**导航**  
- **上一课**：[术语表](glossary.md)  
- **下一课**：[学习指南](study-guide.md)  

---

**免责声明**：  
本文档使用AI翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于重要信息，建议使用专业人工翻译。我们不对因使用此翻译而产生的任何误解或误读承担责任。