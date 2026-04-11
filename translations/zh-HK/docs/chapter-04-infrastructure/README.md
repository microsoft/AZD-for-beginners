# 第四章：基礎建設即程式碼與部署

**📚 課程**: [AZD 初學者指南](../../README.md) | **⏱️ 時間**: 1-1.5 小時 | **⭐ 難度**: 中階

---

## 概覽

本章涵蓋使用 Bicep 範本的基礎設施即程式碼 (IaC) 範式、資源佈建，以及使用 Azure Developer CLI 的部署策略。

> 已於 2026 年 3 月針對 `azd 1.23.12` 進行驗證。

## 學習目標

完成本章後，你將：
- 了解 Bicep 範本的結構與語法
- 使用 `azd provision` 佈建 Azure 資源
- 使用 `azd deploy` 部署應用程式
- 實作藍綠部署與滾動部署策略

---

## 📚 課程內容

| # | 單元 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [資源佈建](provisioning.md) | 使用 AZD 管理 Azure 資源 | 45 分鐘 |
| 2 | [部署指南](deployment-guide.md) | 應用程式部署策略 | 45 分鐘 |

---

## 🚀 快速開始

```bash
# 由範本初始化
azd init --template azure-functions-python-v2-http

# 預覽將會建立的內容
azd provision --preview

# 只佈建基礎設施
azd provision

# 只部署程式碼
azd deploy

# 或兩者一併
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
| <strong>上一章</strong> | [第三章：設定](../chapter-03-configuration/README.md) |
| <strong>下一章</strong> | [第五章：多代理方案](../chapter-05-multi-agent/README.md) |

---

## 📖 相關資源

- [部署前檢查](../chapter-06-pre-deployment/README.md)
- [容器應用範例](../../examples/container-app/README.md)
- [資料庫應用範例](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們努力確保準確性，請注意自動翻譯可能包含錯誤或不準確之處。原文（以其原始語言撰寫）應被視為具權威性的來源。若涉及重要資訊，建議採用專業人工翻譯。我們不會就任何因使用本翻譯而產生的誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->