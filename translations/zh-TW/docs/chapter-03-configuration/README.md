# 第 3 章: 設定與驗證

**📚 課程**: [AZD 初學者指南](../../README.md) | **⏱️ 時長**: 45-60 分鐘 | **⭐ 複雜度**: 中等

---

## 概覽

本章涵蓋 Azure Developer CLI 部署的環境設定、驗證模式與安全最佳實務。

## 學習目標

完成本章後，你將能：
- 掌握 AZD 的設定層級
- 管理多個環境 (dev, staging, prod)
- 使用託管身分識別實作安全驗證
- 設定環境特定的設定

---

## 📚 Lessons

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [設定指南](configuration.md) | 環境設定與管理 | 30 分鐘 |
| 2 | [驗證與安全性](authsecurity.md) | 託管身分識別與 RBAC 模式 | 30 分鐘 |

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

## 🔧 設定層級

AZD 以此順序套用設定 (後者會覆蓋前者):

1. **預設值** (built into templates)
2. **azure.yaml** (專案設定)
3. **環境變數** (`azd env set`)
4. **命令列旗標** (`--location eastus`)

---

## 🔐 安全最佳實務

```bash
# 使用託管身分識別（建議）
azd env set AZURE_USE_MANAGED_IDENTITY true

# 檢查驗證狀態
azd auth whoami
az account show

# 如有需要，請重新驗證
azd auth login
az login
```

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| **上一章** | [第 2 章: AI 開發](../chapter-02-ai-development/README.md) |
| **下一章** | [第 4 章: 基礎建設](../chapter-04-infrastructure/README.md) |

---

## 📖 相關資源

- [部署前檢查](../chapter-06-pre-deployment/README.md)
- [疑難排解](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件係使用 AI 翻譯服務 Co-op Translator（https://github.com/Azure/co-op-translator）翻譯而成。儘管我們努力追求準確，但請注意，自動翻譯可能包含錯誤或不精確之處。原始語言版本應被視為具權威性的參考來源。若為重要資訊，建議採用專業人工翻譯。我們對因使用此翻譯而產生的任何誤解或曲解概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->