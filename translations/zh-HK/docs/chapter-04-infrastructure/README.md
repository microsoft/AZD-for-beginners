# Chapter 4: 基礎建設即代碼與部署

**📚 課程**: [AZD 入門](../../README.md) | **⏱️ 時長**: 1-1.5 小時 | **⭐ 複雜度**: 中級

---

## 概述

本章涵蓋使用 Bicep 範本的基礎建設即代碼 (IaC) 模式、資源配置，以及使用 Azure Developer CLI 進行部署策略。

> 驗證版本為 `azd 1.25.6`，時間為 2026 年 6 月。

## 學習目標

完成本章後，您將能夠：
- 理解 Bicep 範本的結構與語法
- 使用 `azd provision` 配置 Azure 資源
- 使用 `azd deploy` 部署應用程式
- 實施藍綠及滾動部署策略

---

## 📚 課程內容

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [資源配置](provisioning.md) | 利用 AZD 管理 Azure 資源 | 45 分鐘 |
| 2 | [部署指南](deployment-guide.md) | 應用程式部署策略 | 45 分鐘 |
| 3 | [自訂範本撰寫](custom-templates.md) | 建立及發佈可重用的 azd 範本 | 30 分鐘 |

---

## 🚀 快速開始

```bash
# 從模板初始化
azd init --template azure-functions-python-v2-http

# 預覽將會被建立的內容
azd provision --preview

# 只設置基礎設施
azd provision

# 只部署代碼
azd deploy

# 或兩者一起進行
azd up
```

---

## 📁 AZD 專案結構

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 常用指令

| 指令 | 說明 |
|---------|-------------|
| `azd init` | 初始化專案 |
| `azd provision` | 建立 Azure 資源 |
| `azd deploy` | 部署應用程式程式碼 |
| `azd up` | 配置並部署 |
| `azd down` | 刪除所有資源 |

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| <strong>下一章</strong> | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

---

## 📖 相關資源

- [部署前檢查](../chapter-06-pre-deployment/README.md)
- [Container App 範例](../../examples/container-app/README.md)
- [Database App 範例](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->