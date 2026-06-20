# 第 3 章：設定與驗證

**📚 課程**: [AZD 初學者](../../README.md) | **⏱️ 時長**: 45-60 分鐘 | **⭐ 難度**: 中等

---

## 概覽

本章涵蓋環境設定、驗證模式，以及針對 Azure Developer CLI 部署的安全最佳實務。

> 已針對 `azd 1.25.6` 在 2026 年 6 月進行驗證。

## 學習目標

完成本章後，您將能：
- 精通 AZD 配置階層
- 管理多個環境（dev, staging, prod）
- 使用託管識別實作安全的驗證
- 設定環境專屬設定

---

## 📚 課程

| # | 課程 | 描述 | 時間 |
|---|--------|-------------|------|
| 1 | [設定指南](configuration.md) | 環境設定與管理 | 30 分鐘 |
| 2 | [驗證與安全](authsecurity.md) | 託管識別與 RBAC 模式 | 30 分鐘 |

---

## 🚀 快速上手

```bash
# 建立多個環境
azd env new dev
azd env new staging
azd env new prod

# 切換環境
azd env select prod

# 設定環境變數
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# 檢視設定
azd env get-values
```

---

## 🔧 配置階層

AZD 以以下順序套用設定（後者會覆蓋前者）：

1. <strong>預設值</strong> (built into templates)
2. **azure.yaml** (project configuration)
3. <strong>環境變數</strong> (`azd env set`)
4. <strong>命令列旗標</strong> (`--location eastus`)

---

## 🔐 安全最佳實務

```bash
# 使用託管身分識別（建議）
azd env set AZURE_USE_MANAGED_IDENTITY true

# 檢查 AZD 驗證狀態
azd auth status

# 選擇性：如果您打算執行 az 命令，請驗證 Azure CLI 的上下文
az account show

# 如有需要，請重新驗證
azd auth login

# 選擇性：為 az 命令重新整理 Azure CLI 的驗證
az login
```

---

## 🔗 導覽

| Direction | Chapter |
|-----------|---------|
| **Previous** | [第 2 章：AI 開發](../chapter-02-ai-development/README.md) |
| **Next** | [第 4 章：基礎架構](../chapter-04-infrastructure/README.md) |

---

## 📖 相關資源

- [部署前檢查](../chapter-06-pre-deployment/README.md)
- [故障排除](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->