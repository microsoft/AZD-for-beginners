# 第6章：预部署规划与验证

**📚 课程**：[初学者的AZD](../../README.md) | **⏱️ 时长**：2-4小时阅读；适应实验的额外时间 | **⭐ 难度**：中级–高级

---

## 概述

本章涵盖在部署应用程序前的关键规划和验证步骤。通过适当的容量规划、SKU选择和预检，学会避免代价高昂的错误。

> 命令指导基于已发布的`azd 1.37.2`参考审查。未执行云部署。较长的课程包括说明性片段，而非完整的本地部署项目。

## 学习目标

完成本章后，您将会：
- 在部署前运行预检
- 规划容量并估算资源需求
- 选择合适的SKU以优化成本
- 配置Application Insights进行监控
- 理解多代理协调模式及其部署需求

---

## 📚 课程

| # | 课程 | 描述 | 时间 |
|---|--------|-------------|------|
| 1 | [预检](preflight-checks.md) | 部署前验证配置 | 15分钟 |
| 2 | [容量规划](capacity-planning.md) | 估算资源需求 | 20分钟 |
| 3 | [SKU选择](sku-selection.md) | 选择合适的定价层级 | 15分钟 |
| 4 | [Application Insights](application-insights.md) | 配置监控 | 20分钟 |
| 5 | [协调模式](coordination-patterns.md) | 高级多代理编排设计 | 60-75分钟 |

---

## 🚀 快速开始

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview infrastructure changes (inspect template hooks before running)
azd provision --preview

# Validate Bicep syntax
az bicep build --file infra/main.bicep

# Check environment configuration
azd env get-values
```

---

## ☑️ 部署前检查清单

### 在`azd provision`之前

- [ ] 核实区域配额
- [ ] 适当选择SKU
- [ ] 审核成本估算
- [ ] 命名规范一致
- [ ] 配置安全性/RBAC

### 在`azd deploy`之前

- [ ] 设置环境变量
- [ ] 秘密存入Key Vault
- [ ] 验证连接字符串
- [ ] 配置健康检查

---

## 💰 SKU选择指南

| 工作负载 | 开发环境 | 生产环境 |
|----------|-------------|------------|
| 容器应用 | 按需 | 按需或专用工作负载配置，基于测量负载 |
| 应用服务 | B1/B2 | P1v3及以上 |
| Azure OpenAI模型 | 支持按需付费部署类型 | 按需付费或预置吞吐量；依模型和区域而定 |
| AI搜索 | 限额内免费/基础版 | 基础或标准级，根据索引、副本和查询负载大小调整 |

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