# 第1章：基础与快速开始

**📚 课程**：[初学者的AZD](../../README.md) | **⏱️ 时长**：75-120分钟，包括首次部署；额外练习需更长时间 | **⭐ 复杂度**：初级

---

## 概述

本章介绍Azure开发者CLI（azd）基础知识。你将学习核心概念、安装工具，并部署你的第一个Azure应用程序。

> 命令和配置审查目标：`azd 1.37.2` (2026年11月)。审查期间未运行实时 Azure 配置。

## 学习目标

通过完成本章节，您将能够：
- 了解什么是 Azure Developer CLI 以及它与 Azure CLI 的区别
- 在您的平台上安装和配置 AZD
- 使用 `azd up` 部署您的第一个 Azure 应用
- 使用 `azd down` 清理资源

---

## 📚 课程

| # | 课程 | 描述 | 时间 |
|---|--------|-------------|------|
| 1 | [AZD 基础](azd-basics.md) | 核心概念、术语和项目结构 | 15 分钟 |
| 2 | [安装与设置](installation.md) | 针对不同平台的安装指南 | 10 分钟 |
| 3 | [您的第一个项目](first-project.md) | 实操：将 Web 应用部署到 Azure | 20 分钟 |
| 4 | [添加您自己的应用](bring-your-own-app.md) | 将 azd 添加到您已有的项目中 | 15 分钟 |
| 5 | [开发容器与代码空间](dev-containers.md) | 使用开发容器实现可复现的 azd 环境 | 15 分钟 |

---

## ✅ 从这里开始：验证您的环境

在开始之前，请确认您的本地机器已为第1章模板做好准备：

**Windows：**
```powershell
.\validate-setup.ps1
```

**macOS / Linux：**
```bash
bash ./validate-setup.sh
```

如果脚本报告缺少工具，请先修复这些问题，然后继续本章内容。

---

## 🚀 快速开始

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ 成功标准

完成本章后，您应该能够：

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 导航

| 方向 | 章节 |
|-----------|---------|
| <strong>下一章</strong> | [第2章：AI优先开发](../chapter-02-ai-development/README.md) |
| <strong>跳转到</strong> | [第3章：配置](../chapter-03-configuration/README.md) |

---

## 📖 相关资源

- [命令速查表](../../resources/cheat-sheet.md)
- [常见问题解答](../../resources/faq.md)
- [术语表](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->