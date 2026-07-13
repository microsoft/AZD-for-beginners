# 第1章: 基礎とクイックスタート

**📚 コース**: [AZD入門](../../README.md) | **⏱️ 所要時間**: 30-45分 | **⭐ 難易度**: 初心者

---

## 概要

本章ではAzure Developer CLI (azd) の基本を紹介します。コアコンセプトを学び、ツールをインストールし、最初のアプリケーションをAzureにデプロイします。

> 2026年7月時点で `azd 1.27.1` にて検証済み。

## 学習目標

本章を終えることで、以下ができるようになります:
- Azure Developer CLIとは何か、Azure CLIとどう違うか理解する
- プラットフォームに応じてAZDをインストール・設定する
- `azd up` で最初のアプリケーションをAzureにデプロイする
- `azd down` でリソースをクリーンアップする

---

## 📚 レッスン一覧

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [AZDの基本](azd-basics.md) | コアコンセプト、用語、プロジェクト構成 | 15分 |
| 2 | [インストール＆セットアップ](installation.md) | プラットフォーム別インストールガイド | 10分 |
| 3 | [最初のプロジェクト](first-project.md) | ハンズオン：WebアプリをAzureにデプロイ | 20分 |
| 4 | [既存のアプリへのazd導入](bring-your-own-app.md) | 既存プロジェクトにazdを追加 | 15分 |
| 5 | [開発コンテナとCodespaces](dev-containers.md) | 再現性あるazd環境を開発コンテナで構築 | 15分 |

---

## ✅ ここから始めよう: 環境の検証

作業を始める前に、ローカルマシンが第1章のテンプレート用に準備できているか確認してください：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

ツールが不足と報告された場合は、まずそれを修正してから章の作業を続けてください。

---

## 🚀 クイックスタート

```bash
# インストールを確認する
azd version

# AZDの認証を行う
# オプション: 直接Azure CLIコマンドを実行する場合はaz login
azd auth login

# 最初のアプリをデプロイする
azd init --template todo-nodejs-mongo
azd up

# 完了後にクリーンアップする
azd down --force --purge
```

---

## ✅ 成功基準

本章を終えた後、以下ができるはずです：

```bash
azd version              # インストールされているバージョンを表示します
azd init --template todo-nodejs-mongo  # プロジェクトを初期化します
azd up                   # Azure にデプロイします
azd show                 # 実行中のアプリの URL を表示します
azd down --force --purge # リソースをクリーンアップします
```

---

## 🔗 ナビゲーション

| 方向 | チャプター |
|-----------|---------|
| <strong>次へ</strong> | [第2章: AIファースト開発](../chapter-02-ai-development/README.md) |
| <strong>スキップして</strong> | [第3章: 設定](../chapter-03-configuration/README.md) |

---

## 📖 関連リソース

- [コマンド早見表](../../resources/cheat-sheet.md)
- [よくある質問](../../resources/faq.md)
- [用語集](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->