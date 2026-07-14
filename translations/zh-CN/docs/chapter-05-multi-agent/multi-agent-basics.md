# 多代理基础 - 部署您的第一个协作AI系统

**章节导航：**
- **📚 课程主页**: [AZD 入门](../../README.md)
- **📖 当前章节**: 第5章 - 多代理AI解决方案
- **⬅️ 上一章**: [第4章：基础设施](../chapter-04-infrastructure/README.md)
- **➡️ 下一章**: [协调模式](../chapter-06-pre-deployment/coordination-patterns.md)

> 已针对 `azd 1.27.1` 于2026年7月验证。

## 介绍

在之前的章节中，您部署了单个应用程序——第2章中部署了单个AI代理。本课程迈出下一步：部署一个<strong>多代理系统</strong>，多个专门的代理协同工作，解决单个代理无法很好处理的问题。

初学者的好消息是：**您无需新增命令。** 多代理解决方案仍然是一个azd项目。您将进行 `azd init`、`azd up`、测试及 `azd down`——完全是您已经熟悉的工作流程。变化的是应用程序内部的<em>结构</em>。

## 学习目标

完成本课时，您将能够：
- 了解“多代理”是什么意思以及何时值得增加复杂度
- 识别多代理系统中的常见角色（协调者 + 专家）
- 使用 `azd up` 部署一个真实的、工作的多代理模板
- 理解支持多代理应用的Azure资源
- 掌握如何安全验证、定制及拆除解决方案

## 学习成果

学完本课时，您将能够：
- 解释单代理与多代理系统的区别
- 在单代理带工具和真正多代理设计之间做出选择
- 完整部署并测试多代理模板，使用azd端到端
- 识别每个代理运行位置及它们如何通信
- 清理所有资源以避免持续计费

---

## 什么是多代理系统？

单个AI代理是一个模型加上一组指令和（可选的）一些工具。这对专注任务很有效。但当任务变大——调研，然后写作，然后编辑，然后事实核查——把所有内容塞进一个提示，会使代理变慢、不够可靠且难以调试。

一个<strong>多代理系统</strong>把工作拆分给专门做单一工作的专家，由一个协调者协调：

```mermaid
graph TD
    User([用户请求]) --> Orchestrator[协调者代理<br/>计划并分配工作]
    Orchestrator --> Researcher[研究者代理<br/>收集事实]
    Orchestrator --> Writer[撰稿人代理<br/>草拟内容]
    Orchestrator --> Editor[编辑者代理<br/>审查并润色]
    Researcher --> Orchestrator
    Writer --> Orchestrator
    Editor --> Orchestrator
    Orchestrator --> Result([最终答案])
```

### 你总会看到的两个角色

| 角色 | 工作 | 例子 |
|------|-----|---------|
| <strong>协调者</strong> | 决定<em>下一步做什么</em>，并在代理间调度工作 | “先调研，再写作，然后编辑” |
| <strong>专家</strong> | 只专注做一件事并返回结果 | 只收集事实的“调研者” |

### 你真的需要多个代理吗？

从简单开始。只有当以下情况之一成立时，才考虑使用多代理：

- ✅ 任务有<strong>不同阶段</strong>，每阶段适合不同指令（调研 vs 写作 vs 审阅）
- ✅ 你想让专家<strong>并行运行</strong>以节省时间
- ✅ 不同步骤需要<strong>不同的工具或数据源</strong>
- ✅ 需要每一步<strong>独立测试和调试</strong>

如果任务只是单个问答或简单工具调用，<strong>带工具的单代理</strong>（第2章）更简单、更便宜、更易运营。

> **初学者提示：** “更多代理”并不意味着“更好”。每个代理增加延迟、成本和需要监控的项目。只有当问题明确可拆分时才添加代理。

---

## 在Azure上构建多代理的两种方式

| 方法 | 含义 | 适用场景 |
|----------|-----------|----------|
| **单代理+工具** | 一个Foundry代理调用函数/工具 | 简单工作流，入门 |
| <strong>多个协调代理</strong> | 多个代理加协调者 | 不同阶段、并行工作、专业分工 |

本课时聚焦于第二种方式，使用一个<strong>现成模板</strong>，让您先看到一个真实的多代理系统再自己构建。

---

## 实战：部署一个工作的多代理应用

我们将部署 **Contoso 创意写手**，微软官方Azure示例，使用多个代理（调研者、写手、编辑）协作产出文章。它是一个很好的首个多代理应用，因为角色易于理解。

### 步骤1：初始化模板

```bash
# 创建一个工作文件夹
mkdir creative-writer && cd creative-writer

# 从官方多智能体模板初始化
azd init --template contoso-creative-writer
```

> 您可随时浏览更多多代理模板，访问 [Awesome AZD AI 画廊](https://azure.github.io/awesome-azd/?tags=ai)。其他初学者友好选项包括 `get-started-with-ai-agents` 和 `azure-ai-travel-agents`。

### 步骤2：认证

```bash
# azd 工作流所需
azd auth login
```

### 步骤3：创建环境

```bash
azd env new dev
```

### 步骤4：预览然后部署

```bash
# 在花费任何费用之前先查看将创建什么（推荐）
azd provision --preview

# 在一步中配置基础设施并部署所有代理
azd up
```

`azd up` 会提示订阅和区域，随后预配Azure资源并部署应用。AI部署比简单网页应用可能更耗时——如果你部署的是大型模型，可以延长部署超时：

```bash
azd deploy --timeout 1800
```

> **关于成本和容量提醒：** 多代理应用部署AI模型，会消耗额度并产生费用。如果 `azd up` 因模型额度失败，请查看 [AI故障排除](../chapter-07-troubleshooting/ai-troubleshooting.md) 获取区域和额度修复方案，以及第6章 [容量规划](../chapter-06-pre-deployment/capacity-planning.md)。

---

## 理解你部署的内容

一个典型的多代理应用会预配一组Azure资源，直接对应上述图示中的职责分工：

| 资源 | 用途 |
|----------|----------------|
| **Microsoft Foundry / 模型** | 托管各代理使用的语言模型 |
| **Azure AI 搜索** | 为调研代理提供可检索的已验证数据 |
| <strong>容器应用</strong>（或应用服务） | 托管协调者和代理代码 |
| **Cosmos DB**（某些示例） | 存储代理间传递的共享状态/记忆 |
| <strong>应用洞察</strong> | 跨代理追踪请求，方便调试流程 |

### 代理间如何沟通

在多数azd多代理示例中，<strong>协调者运行于您的应用代码中</strong>（例如，使用Semantic Kernel或Microsoft Agent Framework）。协调者依次调用各专家代理，传递结果，汇总最终答案。代理共享上下文通过：

- **函数/工具调用** — 协调者调用专家代理并获得返回结果
- <strong>共享内存</strong> — 通过数据库（通常是Cosmos DB）保存双方可读的状态
- **消息/事件** — 为松耦合，代理通过队列或服务总线通信

> **调试重要性：** 因步骤独立，应用洞察显示<em>哪个</em>代理慢或失败。这是首次拆分代理工作的主要理由。

---

## 验证部署

在继续之前确认系统正常工作：

```bash
# 显示已部署的端点
azd show

# 打开应用的监控仪表盘
azd monitor

# 如果有异常，跟踪日志
azd monitor --logs
```

然后打开 `azd show` 中的应用URL，尝试一个调用所有代理的请求（例如，要求Creative Writer写一篇简短文章）。在应用洞察<strong>事务搜索</strong>中，你应看到请求沿调研者、写手和编辑步骤展开。

**成功标准：**
- ✅ `azd show` 列出可访问端点
- ✅ 请求产出结果明确经历多个阶段
- ✅ 应用洞察显示多代理步骤的追踪

---

## 自定义：新增或调整代理

因为每个代理只是指令加工具，自定义变得容易：

1. <strong>找到模板中的代理定义</strong>（通常是 `prompts/`、`agents/` 或 `*.prompty` 文件集）。
2. <strong>调整代理指令</strong>——例如，告诉编辑代理执行特定语气或字数要求。
3. <strong>仅重新部署代码</strong>（基础设施不变）：

   ```bash
   azd deploy
   ```

若要深入并从<em>自定义</em>清单构建代理，使用代理扩展及其完整生命周期：

```bash
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
azd ai agent invoke      # 测试，带响应时间
```

详情参见第2章：[代理](../chapter-02-ai-development/agents.md) 和 [AZD AI CLI参考](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)，完整代理生命周期命令（`invoke`，`eval generate`，`optimize`，`delete`）。

---

## 清理

多代理应用运行多个计费服务。完成后请全部拆除：

```bash
azd down --force --purge
```

`--purge` 标志也会移除软删除的AI资源（如Foundry/Azure AI服务账号），避免阻碍后续部署或继续产生费用。

---

## 关于生产多代理系统的说明

本仓库中的[零售多代理解决方案](../../examples/retail-scenario.md)是一个<strong>架构蓝图</strong>，而非“一键模板”——它记录了生产零售系统<em>如何</em>构建（明确指出完整构建工作量巨大）。请先部署此处的工作示例后，作为设计参考。有关生产事项（弹性、成本、监控、治理），请继续第8章：[生产AI实践](../chapter-08-production/production-ai-practices.md)。

---

## 总结

- 多代理系统由协调者协调、将工作划分给专家。
- 仅当任务有明显阶段、并行需求或步骤需不同工具时使用多代理——否则优选单代理。
- azd工作流程不变：`azd init` → `azd up` → 测试 → `azd down`。
- 像 `contoso-creative-writer` 这样的真实模板让您今天就能查看并自定义工作多代理应用。
- 跨代理的应用洞察跟踪是多代理设计的重要实际收益。

---

## 🔗 导航

| 方向 | 课程 |
|-----------|--------|
| <strong>上一章</strong> | [第4章：基础设施](../chapter-04-infrastructure/README.md) |
| <strong>下一章</strong> | [协调模式](../chapter-06-pre-deployment/coordination-patterns.md) |

## 📖 相关资源

- [AI代理指南](../chapter-02-ai-development/agents.md)
- [协调模式](../chapter-06-pre-deployment/coordination-patterns.md)
- [生产AI实践](../chapter-08-production/production-ai-practices.md)
- [AI故障排除](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->