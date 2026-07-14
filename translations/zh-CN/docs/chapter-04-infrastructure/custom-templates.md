# 编写您自己的 azd 模板

**章节导航：**
- **📚 课程首页**：[AZD 入门](../../README.md)
- **📖 当前章节**：第4章 - 基础设施即代码与部署
- **⬅️ 上一章**：[部署指南](deployment-guide.md)
- **🚀 下一章**：[第5章：多代理解决方案](../chapter-05-multi-agent/README.md)

> 已通过 `azd 1.27.1` 于2026年7月验证。

## 介绍

到目前为止，您已经使用 `azd init --template <name>` <em>使用</em> 模板。但一旦您的团队喜欢某个项目布局——比如带有 Cosmos DB 和合适监控的容器应用——您就会想把它变成自己的可重用模板。模板只是一个 azd 知道如何读取的具有可预测结构的 Git 仓库。本课将指导您如何从零构建、测试模板，并（可选）发布到社区库。

## 学习目标

课后，您将能够：
- 理解使文件夹成为“azd 模板”的条件
- 了解所需文件和文件夹布局
- 添加其他人可复用的 `azure.yaml` 和 `infra/`
- 在共享前本地测试模板
- 发布模板并（可选）提交至 Awesome AZD

## 学习成果

完成本课后，您将能够：
- 脚手架新模板仓库
- 使基础设施参数化以适配任何订阅
- 使用 `azd init` 和 `azd up` 验证模板
- 添加社区库所需的元数据

---

## 模板到底是什么？

azd 模板是一个 **Git 仓库**，至少包含：

| 文件/文件夹 | 用途 | 是否必需 |
|---------------|---------|-----------|
| `azure.yaml` | 描述服务、主机和基础设施提供者 | ✅ 必需 |
| `infra/` | 用于资源配置的 Bicep、Terraform 或 Pulumi | ✅ 必需 |
| `src/`（或您的代码） | azd 部署的应用代码 | ✅ 必需 |
| `README.md` | 模板使用说明 | ✅ 强烈推荐 |
| `.azdo/` 或 `.github/` | CI/CD 流水线定义 | 可选 |
| `.devcontainer/` | 可复现的开发环境 | 可选 |
| `azure.yaml` 中的 `metadata` | 库 + 统计信息 | 可选（发布时必需） |

这里没有任何魔法：运行 `azd init --template you/your-repo` 时，azd 会克隆仓库并读取 `azure.yaml`。

---

## 第1步：脚手架仓库结构

手动创建文件夹结构，或者从最小模板开始并编辑：

```bash
mkdir my-azd-template && cd my-azd-template
git init

# 创建标准布局
mkdir -p src infra
```

完成后的典型布局如下：

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## 第2步：编写 `azure.yaml`

这是模板的核心。它告诉 azd 部署什么以及如何部署：

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> `metadata.template` 字段是库统计使用情况的依据。使用 `name@version` 约定。

---

## 第3步：基础设施参数化

对于 <em>可重用</em> 模板，最重要的规则是：**绝不硬编码名称、区域或订阅特定的值。** 使用参数和资源标记模式，确保模板在任何人的订阅中都能运行。

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

使模板友好的两点：

1. **`azd-env-name` 标签**——azd 用它来跟踪并清理每个环境的资源。
2. **`uniqueString(...)` 资源标记**——生成稳定的全球唯一后缀，避免名称冲突。

提供对应的参数文件，读取 azd 从环境注入的值：

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd 会自动用当前环境的 `${AZURE_ENV_NAME}` 和 `${AZURE_LOCATION}` 进行替换。

---

## 第4步：本地测试模板

在共享前，确保模板从干净状态下正常工作。

<strong>从本地文件夹测试</strong>（无需推送到 Git）：

```bash
# 从一个空目录，使用本地模板路径初始化
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# 从头到尾进行配置和部署
azd auth login
azd up
```

<strong>然后测试销毁</strong>——好的模板会完全清除资源：

```bash
azd down --force --purge
```

如果 `azd down` 留下资源，可能是某资源缺少 `azd-env-name` 标签。

> **提示：** 先运行 `azd provision --preview`。它执行假设操作，提前显示模板错误，避免创建资源后再出错。

---

## 第5步：发布模板

将仓库推送到 GitHub（如果希望别人使用，请设为公开）：

```bash
gh repo create my-azd-template --public --source=. --push
```

现在任何人都可以使用它：

```bash
azd init --template your-github-username/my-azd-template
```

---

## 第6步（可选）：提交到 Awesome AZD

[Awesome AZD 库](https://azure.github.io/awesome-azd/) 列出了社区模板。若想上榜，仓库应包括：

- ✅ 清晰的 `README.md` ，包含前提条件、架构图和成本说明
- ✅ 有效的 `azure.yaml` ，含 `metadata.template`
- ✅ 能在新订阅中干净部署的基础设施
- ✅ `LICENSE` 文件
- ✅ （推荐）一键启动 Codespaces 的 `.devcontainer/`

按贡献指南在 [Awesome AZD 仓库](https://github.com/Azure/awesome-azd) 提交拉取请求，添加您的模板到库的数据文件。

---

## 常见陷阱

| 陷阱 | 解决办法 |
|---------|-----|
| 资源名称硬编码 | 使用 `uniqueString()` 资源标记 |
| `azd down` 不删除全部资源 | 在每个资源（或资源组）上标记 `azd-env-name` |
| 模板你能用，别人不能 | 移除订阅 ID、租户 ID 和区域假设 |
| 输出未接入应用 | 导出 `SERVICE_<NAME>_ENDPOINT_URL` 和其他 `AZURE_*` 输出 |
| 库提交被拒绝 | 添加 `README.md`、`LICENSE` 和 `metadata.template` |

---

## 总结

- 模板就是包含 `azure.yaml`、`infra/` 和代码的 Git 仓库。
- 所有内容都参数化——名称、区域和 ID——确保能在任意环境运行。
- 资源总是标记 `azd-env-name`，确保 `azd down` 能正常清理。
- 发布前用 `azd init --template <local-path>` 本地测试。
- 添加元数据和 README 提交到 Awesome AZD。

---

## 🔗 导航

| 方向 | 资源 |
|-----------|----------|
| <strong>上一章</strong> | [部署指南](deployment-guide.md) |
| <strong>本章首页</strong> | [第4章：基础设施即代码](README.md) |
| <strong>下一章</strong> | [第5章：多代理解决方案](../chapter-05-multi-agent/README.md) |

## 📖 相关资源

- [资源配置](provisioning.md)
- [Awesome AZD 库](https://azure.github.io/awesome-azd/)
- [官方 azd 模板文档](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->