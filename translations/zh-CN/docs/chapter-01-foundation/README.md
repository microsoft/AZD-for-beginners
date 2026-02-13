# 第1章：基础与快速上手

**📚 课程**: [AZD 入门](../../README.md) | **⏱️ 时长**: 30-45 分钟 | **⭐ 难度**: 初学者

---

## 概述

本章介绍 Azure Developer CLI (azd) 的基础知识。您将了解核心概念、安装工具，并将您的第一个应用部署到 Azure。

## 学习目标

完成本章后，您将能够：
- 理解什么是 Azure Developer CLI 以及它与 Azure CLI 的区别
- 在您的平台上安装并配置 AZD
- 使用 `azd up` 将第一个应用部署到 Azure
- 使用 `azd down` 清理资源

---

## 📚 课程

| # | 课程 | 描述 | 时间 |
|---|--------|-------------|------|
| 1 | [AZD 基础](azd-basics.md) | 核心概念、术语和项目结构 | 15 分钟 |
| 2 | [安装与设置](installation.md) | 针对不同平台的安装指南 | 10 分钟 |
| 3 | [你的第一个项目](first-project.md) | 实战：将 Web 应用部署到 Azure | 20 分钟 |

---

## 🚀 快速开始

```bash
# 检查安装
azd version

# 登录 Azure
azd auth login

# 部署你的第一个应用
azd init --template todo-nodejs-mongo
azd up

# 完成后清理
azd down --force --purge
```

---

## ✅ 成功标准

完成本章后，您应该能够：

```bash
azd version              # 显示已安装的版本
azd init --template todo-nodejs-mongo  # 初始化项目
azd up                   # 部署到 Azure
azd show                 # 显示正在运行的应用的 URL
azd down --force --purge # 清理资源
```

---

## 🔗 导航

| 方向 | 章节 |
|-----------|---------|
| **下一章** | [第2章：以 AI 为先的开发](../chapter-02-ai-development/README.md) |
| **跳转到** | [第3章：配置](../chapter-03-configuration/README.md) |

---

## 📖 相关资源

- [命令速查表](../../resources/cheat-sheet.md)
- [常见问题](../../resources/faq.md)
- [术语表](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：

本文件已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。虽然我们力求准确，但请注意自动翻译可能包含错误或不准确之处。原始语言的原文应被视为权威来源。对于关键信息，建议使用专业人工翻译。对于因使用本翻译而产生的任何误解或误释，我们不承担任何责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->