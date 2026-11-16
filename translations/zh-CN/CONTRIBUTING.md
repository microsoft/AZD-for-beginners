# 为初学者贡献 AZD

感谢您对为初学者准备的 AZD 课程感兴趣并参与贡献！本文件提供给贡献者的指南和信息。

## 如何贡献

### 报告问题

如果您发现了错误、故障或有改进建议：

1. <strong>检查现有问题</strong>：搜索[现有问题](https://github.com/microsoft/azd-for-beginners/issues)以避免重复
2. <strong>创建新问题</strong>：使用合适的问题模板
3. <strong>提供详细信息</strong>：包括重现步骤、预期行为及截图（如适用）

### 提出更改建议

1. **Fork 仓库**：创建您自己的项目分叉
2. <strong>创建分支</strong>：为您的更改创建功能分支
3. <strong>进行更改</strong>：遵循我们的编码和文档标准
4. <strong>测试您的更改</strong>：验证所有链接有效且内容正确显示
5. <strong>提交拉取请求</strong>：提供清晰的更改描述

### 贡献类型

我们欢迎以下类型的贡献：

#### 内容改进
- 修正错别字、语法和格式问题
- 提升现有文档的清晰度
- 更新过时信息
- 增加缺失的解释或上下文

#### 新示例
- 添加真实部署场景
- 创建常用场景的 AZD 模板
- 提供额外的代码示例和练习

#### 翻译支持
- 协助维护现有翻译
- 提高翻译质量
- 为新内容添加翻译

#### 错误报告
- 报告断链或错误代码示例
- 识别文档不一致之处
- 标记无障碍问题

## 贡献指南

### 文档标准

- 使用清晰、适合初学者的语言
- 包含学习目标和成果
- 提供逐步指导和预期输出
- 添加相关内容的导航链接
- 采用一致的格式和 Markdown 风格

### 代码示例

- 确保所有代码示例经过测试且能正常运行
- 包含解释关键概念的注释
- 遵循 Azure 和 AZD 的最佳实践
- 如适用，提供预期输出

### 验证英文文档

从仓库根目录，安装现有的开发依赖并运行：

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

离线链接检查工具会检查英文 Markdown/HTML 路径、标题、显式锚点及空链接占位符。它会排除生成的 `translations/` 和 `translated_images/`，包括指向这些目录的链接。它不会抓取外部网站或验证 Azure 部署。使用 `--json <report-path>` 导出失败记录和外部 URL 清单以进行单独的网络检查。更改技术说明时，请验证当前上游命令和示例前提条件；区分已测试的应用与设计蓝图。

### 提交信息

使用清晰且描述性的提交信息：
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## 行为准则

请阅读并遵守我们的[行为准则](CODE_OF_CONDUCT.md)，共同维护一个欢迎且包容的社区环境。

## 寻求帮助

- <strong>提问</strong>：搜索或打开 [GitHub 问题](https://github.com/microsoft/AZD-for-beginners/issues)
- <strong>社区</strong>：加入 [Azure Discord](https://discord.gg/microsoft-azure)
- <strong>文档</strong>：查看 [Azure Developer CLI 文档](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## 许可

贡献此仓库即表示您同意您的贡献将遵守[MIT 许可证](../../LICENSE)。

---

感谢您帮助让 AZD For Beginners 成为社区更好的学习资源！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->