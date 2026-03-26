# 第6章：部署前规划与验证

**📚 课程**: [AZD 初学者指南](../../README.md) | **⏱️ 时长**: 1 小时 | **⭐ 难度**: 中级

---

## 概述

本章涵盖在部署应用程序之前的关键规划和验证步骤。通过适当的容量规划、SKU 选择和预检，学习如何避免代价高昂的错误。

## 学习目标

完成本章后，您将能够：
- 在部署前运行预检
- 进行容量规划并估算资源需求
- 选择合适的 SKU 以优化成本
- 配置 Application Insights 以进行监控
- 了解团队协调模式

---

## 📚 课程

| # | 课时 | 描述 | 时长 |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | 在部署前验证配置 | 15 分钟 |
| 2 | [Capacity Planning](capacity-planning.md) | 估算资源需求 | 20 分钟 |
| 3 | [SKU Selection](sku-selection.md) | 选择合适的定价层 | 15 分钟 |
| 4 | [Application Insights](application-insights.md) | 配置监控 | 20 分钟 |
| 5 | [Coordination Patterns](coordination-patterns.md) | 团队部署工作流 | 15 分钟 |

---

## 🚀 快速开始

```bash
# 检查订阅配额
az vm list-usage --location eastus --output table

# 预览部署（不创建资源）
azd provision --preview

# 验证 Bicep 语法
az bicep build --file infra/main.bicep

# 检查环境配置
azd env get-values
```

---

## ☑️ 部署前检查清单

### 在执行 `azd provision` 之前

- [ ] 已验证区域配额
- [ ] 已适当选择 SKU
- [ ] 已审核成本估算
- [ ] 命名规范一致
- [ ] 已配置安全性/RBAC

### 在执行 `azd deploy` 之前

- [ ] 已设置环境变量
- [ ] 机密已存于 Key Vault
- [ ] 已验证连接字符串
- [ ] 已配置健康检查

---

## 💰 SKU 选择指南

| 工作负载 | 开发 | 生产 |
|----------|-------------|------------|
| 容器应用 | Consumption | Dedicated D4 |
| 应用服务 | B1/B2 | P1v3+ |
| Microsoft Foundry 模型 | Standard | Standard + PTU |
| AI 搜索 | Basic | Standard S2+ |

---

## 🔗 导航

| Direction | Chapter |
|-----------|---------|
| **Previous** | [第5章：多代理](../chapter-05-multi-agent/README.md) |
| **Next** | [第7章：故障排除](../chapter-07-troubleshooting/README.md) |

---

## 📖 相关资源

- [配置指南](../chapter-03-configuration/configuration.md)
- [部署指南](../chapter-04-infrastructure/deployment-guide.md)
- [常见问题](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文档已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们力求准确，但请注意自动翻译可能存在错误或不准确之处。原始文档的母语版本应被视为权威来源。对于关键信息，建议使用专业人工翻译。对于因使用本翻译而引起的任何误解或曲解，我们不承担任何责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->