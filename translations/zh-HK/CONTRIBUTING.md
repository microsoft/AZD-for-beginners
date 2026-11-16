# 為初學者貢獻 AZD

感謝您有興趣為 AZD 為初學者課程貢獻！本文件提供貢獻者的指引和資訊。

## 如何貢獻

### 回報問題

若您發現錯誤、錯誤或有改進建議：

1. <strong>檢查現有問題</strong>：搜尋[現有問題](https://github.com/microsoft/azd-for-beginners/issues)以避免重複
2. <strong>建立新問題</strong>：使用適當的問題範本
3. <strong>提供詳細資料</strong>：包括重現步驟、預期行為與截圖（如適用）

### 提出更改

1. <strong>分叉倉庫</strong>：建立您自己的專案分叉
2. <strong>建立分支</strong>：為您的更改建立功能分支
3. <strong>進行更改</strong>：遵循我們的編碼與文件標準
4. <strong>測試您的更改</strong>：確認所有連結正常且內容正確顯示
5. <strong>提交拉取請求</strong>：清楚描述您的更改內容

### 貢獻類型

我們歡迎以下類型的貢獻：

#### 內容改進
- 修正文法錯誤、語法及格式問題
- 改善現有文件的清晰度
- 更新過時資訊
- 補充遺漏的說明或背景

#### 新增範例
- 新增真實部署情境
- 建立常見用例的 AZD 模板
- 提供更多程式碼範例及練習

#### 翻譯支援
- 協助維護現有翻譯
- 提高翻譯品質
- 為新內容新增翻譯

#### 錯誤回報
- 回報斷鏈接或錯誤範例程式碼
- 辨識文件不一致之處
- 標示無障礙問題

## 貢獻指南

### 文件標準

- 使用清晰、適合初學者的語言
- 包含學習目標與成果
- 提供循序漸進的指引與預期輸出
- 新增相關內容的導覽連結
- 使用一致的格式和 markdown 風格

### 程式碼範例

- 確保所有範例程式碼已測試且可運行
- 包含解釋核心概念的註解
- 遵循 Azure 與 AZD 最佳實踐
- 如適用，提供預期輸出

### 驗證英文文件

從倉庫根目錄，安裝現有開發需求並執行：

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

離線連結檢查器會檢查英文 Markdown/HTML 路徑、標題、明確的錨點及空白連結佔位符。它會排除生成的 `translations/` 及 `translated_images/`，包含指向那些目錄的連結。它不會擷取外部網站或驗證 Azure 部署。使用 `--json <report-path>` 匯出失敗項及外部 URL 清單以供另行網絡檢查。當更改技術指示時，請核實當前上游指令及範例前置條件；區分已測試的應用與設計藍圖。

### 提交訊息

使用清晰且具描述性的提交訊息：
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## 行為準則

請閱讀並遵守我們的[行為準則](CODE_OF_CONDUCT.md)，以維護一個友善且包容的社群環境。

## 尋求幫助

- <strong>問題詢問</strong>：搜尋或建立[GitHub 問題](https://github.com/microsoft/AZD-for-beginners/issues)
- <strong>社群互動</strong>：加入[Azure Discord](https://discord.gg/microsoft-azure)
- <strong>文件檢閱</strong>：[Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## 授權條款

透過對此倉庫的貢獻，您同意您的貢獻將依據[MIT 授權條款](../../LICENSE)授權。

---

感謝您協助讓 AZD 為初學者成為社群更好的學習資源！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->