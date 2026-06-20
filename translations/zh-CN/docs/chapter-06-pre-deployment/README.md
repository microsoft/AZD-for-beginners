# 第6章：部署前规划与验证

**📚 课程**: [AZD For Beginners](../../README.md) | **⏱️ 时长**: 1 小时 | **⭐ 复杂度**: 中级

---

## 概述

本章涵盖在部署应用程序之前的关键规划和验证步骤。通过适当的容量规划、SKU 选择和预检，学习如何避免代价高昂的错误。

> 已在 2026 年 6 月使用 `azd 1.25.6` 进行验证。

## 学习目标

完成本章后，您将能够：
- 在部署前运行预检
- 进行容量规划并估算资源需求
- 选择适当的 SKU 以优化成本
- 配置 Application Insights 以进行监控
- 了解团队协调模式

---

## 📚 课程

| # | 课程 | 描述 | 时间 |
|---|--------|-------------|------|
| 1 | [预部署检查](preflight-checks.md) | 在部署前验证配置 | 15 分钟 |
| 2 | [容量规划](capacity-planning.md) | 估算资源需求 | 20 分钟 |
| 3 | [SKU 选择](sku-selection.md) | 选择合适的定价层 | 15 分钟 |
| 4 | [Application Insights](application-insights.md) | 配置监控 | 20 分钟 |
| 5 | [协调模式](coordination-patterns.md) | 团队部署工作流 | 15 分钟 |

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

## ☑️ 部署前清单

### 在 `azd provision` 之前

- [ ] 已验证区域配额
- [ ] 已适当选择 SKU
- [ ] 已审查成本估算
- [ ] 命名约定一致
- [ ] 已配置安全/角色访问控制（RBAC）

### 在 `azd deploy` 之前

- [ ] 已设置环境变量
- [ ] 密钥已存放在 Key Vault 中
- [ ] 已验证连接字符串
- [ ] 已配置健康检查

---

## 💰 SKU 选择指南

| 工作负载 | 开发 | 生产 |
|----------|-------------|------------|
| Container Apps | Consumption | 专用 D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

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