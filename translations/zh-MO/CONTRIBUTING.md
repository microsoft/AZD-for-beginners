# 為初學者貢獻 AZD

感謝您對為初學者的 AZD 課程感興趣並願意作出貢獻！本文件提供給貢獻者的指南和資訊。

## 如何貢獻

### 回報問題

如果您發現錯誤、瑕疵，或有改進建議：

1. <strong>檢查現有問題</strong>：搜尋[現有問題](https://github.com/microsoft/azd-for-beginners/issues)以免重複
2. <strong>建立新問題</strong>：使用適當的問題範本
3. <strong>提供詳情</strong>：包含重現步驟、預期行為及適用時的截圖

### 提出變更建議

1. <strong>分叉庫</strong>：建立您自己的專案分叉
2. <strong>建立分支</strong>：為您的變更建立功能分支
3. <strong>進行變更</strong>：遵循我們的程式碼及文件標準
4. <strong>測試您的變更</strong>：確認所有連結正常及內容正確呈現
5. <strong>提交拉取請求</strong>：清楚描述您的變更

### 貢獻類型

我們歡迎以下類型的貢獻：

#### 內容改進
- 修正錯字、文法及格式問題
- 改善現有文件的清晰度
- 更新過時資訊
- 補充缺失的說明或背景

#### 新範例
- 新增實際部署情境
- 為常見使用案例建立新的 AZD 範本
- 提供額外的程式碼範例及練習

#### 翻譯支援
- 協助維護現有翻譯
- 改進翻譯品質
- 為新內容新增翻譯

#### 錯誤回報
- 回報斷鏈結或錯誤的程式碼範例
- 識別文件不一致之處
- 標示可存取性問題

## 貢獻指南

### 文件標準

- 使用清楚、適合初學者的語言
- 包含學習目標與結果
- 提供逐步指引及預期輸出
- 添加導航連結至相關內容
- 採用一致的格式及 markdown 樣式

### 程式碼範例

- 確保所有程式碼範例皆已測試且可運作
- 包含說明重要概念的註解
- 遵循 Azure 及 AZD 最佳實務
- 適用時提供預期輸出

### 驗證英文文件

從庫根目錄，安裝現有的開發需求並執行：

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

離線鏈結檢查工具會檢查英文 Markdown/HTML 路徑、標題、顯式錨點及空鏈結佔位符。它不包含產生的 `translations/` 與 `translated_images/` ，包括指向該等目錄的鏈結。它不會擷取外部網站或驗證 Azure 部署。使用 `--json <report-path>` 匯出錯誤及外部 URL 清單以供另行網路檢查。變更技術指令時請核實當前上游命令及範例前置條件；區分已測試應用程式與設計藍圖。

### 提交訊息

使用清楚且具描述性的提交訊息：
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## 行為準則

請閱讀並遵守我們的[行為準則](CODE_OF_CONDUCT.md)，以維護一個友善及包容的社群。

## 尋求協助

- <strong>問題</strong>：搜尋或開啟 [GitHub 議題](https://github.com/microsoft/AZD-for-beginners/issues)
- <strong>社群</strong>：加入 [Azure Discord](https://discord.gg/microsoft-azure)
- <strong>文件</strong>：查看 [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## 授權

透過貢獻本庫，即表示您同意您的貢獻將採用 [MIT 授權](../../LICENSE) 授權。

---

感謝您幫助讓 AZD 為初學者成為更好的學習資源！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->