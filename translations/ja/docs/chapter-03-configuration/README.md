# 第3章: 設定と認証

**📚 コース**: [AZD For Beginners](../../README.md) | **⏱️ 所要時間**: 45-60分 | **⭐ 難易度**: 中級

---

## 概要

本章では Azure Developer CLI の展開における環境設定、認証パターン、セキュリティのベストプラクティスを解説します。

> 2026年7月の `azd 1.27.1` で検証済み。

## 学習目標

本章を修了すると以下を習得できます:
- AZD設定の階層構造を理解する
- 複数環境（開発、ステージング、本番）を管理する
- マネージドアイデンティティを用いた安全な認証を実装する
- 環境固有の設定を構成する

---

## 📚 レッスン

| # | レッスン | 説明 | 所要時間 |
|---|--------|-------------|------|
| 1 | [Configuration Guide](configuration.md) | 環境セットアップと管理 | 30分 |
| 2 | [Authentication & Security](authsecurity.md) | マネージドアイデンティティとRBACパターン | 30分 |

---

## 🚀 クイックスタート

```bash
# 複数の環境を作成する
azd env new dev
azd env new staging
azd env new prod

# 環境を切り替える
azd env select prod

# 環境変数を設定する
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# 設定を表示する
azd env get-values
```

---

## 🔧 設定階層

AZD は次の順に設定を適用します（後者が前者を上書き）:

1. <strong>デフォルト値</strong>（テンプレート内蔵）
2. **azure.yaml**（プロジェクト設定）
3. <strong>環境変数</strong>（`azd env set`）
4. <strong>コマンドラインフラグ</strong>（`--location eastus`）

---

## 🔐 セキュリティのベストプラクティス

```bash
# マネージドIDを使用する（推奨）
azd env set AZURE_USE_MANAGED_IDENTITY true

# AZDの認証状態を確認する
azd auth status

# オプション：azコマンドを実行する予定がある場合はAzure CLIのコンテキストを確認する
az account show

# 必要に応じて再認証する
azd auth login

# オプション：azコマンド用にAzure CLIの認証を更新する
az login
```

---

## 🔗 ナビゲーション

| 方向 | チャプター |
|-----------|---------|
| <strong>前へ</strong> | [Chapter 2: AI Development](../chapter-02-ai-development/README.md) |
| <strong>次へ</strong> | [Chapter 4: Infrastructure](../chapter-04-infrastructure/README.md) |

---

## 📖 関連資料

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->