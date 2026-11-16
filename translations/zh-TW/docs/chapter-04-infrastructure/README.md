# 第4章：基礎設施即程式碼與部署

**📚 課程**：[初學者AZD](../../README.md) | **⏱️ 時間**：2-3小時閱讀；部署練習另需額外時間 | **⭐ 複雜度**：中階

---

## 概覽

本章涵蓋透過Bicep範本的基礎設施即程式碼（IaC）模式、資源佈建，以及使用Azure Developer CLI的部署策略。

> 指令與組態檢視目標：`azd 1.37.2` (2026年11月)。檢視期間未執行實際Azure佈建。

## 學習目標

完成本章後，您將能：
- 了解Bicep範本結構與語法
- 使用`azd provision`進行Azure資源佈建
- 使用`azd deploy`進行應用程式部署
- 實作藍綠部署與滾動部署策略

---

## 📚 課程單元

| # | 單元 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [資源佈建](provisioning.md) | 使用AZD的Azure資源管理 | 45分鐘 |
| 2 | [部署指南](deployment-guide.md) | 應用程式部署策略 | 45分鐘 |
| 3 | [自訂範本撰寫](custom-templates.md) | 建立並發佈可重用azd範本 | 30分鐘 |

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

## 🔧 重要指令

| 指令 | 說明 |
|---------|-------------|
| `azd init` | 初始化專案 |
| `azd provision` | 建立Azure資源 |
| `azd deploy` | 部署應用程式程式碼 |
| `azd up` | 佈建 + 部署 |
| `azd down` | 刪除所有資源 |

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第3章：組態](../chapter-03-configuration/README.md) |
| <strong>下一章</strong> | [第5章：多代理解決方案](../chapter-05-multi-agent/README.md) |

---

## 📖 相關資源

- [部署前檢查](../chapter-06-pre-deployment/README.md)
- [Container App 範例](../../examples/container-app/README.md)
- [Database App 範例](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->