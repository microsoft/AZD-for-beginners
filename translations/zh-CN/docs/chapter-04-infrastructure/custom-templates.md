# 创建你自己的 azd 模板

**章节导航：**
- **📚 课程主页**: [AZD For Beginners](../../README.md)
- **📖 当前章节**: 第4章 - 基础设施即代码与部署
- **⬅️ 上一节**: [Deployment Guide](deployment-guide.md)
- **🚀 下一章**: [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md)

> 已在 2026 年 6 月使用 `azd 1.25.6` 进行验证。

## 介绍

到目前为止，你已经使用 `azd init --template <name>` “消费”了模板。但一旦你的团队对项目布局满意——例如包含 Cosmos DB 和合适监控的 Container App——你可能想把它变成一个可重用的模板。模板本质上是一个具有可预测结构、azd 能读取的 Git 仓库。本课将向你展示如何从头构建一个模板、测试它，以及（可选地）将其发布到社区画廊。

## 学习目标

完成本课后，你将能够：
- 了解什么样的文件夹算作“azd 模板”
- 知道所需的文件和文件夹布局
- 添加一个其他人可以重用的 `azure.yaml` 和 `infra/`
- 在共享前本地测试你的模板
- 将其发布并（可选）提交到 Awesome AZD

## 学习成果

完成本课后，你将能够：
- 搭建一个新的模板仓库骨架
- 参数化基础设施以便在任何订阅中工作
- 使用 `azd init` 和 `azd up` 验证模板
- 添加社区画廊所需的元数据

---

## 模板到底是什么？

azd 模板是一个包含至少以下内容的 **Git 仓库**：

| 文件 / 文件夹 | 作用 | 必需吗？ |
|---------------|---------|-----------|
| `azure.yaml` | 描述服务、主机和基础设施提供者 | ✅ 是 |
| `infra/` | 用于创建资源的 Bicep、Terraform 或 Pulumi | ✅ 是 |
| `src/` (或你的代码) | azd 部署的应用代码 | ✅ 是 |
| `README.md` | 如何使用该模板 | ✅ 强烈推荐 |
| `.azdo/` 或 `.github/` | CI/CD 管道定义 | 可选 |
| `.devcontainer/` | 可再现的开发环境 | 可选 |
| `azure.yaml` `metadata` | 画廊和遥测信息 | 可选（发布时必需） |

这并没有什么魔法：当你运行 `azd init --template you/your-repo` 时，azd 会克隆该仓库并读取 `azure.yaml`。

---

## 第 1 步：搭建仓库骨架

可以手工创建文件夹结构，或从最小模板开始并进行编辑：

```bash
mkdir my-azd-template && cd my-azd-template
git init

# 创建标准布局
mkdir -p src infra
```

一个典型的完成布局如下：

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

## 第 2 步：编写 `azure.yaml`

这是模板的核心。它告诉 azd 要部署什么以及如何部署：

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

> `metadata.template` 字段是画廊遥测用于统计使用情况的字段。使用 `name@version` 约定。

---

## 第 3 步：参数化基础设施

对一个“可重用”模板来说，最重要的规则：**永远不要硬编码名称、区域或订阅特定的值。** 使用参数和资源令牌模式，这样相同的模板才能在任何人的订阅中工作。

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

使模板更友好的两点：

1. **`azd-env-name` 标记** — azd 使用它来跟踪并按环境清理资源。
2. **`uniqueString(...)` 资源令牌** — 生成稳定的、全局唯一的后缀，避免名称冲突。

提供一个匹配的参数文件，用来读取 azd 从环境注入的值：

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

azd 会自动用当前环境中的 `${AZURE_ENV_NAME}` 和 `${AZURE_LOCATION}` 进行替换。

---

## 第 4 步：在本地测试你的模板

在共享之前，先证明模板能在干净状态下工作。

<strong>从本地文件夹测试</strong>（无需推送到 Git）：

```bash
# 在空目录中，使用本地模板路径进行初始化
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# 端到端地配置并部署
azd auth login
azd up
```

<strong>然后测试清理</strong>——一个好的模板应该能完全清理资源：

```bash
azd down --force --purge
```

如果 `azd down` 留下了资源，说明你可能遗漏了在某个资源上添加 `azd-env-name` 标记。

> **提示：** 先运行 `azd provision --preview`。它会执行一次 what-if 操作并在创建任何资源之前暴露模板错误。

---

## 第 5 步：发布模板

将仓库推送到 GitHub（如果希望其他人使用，请公开）：

```bash
gh repo create my-azd-template --public --source=. --push
```

任何人现在都可以使用它：

```bash
azd init --template your-github-username/my-azd-template
```

---

## 第 6 步（可选）：提交到 Awesome AZD

[Awesome AZD 画廊](https://azure.github.io/awesome-azd/) 列出了社区模板。要被列出，你的仓库应包含：

- ✅ 一份清晰的 `README.md`，包含前提条件、架构图和费用说明
- ✅ 一个可工作的 `azure.yaml`，带有 `metadata.template`
- ✅ 能在新订阅中干净创建资源的基础设施
- ✅ 一个 `LICENSE` 文件
- ✅（推荐）一个用于一键 Codespaces 的 `.devcontainer/`

通过提交一个将你的模板添加到画廊数据文件的拉取请求来提交，遵循 [Awesome AZD 仓库](https://github.com/Azure/awesome-azd) 中的贡献指南。

---

## 常见陷阱

| 陷阱 | 解决办法 |
|---------|-----|
| 硬编码的资源名称 | 使用 `uniqueString()` 资源令牌 |
| `azd down` 留下资源 | 在每个资源（或资源组）上标记 `azd-env-name` |
| 模板在你那里可用，但在别人那里失败 | 删除订阅 ID、租户 ID 和区域假设 |
| 输出未连入应用 | 导出 `SERVICE_<NAME>_ENDPOINT_URL` 和其他 `AZURE_*` 输出 |
| 画廊提交被拒绝 | 添加 `README.md`、`LICENSE` 和 `metadata.template` |

---

## 总结

- 模板只是一个包含 `azure.yaml`、`infra/` 和你代码的 Git 仓库。
- 对所有内容进行参数化——名称、区域和 ID——以便在任何地方运行。
- 始终用 `azd-env-name` 标记资源，以便 `azd down` 生效。
- 在发布前使用 `azd init --template <local-path>` 在本地测试。
- 添加元数据和 README 以提交到 Awesome AZD。

---

## 🔗 导航

| 方向 | 资源 |
|-----------|----------|
| <strong>上一节</strong> | [Deployment Guide](deployment-guide.md) |
| <strong>章节主页</strong> | [Chapter 4: Infrastructure as Code](README.md) |
| <strong>下一章</strong> | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

## 📖 相关资源

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Official azd template documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->