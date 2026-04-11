# 第三章：設定與驗證

**📚 課程**: [AZD 新手入門](../../README.md) | **⏱️ 時間**: 45-60 分鐘 | **⭐ 難度**: 中階

---

## 概覽

本章涵蓋環境設定、驗證模式，以及 Azure 開發者 CLI 部署的安全最佳實務。

> 已於 2026 年 3 月使用 `azd 1.23.12` 驗證通過。

## 學習目標

完成本章後，您將能夠：
- 精通 AZD 的設定階層
- 管理多個環境（開發、測試、正式）
- 實作使用受控身份的安全驗證
- 設定環境專屬參數

---

## 📚 課程列表

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [設定指南](configuration.md) | 環境建立與管理 | 30 分鐘 |
| 2 | [驗證與安全](authsecurity.md) | 受控身份與角色基礎存取控制模式 | 30 分鐘 |

---

## 🚀 快速開始

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

# 檢視設定檔
azd env get-values
```

---

## 🔧 設定階層

AZD 依此順序套用設定（後者會覆蓋前者）：

1. <strong>預設值</strong>（內建於範本中）
2. **azure.yaml**（專案設定）
3. <strong>環境變數</strong>（`azd env set`）
4. <strong>指令列參數</strong>（`--location eastus`）

---

## 🔐 安全最佳實務

```bash
# 使用受管身份（推薦）
azd env set AZURE_USE_MANAGED_IDENTITY true

# 檢查 AZD 認證狀態
azd auth status

# 選擇性：如果您計劃執行 az 指令，請驗證 Azure CLI 上下文
az account show

# 如有需要，重新進行身份驗證
azd auth login

# 選擇性：更新 Azure CLI 的 az 指令認證
az login
```

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第二章：AI 開發](../chapter-02-ai-development/README.md) |
| <strong>下一章</strong> | [第四章：基礎建設](../chapter-04-infrastructure/README.md) |

---

## 📖 相關資源

- [部署前檢查](../chapter-06-pre-deployment/README.md)
- [疑難排解](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於準確性，請注意自動翻譯可能包含錯誤或不準確之處。原文檔以其母語版本為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對使用此翻譯所導致之任何誤解或誤譯負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->