# 第1章: 基礎とクイックスタート

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 30-45 minutes | **⭐ Complexity**: Beginner

---

## 概要

この章では Azure Developer CLI (azd) の基本を紹介します。コアコンセプトを学び、ツールをインストールし、最初のアプリケーションを Azure にデプロイします。

> `azd 1.25.6` に対して 2026年6月に検証済み。

## 学習目標

この章を完了すると、以下ができるようになります:
- Azure Developer CLI が何であるか、Azure CLI とどのように異なるかを理解する
- 使用しているプラットフォームに AZD をインストールして設定する
- `azd up` で最初のアプリケーションを Azure にデプロイする
- `azd down` でリソースをクリーンアップする

---

## 📚 レッスン

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [AZD Basics](azd-basics.md) | コア概念、用語、プロジェクト構成 | 15分 |
| 2 | [Installation & Setup](installation.md) | プラットフォーム別のインストールガイド | 10分 |
| 3 | [Your First Project](first-project.md) | ハンズオン: Web アプリを Azure にデプロイ | 20分 |
| 4 | [Bring Your Own App](bring-your-own-app.md) | 既存のプロジェクトに azd を追加する | 15分 |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | 開発コンテナを使った再現可能な azd 環境 | 15分 |

---

## ✅ ここから開始: セットアップの検証

始める前に、ローカルマシンが第1章のテンプレートに対応していることを確認してください:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

スクリプトがツールの欠如を報告した場合は、まずそれらを修正してから章を続けてください。

---

## 🚀 クイックスタート

```bash
# インストールを確認
azd version

# AZD の認証
# 任意: Azure CLI コマンドを直接実行する場合は az login
azd auth login

# 最初のアプリをデプロイする
azd init --template todo-nodejs-mongo
azd up

# 完了したらクリーンアップ
azd down --force --purge
```

---

## ✅ 成功基準

この章を完了した後、次のことができるはずです:

```bash
azd version              # インストール済みのバージョンを表示します
azd init --template todo-nodejs-mongo  # プロジェクトを初期化します
azd up                   # Azure にデプロイします
azd show                 # 実行中のアプリの URL を表示します
azd down --force --purge # リソースをクリーンアップします
```

---

## 🔗 ナビゲーション

| Direction | Chapter |
|-----------|---------|
| **Next** | [Chapter 2: AI-First Development](../chapter-02-ai-development/README.md) |
| **Skip to** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |

---

## 📖 関連資料

- [Command Cheat Sheet](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossary](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->