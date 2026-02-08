# 第1章: 基礎とクイックスタート

**📚 コース**: [AZD 入門](../../README.md) | **⏱️ 所要時間**: 30〜45分 | **⭐ 難易度**: 初級

---

## 概要

この章では Azure Developer CLI (azd) の基本を紹介します。コア概念を学び、ツールをインストールし、最初のアプリケーションを Azure にデプロイします。

## 学習目標

この章を修了すると次のことができるようになります：
- Azure Developer CLI が何か、そして Azure CLI とどのように異なるかを理解する
- 自分のプラットフォームに AZD をインストールして設定する
- `azd up` を使って最初のアプリケーションを Azure にデプロイする
- `azd down` を使ってリソースをクリーンアップする

---

## 📚 レッスン

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [AZD の基本](azd-basics.md) | コア概念、用語、およびプロジェクト構成 | 15分 |
| 2 | [Installation & Setup](installation.md) | プラットフォーム別のインストールガイド | 10分 |
| 3 | [Your First Project](first-project.md) | 実践: Web アプリを Azure にデプロイ | 20分 |

---

## 🚀 クイックスタート

```bash
# インストールを確認する
azd version

# Azureにログインする
azd auth login

# 最初のアプリをデプロイする
azd init --template todo-nodejs-mongo
azd up

# 完了したらクリーンアップする
azd down --force --purge
```

---

## ✅ 成功基準

この章を完了した後、次のことができるはずです：

```bash
azd version              # インストールされているバージョンを表示する
azd init --template todo-nodejs-mongo  # プロジェクトを初期化する
azd up                   # Azure にデプロイする
azd show                 # 実行中のアプリの URL を表示する
azd down --force --purge # リソースをクリーンアップする
```

---

## 🔗 ナビゲーション

| 方向 | 章 |
|-----------|---------|
| **次へ** | [第2章: AIファースト開発](../chapter-02-ai-development/README.md) |
| **スキップ先** | [第3章: 設定](../chapter-03-configuration/README.md) |

---

## 📖 関連リソース

- [コマンド チートシート](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [用語集](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
本書は AI 翻訳サービス「Co-op Translator」(https://github.com/Azure/co-op-translator) を用いて翻訳されました。正確性には努めておりますが、自動翻訳には誤りや不正確な箇所が含まれる可能性があることをご承知ください。原文（原言語の文書）が正式な原本とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や誤訳についても、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->