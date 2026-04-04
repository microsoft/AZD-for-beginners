# Chapter 4: 基礎設施即代碼與部署

**📚 課程**: [AZD 入門](../../README.md) | **⏱️ 時長**: 1-1.5 小時 | **⭐ 難度**: 中級

---

## 概覽

本章介紹使用 Bicep 模板的基礎設施即代碼 (IaC) 模式、資源配置及利用 Azure Developer CLI 的部署策略。

> 經過 2026 年 3 月 `azd 1.23.12` 版本驗證。

## 學習目標

完成本章後，您將能夠：
- 了解 Bicep 模板結構與語法
- 使用 `azd provision` 配置 Azure 資源
- 使用 `azd deploy` 部署應用程式
- 實作藍綠部署與滾動部署策略

---

## 📚 課程單元

| # | 單元 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [資源配置](provisioning.md) | 使用 AZD 的 Azure 資源管理 | 45 分鐘 |
| 2 | [部署指南](deployment-guide.md) | 應用程式部署策略 | 45 分鐘 |

---

## 🚀 快速啟動

```bash
# 從範本初始化
azd init --template azure-functions-python-v2-http

# 預覽將會建立的內容
azd provision --preview

# 僅配備基礎設施
azd provision

# 僅部署程式碼
azd deploy

# 或兩者同時進行
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
| `azd up` | 配置 + 部署 |
| `azd down` | 刪除所有資源 |

---

## 🔗 導航

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
本文件是使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原文文件的母語版本應被視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。本公司概不對因使用此翻譯而引起的任何誤解或誤譯負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->