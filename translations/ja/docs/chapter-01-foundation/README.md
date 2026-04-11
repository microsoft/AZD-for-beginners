# 第1章: 基礎 & クイックスタート

**📚 コース**: [AZD For Beginners](../../README.md) | **⏱️ 期間**: 30～45分 | **⭐ 難易度**: 初級

---

## 概要

この章では Azure Developer CLI (azd) の基本を紹介します。コアコンセプトを学び、ツールをインストールし、最初のアプリケーションを Azure にデプロイします。

> 2026年3月の `azd 1.23.12` で検証済み。

## 学習目標

この章を完了することで以下のことができるようになります：
- Azure Developer CLI の概要と Azure CLI との違いを理解する
- お使いのプラットフォームに AZD をインストールして設定する
- `azd up` を使って最初のアプリケーションを Azure にデプロイする
- `azd down` でリソースをクリーンアップする

---

## 📚 レッスン一覧

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [AZDの基本](azd-basics.md) | コアコンセプト、用語、プロジェクト構成 | 15分 |
| 2 | [インストール＆セットアップ](installation.md) | プラットフォーム別インストールガイド | 10分 |
| 3 | [最初のプロジェクト](first-project.md) | ハンズオン：Webアプリを Azure にデプロイ | 20分 |

---

## ✅ ここから開始: セットアップ確認

開始前に、ローカルマシンが第1章のテンプレートに対応しているか確認してください：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

スクリプトでツールの不足が報告される場合は、先にそれを解決してから章を進めてください。

---

## 🚀 クイックスタート

```bash
# インストールを確認する
azd version

# AZDの認証を行う
# オプション: Azure CLIコマンドを直接実行する場合はaz login
azd auth login

# 最初のアプリをデプロイする
azd init --template todo-nodejs-mongo
azd up

# 完了したらクリーンアップする
azd down --force --purge
```

---

## ✅ 成功基準

この章を終えた後には、以下のことができるはずです：

```bash
azd version              # インストールされているバージョンを表示します
azd init --template todo-nodejs-mongo  # プロジェクトを初期化します
azd up                   # Azureにデプロイします
azd show                 # 実行中のアプリのURLを表示します
azd down --force --purge # リソースをクリーンアップします
```

---

## 🔗 ナビゲーション

| 方向 | 章 |
|-----------|---------|
| <strong>次へ</strong> | [第2章: AIファースト開発](../chapter-02-ai-development/README.md) |
| <strong>スキップして</strong> | [第3章: 設定](../chapter-03-configuration/README.md) |

---

## 📖 関連リソース

- [コマンド チートシート](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [用語集](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性には努めていますが、自動翻訳には誤りや不正確な箇所が含まれる可能性があることをご承知おきください。原文の言語で記述された文書が正式な情報源とみなされます。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や誤訳についても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->