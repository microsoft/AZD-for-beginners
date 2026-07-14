# 第1章：基础与快速开始

**📚 课程**：[初学者的 AZD](../../README.md) | **⏱️ 时长**：30-45 分钟 | **⭐ 难度**：初学者

---

## 概述

本章介绍了 Azure Developer CLI (azd) 的基础知识。您将学习核心概念、安装工具，并将您的第一个应用部署到 Azure。

> 在 2026 年 7 月使用 `azd 1.27.1` 验证通过。

## 学习目标

完成本章后，您将能够：
- 了解 Azure Developer CLI 是什么及其与 Azure CLI 的区别
- 在您的平台上安装并配置 AZD
- 使用 `azd up` 将第一个应用部署到 Azure
- 使用 `azd down` 清理资源

---

## 📚 课程列表

| # | 课程 | 描述 | 用时 |
|---|--------|-------------|------|
| 1 | [AZD 基础](azd-basics.md) | 核心概念、术语和项目结构 | 15 分钟 |
| 2 | [安装与设置](installation.md) | 针对各平台的安装指南 | 10 分钟 |
| 3 | [你的第一个项目](first-project.md) | 实战：将 Web 应用部署到 Azure | 20 分钟 |
| 4 | [使用已有的应用](bring-your-own-app.md) | 将 azd 添加到已有项目中 | 15 分钟 |
| 5 | [开发容器与代码空间](dev-containers.md) | 使用开发容器实现可复现的 azd 环境 | 15 分钟 |

---

## ✅ 从这里开始：验证您的环境

开始前，请确认您的本机已为第1章模板做好准备：

**Windows：**
```powershell
.\validate-setup.ps1
```

**macOS / Linux：**
```bash
bash ./validate-setup.sh
```

如果脚本报告缺少工具，请先解决这些问题，然后再继续下一步。

---

## 🚀 快速开始

```bash
# 检查安装
azd version

# 验证AZD身份
# 可选：如果您计划直接运行Azure CLI命令，请执行az登录
azd auth login

# 部署您的第一个应用
azd init --template todo-nodejs-mongo
azd up

# 完成后清理
azd down --force --purge
```

---

## ✅ 成功标准

完成本章后，您应能够：

```bash
azd version              # 显示已安装的版本
azd init --template todo-nodejs-mongo  # 初始化项目
azd up                   # 部署到 Azure
azd show                 # 显示运行中应用的 URL
azd down --force --purge # 清理资源
```

---

## 🔗 导航

| 方向 | 章节 |
|-----------|---------|
| <strong>下一章</strong> | [第2章：AI优先开发](../chapter-02-ai-development/README.md) |
| <strong>跳到</strong> | [第3章：配置](../chapter-03-configuration/README.md) |

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