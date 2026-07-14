# 第6章：预部署规划与验证

**📚 课程**: [AZD 入门](../../README.md) | **⏱️ 时长**: 1小时 | **⭐ 难度**: 中级

---

## 概述

本章涵盖在部署应用前的关键规划与验证步骤。学习通过合理的容量规划、SKU选择及预检，避免昂贵的错误。

> 已通过 `azd 1.27.1` 验证，时间截至2026年7月。

## 学习目标

完成本章后，您将能够：
- 在部署前执行预检
- 规划容量并估算资源需求
- 选择合适的SKU以优化成本
- 配置 Application Insights 进行监控
- 了解团队协调模式

---

## 📚 课程列表

| # | 课程 | 描述 | 时间 |
|---|--------|-------------|------|
| 1 | [预检](preflight-checks.md) | 部署前验证配置 | 15 分钟 |
| 2 | [容量规划](capacity-planning.md) | 估算资源需求 | 20 分钟 |
| 3 | [SKU选择](sku-selection.md) | 选择合适的定价层 | 15 分钟 |
| 4 | [Application Insights](application-insights.md) | 配置监控 | 20 分钟 |
| 5 | [协调模式](coordination-patterns.md) | 团队部署工作流程 | 15 分钟 |

---

## 🚀 快速开始

```bash
# 检查订阅配额
az vm list-usage --location eastus --output table

# 预览部署（不创建资源）
azd provision --preview

# 验证Bicep语法
az bicep build --file infra/main.bicep

# 检查环境配置
azd env get-values
```

---

## ☑️ 预部署检查清单

### 在 `azd provision` 之前

- [ ] 验证区域配额
- [ ] 适当选择 SKU
- [ ] 评审成本估算
- [ ] 命名规范一致
- [ ] 配置安全性/RBAC

### 在 `azd deploy` 之前

- [ ] 设置环境变量
- [ ] 密钥库中存储密钥
- [ ] 验证连接字符串
- [ ] 配置健康检查

---

## 💰 SKU选择指南

| 工作负载 | 开发环境 | 生产环境 |
|----------|-------------|------------|
| 容器应用 | 按消费计费 | 专用 D4 |
| 应用服务 | B1/B2 | P1v3及以上 |
| Microsoft Foundry 模型 | 标准 | 标准 + PTU |
| AI 搜索 | 基础 | 标准 S2及以上 |

---

## 🔗 导航

| 方向 | 章节 |
|-----------|---------|
| <strong>上一章</strong> | [第5章：多代理](../chapter-05-multi-agent/README.md) |
| <strong>下一章</strong> | [第7章：故障排除](../chapter-07-troubleshooting/README.md) |

---

## 📖 相关资源

- [配置指南](../chapter-03-configuration/configuration.md)
- [部署指南](../chapter-04-infrastructure/deployment-guide.md)
- [常见问题](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->