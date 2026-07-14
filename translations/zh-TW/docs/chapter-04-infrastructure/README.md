# 第4章：基礎設施即程式碼與部署

**📚 課程**: [初學者的AZD](../../README.md) | **⏱️ 時長**: 1-1.5 小時 | **⭐ 複雜度**: 中階

---

## 概覽

本章涵蓋使用 Bicep 模板的基礎設施即程式碼 (IaC) 範例、資源配置和使用 Azure Developer CLI 的部署策略。

> 已於 2026 年 7 月針對 `azd 1.27.1` 版本驗證。

## 學習目標

完成本章後，您將能夠：
- 理解 Bicep 模板的結構與語法
- 使用 `azd provision` 進行 Azure 資源配置
- 使用 `azd deploy` 部署應用程式
- 實作藍綠部署與滾動部署策略

---

## 📚 課程內容

| # | 課程 | 描述 | 時間 |
|---|--------|-------------|------|
| 1 | [資源配置](provisioning.md) | 使用 AZD 管理 Azure 資源 | 45 分鐘 |
| 2 | [部署指南](deployment-guide.md) | 應用程式部署策略 | 45 分鐘 |
| 3 | [創建自訂模板](custom-templates.md) | 建立與發佈可重用 azd 模板 | 30 分鐘 |

---

## 🚀 快速開始

```bash
# 從範本初始化
azd init --template azure-functions-python-v2-http

# 預覽將被建立的內容
azd provision --preview

# 只提供基礎設施
azd provision

# 只部署程式碼
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

## 🔧 重要指令

| 指令 | 描述 |
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
| <strong>上一章</strong> | [第3章：設定](../chapter-03-configuration/README.md) |
| <strong>下一章</strong> | [第5章：多代理解決方案](../chapter-05-multi-agent/README.md) |

---

## 📖 相關資源

- [部署前檢查](../chapter-06-pre-deployment/README.md)
- [容器應用範例](../../examples/container-app/README.md)
- [資料庫應用範例](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->