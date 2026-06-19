# 第1章：基础与快速入门

**📚 课程**: [AZD 入门](../../README.md) | **⏱️ 时长**: 30-45 分钟 | **⭐ 难度**: 入门

---

## 概述

本章介绍 Azure Developer CLI (azd) 的基础知识。你将学习核心概念、安装工具，并将你的第一个应用部署到 Azure。

> 已针对 `azd 1.25.6` 于 2026 年 6 月进行验证。

## 学习目标

完成本章后，你将能够：
- 了解什么是 Azure Developer CLI，以及它与 Azure CLI 的不同点
- 在你的平台上安装并配置 AZD
- 使用 `azd up` 将你的第一个应用部署到 Azure
- 使用 `azd down` 清理资源

---

## 📚 课程

| # | 课程 | 描述 | 时长 |
|---|--------|-------------|------|
| 1 | [AZD 基础](azd-basics.md) | 核心概念、术语和项目结构 | 15 分钟 |
| 2 | [安装与设置](installation.md) | 针对不同平台的安装指南 | 10 分钟 |
| 3 | [你的第一个项目](first-project.md) | 动手实践：将 Web 应用部署到 Azure | 20 分钟 |
| 4 | [带入你已有的应用](bring-your-own-app.md) | 向你已有的项目添加 azd | 15 分钟 |
| 5 | [开发容器与 Codespaces](dev-containers.md) | 使用开发容器创建可重复的 azd 环境 | 15 分钟 |

---

## ✅ 从这里开始：验证你的设置

在开始之前，确认你的本地机器已为第1章模板准备就绪：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

If the script reports missing tools, fix those first and then continue with the chapter.

---

## 🚀 快速开始

```bash
# 检查安装
azd version

# 为 AZD 进行身份验证
# 可选：如果您打算直接运行 Azure CLI 命令，请运行 az login
azd auth login

# 部署您的第一个应用
azd init --template todo-nodejs-mongo
azd up

# 完成后清理
azd down --force --purge
```

---

## ✅ 成功标准

完成本章后，你应该能够：

```bash
azd version              # 显示已安装的版本
azd init --template todo-nodejs-mongo  # 初始化项目
azd up                   # 部署到 Azure
azd show                 # 显示正在运行的应用 URL
azd down --force --purge # 清理资源
```

---

## 🔗 导航

| 方向 | 章节 |
|-----------|---------|
| <strong>下一章</strong> | [第2章：AI 优先开发](../chapter-02-ai-development/README.md) |
| <strong>跳转到</strong> | [第3章：配置](../chapter-03-configuration/README.md) |

---

## 📖 相关资源

- [命令速查表](../../resources/cheat-sheet.md)
- [常见问题](../../resources/faq.md)
- [术语表](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->