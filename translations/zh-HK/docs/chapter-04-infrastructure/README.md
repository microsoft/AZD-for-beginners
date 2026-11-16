# 第4章：基礎設施即代碼與部署

**📚 課程**: [AZD 入門](../../README.md) | **⏱️ 時長**: 2-3 小時閱讀；部署練習需要額外時間 | **⭐ 複雜度**: 中級

---

## 概覽

本章涵蓋使用 Bicep 範本的基礎設施即代碼 (IaC) 範例、資源配置，以及使用 Azure Developer CLI 的部署策略。

> 命令及設定審查目標: `azd 1.37.2` (2026年11月)。審查期間未進行實時 Azure 配置。

## 學習目標

完成本章後，你將能夠：
- 理解 Bicep 範本的結構與語法
- 使用 `azd provision` 配置 Azure 資源
- 使用 `azd deploy` 部署應用程式
- 實作藍綠部署與滾動部署策略

---

## 📚 課程單元

| # | 單元 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [資源配置](provisioning.md) | 使用 AZD 管理 Azure 資源 | 45 分鐘 |
| 2 | [部署指南](deployment-guide.md) | 應用程式部署策略 | 45 分鐘 |
| 3 | [撰寫自訂範本](custom-templates.md) | 建立並發佈可重複使用的 azd 範本 | 30 分鐘 |

---

## 🚀 快速開始

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
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
| `azd up` | 配置 + 部署 |
| `azd down` | 刪除所有資源 |

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第3章：設定](../chapter-03-configuration/README.md) |
| <strong>下一章</strong> | [第5章：多代理解決方案](../chapter-05-multi-agent/README.md) |

---

## 📖 關聯資源

- [部署前檢查](../chapter-06-pre-deployment/README.md)
- [容器應用範例](../../examples/container-app/README.md)
- [資料庫應用範例](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->