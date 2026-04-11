# 第3章: 設定と認証

**📚 コース**: [AZD 初心者向け](../../README.md) | **⏱️ 所要時間**: 45-60 分 | **⭐ 難易度**: 中級

---

## 概要

本章では、Azure Developer CLI のデプロイにおける環境設定、認証パターン、およびセキュリティのベストプラクティスを扱います。

> 2026年3月に `azd 1.23.12` で検証済み。

## 学習目標

本章を完了すると、次のことができるようになります:
- AZD の構成階層をマスターする
- 複数の環境（dev、staging、prod）を管理する
- マネージドIDを使った安全な認証を実装する
- 環境固有の設定を構成する

---

## 📚 レッスン

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [構成ガイド](configuration.md) | 環境のセットアップと管理 | 30 分 |
| 2 | [認証とセキュリティ](authsecurity.md) | マネージドIDとRBACのパターン | 30 分 |

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

## 🔧 構成階層

AZD は次の順序で設定を適用します（後のものが前のものを上書きします）:

1. <strong>デフォルト値</strong> (テンプレートに組み込まれている)
2. **azure.yaml** (プロジェクト構成)
3. <strong>環境変数</strong> (`azd env set`)
4. <strong>コマンドラインフラグ</strong> (`--location eastus`)

---

## 🔐 セキュリティのベストプラクティス

```bash
# マネージドIDを使用する（推奨）
azd env set AZURE_USE_MANAGED_IDENTITY true

# AZDの認証ステータスを確認する
azd auth status

# 任意: az コマンドを実行する予定がある場合は Azure CLI のコンテキストを確認する
az account show

# 必要に応じて再認証する
azd auth login

# 任意: az コマンドのために Azure CLI の認証情報を更新する
az login
```

---

## 🔗 ナビゲーション

| 方向 | 章 |
|-----------|---------|
| <strong>前へ</strong> | [第2章: AI 開発](../chapter-02-ai-development/README.md) |
| <strong>次へ</strong> | [第4章: インフラストラクチャ](../chapter-04-infrastructure/README.md) |

---

## 📖 関連資料

- [デプロイ前チェック](../chapter-06-pre-deployment/README.md)
- [トラブルシューティング](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
この文書は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されました。正確性には最善を尽くしていますが、自動翻訳には誤りや不正確さが含まれる場合がありますのでご注意ください。原文（原言語で作成された文書）を正式な情報源と見なしてください。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の使用に起因するいかなる誤解や誤訳についても、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->