# 第1章: 基礎とクイックスタート

**📚 コース**: [AZD For Beginners](../../README.md) | **⏱️ 時間**: 初回デプロイ含む75-120分；追加演習はさらに時間がかかります | **⭐ 難易度**: 初心者

---

## 概要

この章ではAzure Developer CLI（azd）の基本を紹介します。コアコンセプトを学び、ツールをインストールし、最初のアプリケーションをAzureにデプロイします。

> コマンドと設定のレビュー対象: `azd 1.37.2` (2026年11月時点)。レビュー時にライブAzureプロビジョニングは実行していません。

## 学習目標

この章を終えることで、以下ができるようになります:
- Azure Developer CLIとは何か、Azure CLIとどう異なるかを理解する
- あなたのプラットフォームにAZDをインストールおよび設定する
- `azd up`を使って最初のアプリケーションをAzureにデプロイする
- `azd down`を使ってリソースをクリーンアップする

---

## 📚 レッスン一覧

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [AZDの基本](azd-basics.md) | コアコンセプト、用語、およびプロジェクト構造 | 15分 |
| 2 | [インストールとセットアップ](installation.md) | プラットフォーム別インストールガイド | 10分 |
| 3 | [最初のプロジェクト](first-project.md) | 実践：WebアプリをAzureにデプロイ | 20分 |
| 4 | [独自アプリの持ち込み](bring-your-own-app.md) | 既存プロジェクトにazdを追加 | 15分 |
| 5 | [DevコンテナとCodespaces](dev-containers.md) | Devコンテナで再現可能なazd環境 | 15分 |

---

## ✅ ここから開始: セットアップの検証

開始前に、ローカルマシンが第1章のテンプレートに対応しているか確認してください:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

スクリプトがツールの不足を報告した場合は、先にそれらを修正し、その後章を続けてください。

---

## 🚀 クイックスタート

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ 成功基準

この章を終えたら、以下ができるはずです:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
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
- [よくある質問](../../resources/faq.md)
- [用語集](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->