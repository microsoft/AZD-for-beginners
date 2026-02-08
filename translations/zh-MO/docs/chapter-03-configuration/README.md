# 第 3 章：設定與驗證

**📚 課程**: [AZD 新手入門](../../README.md) | **⏱️ 時長**: 45-60 分鐘 | **⭐ 複雜度**: 中階

---

## 概覽

本章涵蓋針對 Azure Developer CLI 部署的環境設定、驗證模式與安全最佳實務。

## 學習目標

完成本章後，您將：
- 掌握 AZD 的設定階層
- 管理多個環境（dev、staging、prod）
- 使用受管理的身分識別實作安全驗證
- 設定環境特定的參數

---

## 📚 課程

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [設定指南](configuration.md) | 環境設定與管理 | 30 分鐘 |
| 2 | [驗證與安全](authsecurity.md) | 受管理身分與 RBAC 模式 | 30 分鐘 |

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

# 檢視設定
azd env get-values
```

---

## 🔧 設定階層

AZD 以此順序套用設定（後者會覆蓋前者）：

1. **預設值** (內嵌於範本中)
2. **azure.yaml** (專案設定)
3. **環境變數** (`azd env set`)
4. **命令列旗標** (`--location eastus`)

---

## 🔐 安全最佳實務

```bash
# 使用受管身分（建議）
azd env set AZURE_USE_MANAGED_IDENTITY true

# 檢查驗證狀態
azd auth whoami
az account show

# 如有需要，重新驗證
azd auth login
az login
```

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| **上一章** | [第 2 章：AI 開發](../chapter-02-ai-development/README.md) |
| **下一章** | [第 4 章：基礎架構](../chapter-04-infrastructure/README.md) |

---

## 📖 相關資源

- [部署前檢查](../chapter-06-pre-deployment/README.md)
- [疑難排解](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用人工智慧翻譯服務「Co-op Translator」（https://github.com/Azure/co-op-translator）進行翻譯。雖然我們會盡力維持準確性，但請注意，自動化翻譯可能包含錯誤或不準確之處。原始語言版本應視為具權威性的版本。如涉及關鍵資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而導致的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->