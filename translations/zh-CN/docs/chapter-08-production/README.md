# 第8章：生产与企业模式

**📚 课程**：[AZD 初学者](../../README.md) | **⏱️ 时长**：2-3小时 | **⭐ 复杂度**：高级

---

## 概览

本章涵盖企业级部署模式、安全强化、监控及生产AI工作负载的成本优化。

> 已于2026年7月使用 `azd 1.27.1` 版本验证。

## 学习目标

完成本章后，您将能够：
- 部署多区域弹性应用
- 实施企业安全模式
- 配置全面监控
- 大规模优化成本
- 使用 AZD 搭建 CI/CD 流水线

---

## 📚 课程内容

| # | 课程 | 描述 | 时间 |
|---|--------|-------------|------|
| 1 | [生产 AI 实践](production-ai-practices.md) | 企业部署模式 | 90 分 |

---

## 🚀 生产检查清单

- [ ] 多区域部署提升弹性
- [ ] 使用托管身份进行认证（无密钥）
- [ ] 使用 Application Insights 监控
- [ ] 配置成本预算和报警
- [ ] 启用安全扫描
- [ ] 集成 CI/CD 流水线
- [ ] 制定灾难恢复方案

---

## 🏗️ 架构模式

### 模式1：微服务 AI

```mermaid
graph LR
    Gateway[API 网关] --> AI[AI 服务] --> Models[Microsoft Foundry 模型]
    Gateway --> Auth[认证服务]
    AI --> Data[数据存储]
```

### 模式2：事件驱动 AI

```mermaid
graph LR
    EventGrid[事件网格] --> Functions[函数] --> Pipeline[人工智能管道]
```

---

## 🔐 安全最佳实践

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 成本优化

| 策略 | 节省 |
|----------|---------|
| 零规模扩展（容器应用） | 60-80% |
| 开发使用消费层 | 50-70% |
| 定时扩展 | 30-50% |
| 预留容量 | 20-40% |

```bash
# 设置预算提醒
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 监控配置

```bash
# 流式传输日志
azd monitor --logs

# 检查应用洞察
azd monitor --overview

# 查看指标
az monitor metrics list --resource <resource-id>
```

---

## 🔗 导航

| 方向 | 章节 |
|-----------|---------|
| <strong>上一章</strong> | [第7章：故障排除](../chapter-07-troubleshooting/README.md) |
| <strong>课程完成</strong> | [课程首页](../../README.md) |

---

## 📖 相关资源

- [AI 代理指南](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [多代理解决方案](../chapter-05-multi-agent/README.md)
- [微服务示例](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->