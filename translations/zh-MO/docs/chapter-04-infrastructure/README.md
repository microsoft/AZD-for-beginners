# 第4章：基礎設施即程式碼與部署

**📚 課程**: [AZD 初學者](../../README.md) | **⏱️ 時長**: 1-1.5 小時 | **⭐ 複雜度**: 中等

---

## 概覽

本章涵蓋使用 Bicep 範本的基礎設施即程式碼 (IaC) 模式、資源佈建，以及使用 Azure Developer CLI 的部署策略。

## 學習目標

完成本章後，您將會：
- 了解 Bicep 範本的結構與語法
- 使用 `azd provision` 佈建 Azure 資源
- 使用 `azd deploy` 部署應用程式
- 實作藍綠部署和滾動部署策略

---

## 📚 課程

| # | 單元 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [資源佈建](provisioning.md) | 使用 AZD 管理 Azure 資源 | 45 分鐘 |
| 2 | [部署指南](deployment-guide.md) | 應用程式部署策略 | 45 分鐘 |

---

## 🚀 快速入門

```bash
# 從範本初始化
azd init --template azure-functions-python-v2-http

# 預覽即將建立的內容
azd provision --preview

# 僅配置基礎架構
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

## 🔧 基本指令

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
| **上一章** | [第3章：組態](../chapter-03-configuration/README.md) |
| **下一章** | [第5章：多代理解決方案](../chapter-05-multi-agent/README.md) |

---

## 📖 相關資源

- [部署前檢查](../chapter-06-pre-deployment/README.md)
- [容器應用範例](../../examples/container-app/README.md)
- [資料庫應用範例](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 Co‑op Translator（https://github.com/Azure/co-op-translator）進行翻譯。儘管我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。以原語言撰寫的原始文件應被視為具有權威性的版本。如涉及關鍵資訊，建議採用專業人工翻譯。我們對因使用本翻譯而引致的任何誤解或誤釋不承擔任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->