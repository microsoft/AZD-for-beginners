# 使用 Azure Developer CLI 的 AI 代理

**章节导航：**
- **📚 课程首页**: [AZD 入门](../../README.md)
- **📖 本章：** 第 2 章 - AI 优先开发
- **⬅️ 上一章**: [Microsoft Foundry 集成](microsoft-foundry-integration.md)
- **➡️ 下一章**: [AI 模型部署](ai-model-deployment.md)
- **🚀 进阶**: [多代理解决方案](../../examples/retail-scenario.md)

---

## 介绍

AI 代理是可以感知其环境、做出决策并采取行动以实现特定目标的自主程序。与仅响应提示的简单聊天机器人不同，代理可以：

- <strong>使用工具</strong> - 调用 API、搜索数据库、执行代码
- <strong>规划与推理</strong> - 将复杂任务分解为多个步骤
- <strong>从上下文学习</strong> - 保持记忆并调整行为
- <strong>协作</strong> - 与其他代理协同工作（多代理系统）

本指南展示如何使用 Azure Developer CLI (azd) 将 AI 代理部署到 Azure。

> **验证说明 (2026-03-25)：** 本指南已根据 `azd` `1.23.12` 和 `azure.ai.agents` `0.1.18-preview` 进行审核。`azd ai` 体验仍处于预览状态，如果您安装的扩展标志不同，请检查扩展帮助。

## 学习目标

完成本指南后，您将：
- 了解什么是 AI 代理以及它们与聊天机器人的区别
- 使用 AZD 部署预构建的 AI 代理模板
- 为自定义代理配置 Foundry 代理
- 实现基本代理模式（工具使用、RAG、多代理）
- 监控并调试已部署的代理

## 学习成果

完成后，您将能够：
- 使用一条命令将 AI 代理应用部署到 Azure
- 配置代理工具和能力
- 使用代理实现检索增强生成（RAG）
- 为复杂工作流设计多代理架构
- 排查常见的代理部署问题

---

## 🤖 代理与聊天机器人有何不同？

| 特性 | 聊天机器人 | AI 代理 |
|---------|---------|----------|
| <strong>行为</strong> | 响应提示 | 采取自主行动 |
| <strong>工具</strong> | 无 | 可调用 API、搜索、执行代码 |
| <strong>记忆</strong> | 仅基于会话 | 跨会话的持久记忆 |
| <strong>规划</strong> | 单次响应 | 多步推理 |
| <strong>协作</strong> | 单一实体 | 可与其他代理协作 |

### 简单类比

- <strong>聊天机器人</strong> = 在信息台回答问题的服务人员  
- **AI 代理** = 可以打电话、预约并为您完成任务的私人助理

---

## 🚀 快速开始：部署您的第一个代理

### 选项 1：Foundry Agents 模板（推荐）

```bash
# 初始化 AI 代理模板
azd init --template get-started-with-ai-agents

# 部署到 Azure
azd up
```

**部署内容：**
- ✅ Foundry 代理
- ✅ Microsoft Foundry 模型 (gpt-4.1)
- ✅ Azure AI Search（用于 RAG）
- ✅ Azure Container Apps（Web 界面）
- ✅ Application Insights（监控）

**时间：** ~15-20 分钟  
**费用：** 约 $100-150/月（开发）

### 选项 2：使用 Prompty 的 OpenAI 代理

```bash
# 初始化基于 Prompty 的代理模板
azd init --template agent-openai-python-prompty

# 部署到 Azure
azd up
```

**部署内容：**
- ✅ Azure Functions（无服务器代理执行）
- ✅ Microsoft Foundry 模型
- ✅ Prompty 配置文件
- ✅ 示例代理实现

**时间：** ~10-15 分钟  
**费用：** 约 $50-100/月（开发）

### 选项 3：RAG 聊天代理

```bash
# 初始化 RAG 聊天模板
azd init --template azure-search-openai-demo

# 部署到 Azure
azd up
```

**部署内容：**
- ✅ Microsoft Foundry 模型
- ✅ 带示例数据的 Azure AI Search
- ✅ 文档处理流水线
- ✅ 带引用的聊天界面

**时间：** ~15-25 分钟  
**费用：** 约 $80-150/月（开发）

### 选项 4：AZD AI Agent Init（基于清单或模板的预览）

如果您有代理清单文件，可以使用 `azd ai` 命令直接为 Foundry Agent Service 项目生成脚手架。最近的预览版本还增加了基于模板的初始化支持，因此确切的提示流程可能会根据您安装的扩展版本略有不同。

```bash
# 安装 AI 代理扩展
azd extension install azure.ai.agents

# 可选：验证已安装的预览版本
azd extension show azure.ai.agents

# 从代理清单初始化
azd ai agent init -m agent-manifest.yaml

# 部署到 Azure
azd up

# 测试已部署的代理（显示延迟和首字节时间）
azd ai agent invoke
```

**何时使用 `azd ai agent init` 与 `azd init --template`：**

| 方法 | 适用场景 | 工作原理 |
|----------|----------|------|
| `azd init --template` | 从可用的示例应用开始 | 克隆包含代码和基础设施的完整模板仓库 |
| `azd ai agent init -m` | 从您自己的代理清单构建 | 根据您的代理定义生成项目结构 |

> **提示：** 在学习时使用 `azd init --template`（上述选项 1-3）。在使用自己的清单构建生产代理时使用 `azd ai agent init`。

在运行 `azd up` 之后，相同的扩展会引导您完成代理生命周期的其余部分：使用 `azd ai agent invoke` 进行测试，使用 `azd ai agent eval generate` 和 `azd ai agent optimize` 来衡量和提升质量，以及使用 `azd ai agent delete` 进行清理。完整参考请参见 [AZD AI CLI 命令](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)。

---

## 🏗️ 代理架构模式

### 模式 1：带工具的单一代理

最简单的代理模式 —— 一个代理可以使用多个工具。

```mermaid
graph TD
    UI[用户界面] --> Agent[AI 代理<br/>gpt-4.1]
    Agent --> Search[搜索工具]
    Agent --> Database[数据库工具]
    Agent --> API[API 工具]
```

**适用场景：**
- 客户支持机器人
- 研究助理
- 数据分析代理

**AZD 模板：** `azure-search-openai-demo`

### 模式 2：RAG 代理（检索增强生成）

在生成响应之前检索相关文档的代理。

```mermaid
graph TD
    Query[用户查询] --> RAG[RAG 代理]
    RAG --> Vector[向量检索]
    RAG --> LLM[大型语言模型<br/>gpt-4.1]
    Vector -- 文档 --> LLM
    LLM --> Response[带引用的响应]
```

**适用场景：**
- 企业知识库
- 文档问答系统
- 合规与法律研究

**AZD 模板：** `azure-search-openai-demo`

### 模式 3：多代理系统

多个专门化代理协同处理复杂任务。

```mermaid
graph TD
    Orchestrator[编排代理] --> Research[研究代理<br/>gpt-4.1]
    Orchestrator --> Writer[写作代理<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[审阅代理<br/>gpt-4.1]
```

**适用场景：**
- 复杂内容生成
- 多步工作流
- 需要不同专长的任务

**了解更多：** [多代理协调模式](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ 配置代理工具

当代理能够使用工具时，它们会变得更强大。以下是配置常见工具的方法：

### 在 Foundry 代理中配置工具

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# 定义自定义工具
search_tool = FunctionTool(
    name="search_knowledge_base",
    description="Search the company knowledge base for relevant documents",
    parameters={
        "type": "object",
        "properties": {
            "query": {
                "type": "string",
                "description": "The search query"
            }
        },
        "required": ["query"]
    }
)

# 使用工具创建代理
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### 环境配置

```bash
# 为代理设置特定的环境变量
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# 使用更新的配置进行部署
azd deploy
```

---

## 📊 监控代理

### Application Insights 集成

所有 AZD 代理模板都包含用于监控的 Application Insights：

```bash
# 打开监控仪表板
azd monitor --overview

# 查看实时日志
azd monitor --logs

# 查看实时指标
azd monitor --live
```

### 关键指标

| 指标 | 描述 | 目标 |
|--------|-------------|--------|
| 响应延迟 | 生成响应的时间 | < 5 秒 |
| 令牌使用 | 每次请求的令牌数 | 监控以控制费用 |
| 工具调用成功率 | 工具执行成功的百分比 | > 95% |
| 错误率 | 失败的代理请求 | < 1% |
| 用户满意度 | 反馈评分 | > 4.0/5.0 |

### 代理的自定义日志记录

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# 使用 OpenTelemetry 配置 Azure Monitor
configure_azure_monitor(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
)

tracer = trace.get_tracer(__name__)

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    with tracer.start_as_current_span("agent_interaction") as span:
        span.set_attributes({
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        })
```

> **注意：** 安装所需包：`pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 成本考虑

### 按模式估算的月成本

| 模式 | 开发环境 | 生产环境 |
|---------|-----------------|------------|
| 单一代理 | $50-100 | $200-500 |
| RAG 代理 | $80-150 | $300-800 |
| 多代理（2-3 个代理） | $150-300 | $500-1,500 |
| 企业级多代理 | $300-500 | $1,500-5,000+ |

### 成本优化建议

1. **对简单任务使用 gpt-4.1-mini**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. <strong>为重复查询实现缓存</strong>
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. <strong>为每次运行设置令牌限制</strong>
   ```python
   # 在运行代理时设置 max_completion_tokens，而不是在创建时设置
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # 限制响应长度
   )
   ```

4. <strong>不使用时缩减到零</strong>
   ```bash
   # 容器应用会自动缩放到零
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 代理故障排除

### 常见问题及解决方案

<details>
<summary><strong>❌ 代理未响应工具调用</strong></summary>

```bash
# 检查工具是否已正确注册
azd show

# 验证 OpenAI 部署
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# 检查代理日志
azd monitor --logs
```

**常见原因：**
- 工具函数签名不匹配
- 缺少必要权限
- API 端点无法访问
</details>

<details>
<summary><strong>❌ 代理响应延迟高</strong></summary>

```bash
# 检查 Application Insights 以发现瓶颈
azd monitor --live

# 考虑使用更快的模型
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd deploy
```

**优化建议：**
- 使用流式响应
- 实现响应缓存
- 减小上下文窗口大小
</details>

<details>
<summary><strong>❌ 代理返回不正确或虚构的信息</strong></summary>

```python
# 使用更好的系统提示来改进
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# 添加用于提供依据的检索
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # 使回复以文档为依据
)
```
</details>

<details>
<summary><strong>❌ 超出令牌限制错误</strong></summary>

```python
# 实现上下文窗口管理
def truncate_context(messages, max_tokens=8000, model="gpt-4.1"):
    """Keep only recent messages within token limit."""
    import tiktoken
    encoding = tiktoken.encoding_for_model(model)
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(encoding.encode(msg.content))
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 练习

### 练习 1：部署基本代理（20 分钟）

**目标：** 使用 AZD 部署您的第一个 AI 代理

```bash
# 步骤1：初始化模板
azd init --template get-started-with-ai-agents

# 步骤2：登录到 Azure
azd auth login
# 如果您跨租户工作，请添加 --tenant-id <tenant-id>

# 步骤3：部署
azd up

# 步骤4：测试代理
# 部署后预期输出：
#   部署完成！
#   端点：https://<app-name>.<region>.azurecontainerapps.io
# 打开输出中显示的 URL 并尝试提问

# 步骤5：查看监控
azd monitor --overview

# 步骤6：清理
azd down --force --purge
```

**成功标准：**
- [ ] 代理能回答问题
- [ ] 能通过 `azd monitor` 访问监控仪表板
- [ ] 成功清理资源

### 练习 2：添加自定义工具（30 分钟）

**目标：** 使用自定义工具扩展代理

1. 部署代理模板：
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. 在代理代码中创建一个新的工具函数：
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # 调用天气服务的 API
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. 向代理注册该工具：
   ```python
   from azure.ai.projects.models import FunctionTool

   weather_tool = FunctionTool(
       name="get_weather",
       description="Get current weather for a location",
       parameters={
           "type": "object",
           "properties": {
               "location": {"type": "string", "description": "City name"}
           },
           "required": ["location"]
       }
   )

   agent = project_client.agents.create_agent(
       model="gpt-4.1",
       name="Weather Agent",
       tools=[weather_tool]
   )
   ```
4. 重新部署并测试：
   ```bash
   azd deploy
   # 问: "西雅图的天气怎么样？"
   # 预期: 代理调用 get_weather("Seattle") 并返回天气信息
   ```

**成功标准：**
- [ ] 代理能识别与天气相关的查询
- [ ] 工具被正确调用
- [ ] 响应包含天气信息

### 练习 3：构建 RAG 代理（45 分钟）

**目标：** 创建一个能够从您的文档中回答问题的代理

```bash
# 第1步：部署 RAG 模板
azd init --template azure-search-openai-demo
azd up

# 第2步：上传你的文档
# 将 PDF/TXT 文件放入 data/ 目录，然后运行：
python scripts/prepdocs.py

# 第3步：使用特定领域的问题进行测试
# 从 azd up 输出中打开 Web 应用的网址
# 就你上传的文档提问
# 回复应包含类似 [doc.pdf] 的引用
```

**成功标准：**
- [ ] 代理能从上传的文档中回答问题
- [ ] 响应包含引文
- [ ] 对于范围外的问题没有虚构信息

---

## 📚 后续步骤

现在您了解了 AI 代理，请探索这些进阶主题：

| 主题 | 描述 | 链接 |
|-------|-------------|------|
| <strong>多代理系统</strong> | 使用多个协作代理构建系统 | [零售多代理示例](../../examples/retail-scenario.md) |
| <strong>协调模式</strong> | 学习编排和通信模式 | [协调模式](../chapter-06-pre-deployment/coordination-patterns.md) |
| <strong>生产部署</strong> | 面向企业的代理部署 | [生产 AI 实践](../chapter-08-production/production-ai-practices.md) |
| <strong>代理评估</strong> | 测试和评估代理性能 | [AI 故障排除](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **AI 研讨会实验室** | 实践操作：使您的 AI 解决方案适配 AZD | [AI 研讨会实验室](ai-workshop-lab.md) |

---

## 📖 其他资源

### 官方文档
- [Microsoft Foundry Agent 服务](https://learn.microsoft.com/azure/ai-services/agents/)
- [Microsoft Foundry Agent Service 快速入门](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel Agent 框架](https://learn.microsoft.com/semantic-kernel/)

### 适用于代理的 AZD 模板
- [AI 代理入门](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### 社区资源
- [Awesome AZD - 代理模板](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### 编辑器的代理技能
- [**Microsoft Azure 代理技能**](https://skills.sh/microsoft/github-copilot-for-azure) - 在 GitHub Copilot、Cursor 或任何支持的代理中安装可重用的 AI 代理技能以用于 Azure 开发。包括用于 [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [部署](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy), 和 [诊断](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) 的技能：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

<strong>导航</strong>
- <strong>上一课</strong>: [Microsoft Foundry 集成](microsoft-foundry-integration.md)
- <strong>下一课</strong>: [AI 模型部署](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->