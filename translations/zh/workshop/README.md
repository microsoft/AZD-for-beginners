<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T15:24:45+00:00",
  "source_file": "workshop/README.md",
  "language_code": "zh"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 工作坊建设中 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>此工作坊正在积极开发中。</strong><br>
      内容可能不完整或会有所更改。请稍后回来查看更新！
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 最近更新：2025年10月
      </span>
    </div>
  </div>
</div>

# 面向AI开发者的AZD工作坊

欢迎参加专注于AI应用部署的Azure Developer CLI (AZD)动手实践工作坊。本工作坊将帮助您通过以下三个步骤深入了解AZD模板：

1. **探索** - 找到适合您的模板。
1. **部署** - 部署并验证其是否正常运行。
1. **定制** - 修改并迭代，使其符合您的需求！

在整个工作坊过程中，您还将接触到核心开发工具和工作流程，帮助您优化端到端的开发体验。

<br/>

## 基于浏览器的指南

工作坊课程以Markdown格式编写。您可以直接在GitHub中浏览，或者按照下图所示启动基于浏览器的预览。

![工作坊](../../../translated_images/workshop.75906f133e6f8ba0.zh.png)

使用此选项时，请将仓库分叉到您的个人资料中，并启动GitHub Codespaces。当VS Code终端激活后，输入以下命令：

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

几秒钟后，您将看到一个弹出对话框。选择“在浏览器中打开”选项。基于网页的指南将会在新的浏览器标签中打开。此预览的优势包括：

1. **内置搜索** - 快速查找关键字或课程。
1. **复制图标** - 鼠标悬停在代码块上即可看到此选项。
1. **主题切换** - 在深色和浅色主题之间切换。
1. **获取帮助** - 点击页脚中的Discord图标加入社区！

<br/>

## 工作坊概览

**时长：** 3-4小时  
**难度：** 初学者到中级  
**前置条件：** 熟悉Azure、AI概念、VS Code和命令行工具。

这是一个动手实践的工作坊，您将在实践中学习。完成练习后，我们建议您回顾“AZD初学者课程”，继续学习安全性和生产力的最佳实践。

| 时间 | 模块  | 目标 |
|:---|:---|:---|
| 15分钟 | [简介](docs/instructions/0-Introduction.md) | 设定目标，了解工作坊内容 |
| 30分钟 | [选择AI模板](docs/instructions/1-Select-AI-Template.md) | 探索选项并选择入门模板 | 
| 30分钟 | [验证AI模板](docs/instructions/2-Validate-AI-Template.md) | 将默认解决方案部署到Azure |
| 30分钟 | [解析AI模板](docs/instructions/3-Deconstruct-AI-Template.md) | 探索结构和配置 |
| 30分钟 | [配置AI模板](docs/instructions/4-Configure-AI-Template.md) | 激活并尝试可用功能 |
| 30分钟 | [定制AI模板](docs/instructions/5-Customize-AI-Template.md) | 根据您的需求调整模板 |
| 30分钟 | [拆除基础设施](docs/instructions/6-Teardown-Infrastructure.md) | 清理并释放资源 |
| 15分钟 | [总结与下一步](docs/instructions/7-Wrap-up.md) | 学习资源，工作坊挑战 |

<br/>

## 您将学到什么

将AZD模板视为一个学习沙盒，用于探索Azure AI Foundry上的端到端开发的各种功能和工具。完成工作坊后，您应该能够直观地理解相关工具和概念。

| 概念  | 目标 |
|:---|:---|
| **Azure Developer CLI** | 了解工具命令和工作流程 |
| **AZD模板**| 了解项目结构和配置 |
| **Azure AI代理**| 配置并部署Azure AI Foundry项目 |
| **Azure AI搜索**| 使用代理启用上下文工程 |
| **可观测性**| 探索追踪、监控和评估 |
| **红队测试**| 探索对抗性测试和缓解措施 |

<br/>

## 工作坊结构

工作坊结构旨在引导您从模板探索到部署、解析和定制，基于官方[AI代理入门指南](https://github.com/Azure-Samples/get-started-with-ai-agents)入门模板。

### [模块1：选择AI模板](docs/instructions/1-Select-AI-Template.md) (30分钟)

- 什么是AI模板？
- 哪里可以找到AI模板？
- 如何开始构建AI代理？
- **实验**：使用GitHub Codespaces快速入门

### [模块2：验证AI模板](docs/instructions/2-Validate-AI-Template.md) (30分钟)

- 什么是AI模板架构？
- 什么是AZD开发工作流程？
- 如何获取AZD开发帮助？
- **实验**：部署并验证AI代理模板

### [模块3：解析AI模板](docs/instructions/3-Deconstruct-AI-Template.md) (30分钟)

- 探索`.azure/`中的环境
- 探索`infra/`中的资源设置
- 探索`azure.yaml`中的AZD配置
- **实验**：修改环境变量并重新部署

### [模块4：配置AI模板](docs/instructions/4-Configure-AI-Template.md) (30分钟)
- 探索：检索增强生成
- 探索：代理评估与红队测试
- 探索：追踪与监控
- **实验**：探索AI代理+可观测性

### [模块5：定制AI模板](docs/instructions/5-Customize-AI-Template.md) (30分钟)
- 定义：基于场景需求的PRD
- 配置：AZD的环境变量
- 实现：为额外任务添加生命周期钩子
- **实验**：根据我的场景定制模板

### [模块6：拆除基础设施](docs/instructions/6-Teardown-Infrastructure.md) (30分钟)
- 回顾：什么是AZD模板？
- 回顾：为什么使用Azure Developer CLI？
- 下一步：尝试不同的模板！
- **实验**：解除基础设施配置并清理

<br/>

## 工作坊挑战

想挑战自己做更多吗？以下是一些项目建议——或者与我们分享您的想法！

| 项目 | 描述 |
|:---|:---|
|1. **解析复杂AI模板** | 使用我们概述的工作流程和工具，尝试部署、验证和定制一个不同的AI解决方案模板。_您学到了什么？_|
|2. **根据您的场景定制**  | 尝试为不同的场景编写PRD（产品需求文档）。然后在您的模板仓库中使用GitHub Copilot的代理模式，并让它为您生成一个定制工作流程。_您学到了什么？如何改进这些建议？_|
| | |

## 有反馈吗？

1. 在此仓库中发布问题 - 标记为`Workshop`以便查找。
1. 加入Azure AI Foundry Discord - 与同行交流！

| | | 
|:---|:---|
| **📚 课程主页**| [AZD初学者课程](../README.md)|
| **📖 文档** | [AI模板入门指南](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI模板** | [Azure AI Foundry模板](https://ai.azure.com/templates) |
|**🚀 下一步** | [接受挑战](../../../workshop) |
| | |

<br/>

---

**上一节：** [AI故障排除指南](../docs/troubleshooting/ai-troubleshooting.md) | **下一节：** 开始[实验1：AZD基础知识](../../../workshop/lab-1-azd-basics)

**准备好开始使用AZD构建AI应用了吗？**

[开始实验1：AZD基础 →](./lab-1-azd-basics/README.md)

---

**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用此翻译而产生的任何误解或误读不承担责任。