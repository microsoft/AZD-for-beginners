# 第4章：基礎設施即代碼與部署

**📚 課程**: [AZD 初學者入門](../../README.md) | **⏱️ 時間**: 1-1.5 小時 | **⭐ 複雜度**: 中等

---

## 概覽

本章涵蓋使用 Bicep 模板的基礎設施即代碼 (IaC) 模式、資源佈建，以及使用 Azure Developer CLI 的部署策略。

## 學習目標

By completing this chapter, you will:
- 了解 Bicep 模板的結構與語法
- 使用 `azd provision` 佈建 Azure 資源
- 使用 `azd deploy` 部署應用程式
- 實作藍綠部署與滾動部署策略

---

## 📚 課程單元

| # | 單元 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [資源佈建](provisioning.md) | 使用 AZD 管理 Azure 資源 | 45 分鐘 |
| 2 | [部署指南](deployment-guide.md) | 應用部署策略 | 45 分鐘 |

---

## 🚀 快速入門

```bash
# 從範本初始化
azd init --template azure-functions-python-v2-http

# 預覽將會建立的內容
azd provision --preview

# 只部署基礎架構
azd provision

# 只部署程式碼
azd deploy

# 或兩者同時
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
| `azd provision` | 佈建 Azure 資源 |
| `azd deploy` | 部署應用程式程式碼 |
| `azd up` | 佈建 + 部署 |
| `azd down` | 刪除所有資源 |

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| **上一章** | [第3章：設定](../chapter-03-configuration/README.md) |
| **下一章** | [第5章：多代理解決方案](../chapter-05-multi-agent/README.md) |

---

## 📖 相關資源

- [部署前檢查](../chapter-06-pre-deployment/README.md)
- [容器應用範例](../../examples/container-app/README.md)
- [資料庫應用範例](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 所翻譯。儘管我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始語言版本應視為具權威性的版本。對於重要資訊，建議使用專業人工翻譯。對於因使用本翻譯而引致的任何誤解或曲解，我們概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->