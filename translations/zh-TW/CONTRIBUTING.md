# 為初學者貢獻 AZD

感謝您有興趣為 AZD For Beginners 課程做出貢獻！此文件提供給貢獻者的指引與資訊。

## 如何貢獻

### 回報問題

如果您發現錯誤、瑕疵或有改進建議：

1. <strong>檢查現有問題</strong>：搜尋[現有問題](https://github.com/microsoft/azd-for-beginners/issues)以避免重複
2. <strong>建立新問題</strong>：使用適合的問題模板
3. <strong>提供詳細資料</strong>：包含重現步驟、預期行為及截圖（如適用）

### 提出變更建議

1. **Fork 倉庫**：建立您自己的專案分支
2. <strong>建立分支</strong>：為您的變更建立功能分支
3. <strong>進行變更</strong>：遵循我們的程式碼與文件標準
4. <strong>測試您的變更</strong>：確認所有連結正常，內容正確呈現
5. <strong>提交拉取請求</strong>：提供清楚的變更說明

### 貢獻類型

我們歡迎以下類型的貢獻：

#### 內容改進
- 修正打字錯誤、文法及格式問題
- 改善現有文件的清晰度
- 更新過時資訊
- 補充缺漏說明或背景資訊

#### 新增範例
- 新增真實部署場景
- 建立常見用例的 AZD 範本
- 提供更多程式碼範例與練習

#### 翻譯支援
- 協助維護現有翻譯
- 改善翻譯品質
- 新增內容翻譯

#### 錯誤回報
- 回報失效連結或錯誤程式碼範例
- 辨識文件不一致處
- 標示無障礙使用障礙

## 貢獻指南

### 文件標準

- 使用清楚、適合初學者的語言
- 包含學習目標與成果
- 提供逐步指示及預期輸出
- 新增導覽連結至相關內容
- 使用一致的格式與 markdown 風格

### 程式碼範例

- 確保所有程式碼範例經過測試且可執行
- 附註說明重要概念
- 遵循 Azure 與 AZD 最佳實務
- 於適用處提供預期輸出

### 驗證英文文件

從專案根目錄安裝現有的開發需求並執行：

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

離線連結檢查工具會檢視英文 Markdown/HTML 的路徑、標題、明確錨點，以及空連結佔位符。它會排除產生的 `translations/` 和 `translated_images/`，包括進入這些目錄的連結。不會抓取外部網站或驗證 Azure 部署。使用 `--json <report-path>` 匯出失敗清單及外部 URL 清單以進行獨立的網路檢查。在變更技術指令時請確認目前上游命令和範例先決條件，區別已測試的應用程式與設計藍圖。

### 提交訊息

使用清楚、描述性的提交訊息：
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## 行為守則

請閱讀並遵守我們的[行為守則](CODE_OF_CONDUCT.md)，以維護一個歡迎且包容的社群。

## 獲得幫助

- <strong>問題</strong>：搜尋或開啟[GitHub 問題](https://github.com/microsoft/AZD-for-beginners/issues)
- <strong>社群</strong>：加入[Azure Discord](https://discord.gg/microsoft-azure)
- <strong>文件</strong>：查閱[Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## 授權條款

透過貢獻此倉庫，您同意您的貢獻將以[MIT 授權條款](../../LICENSE)授權。

---

感謝您協助讓 AZD For Beginners 成為社群更好的學習資源！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->