# 第 4 章：基礎設施即程式碼與部署

**📚 課程**: [AZD For Beginners](../../README.md) | **⏱️ 時長**: 1-1.5 小時 | **⭐ 複雜度**: 中等

---

## 概覽

本章涵蓋使用 Bicep 範本的基礎設施即程式碼 (IaC) 模式、資源佈建，以及使用 Azure Developer CLI 的部署策略。

> 已在 2026 年 6 月使用 `azd 1.25.6` 驗證。

## 學習目標

完成本章後，您將：
- 了解 Bicep 範本的結構與語法
- 使用 `azd provision` 佈建 Azure 資源
- 使用 `azd deploy` 部署應用程式
- 實作藍綠部署與滾動部署策略

---

## 📚 課程

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | 使用 AZD 管理 Azure 資源 | 45 分鐘 |
| 2 | [Deployment Guide](deployment-guide.md) | 應用程式部署策略 | 45 分鐘 |
| 3 | [Authoring Your Own Template](custom-templates.md) | 建立並發佈可重用的 azd 範本 | 30 分鐘 |

---

## 🚀 快速開始

```bash
# 從範本初始化
azd init --template azure-functions-python-v2-http

# 預覽將會建立的內容
azd provision --preview

# 僅配置基礎設施
azd provision

# 僅部署程式碼
azd deploy

# 或同時執行兩者
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
| `azd up` | 佈建 + 部署 |
| `azd down` | 刪除所有資源 |

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第 3 章：設定](../chapter-03-configuration/README.md) |
| <strong>下一章</strong> | [第 5 章：多代理解決方案](../chapter-05-multi-agent/README.md) |

---

## 📖 相關資源

- [部署前檢查](../chapter-06-pre-deployment/README.md)
- [容器應用範例](../../examples/container-app/README.md)
- [資料庫應用範例](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->