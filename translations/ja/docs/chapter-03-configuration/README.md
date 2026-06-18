# 第3章: 設定と認証

**📚 コース**: [AZD For Beginners](../../README.md) | **⏱️ 所要時間**: 45-60 分 | **⭐ 難易度**: 中級

---

## 概要

本章では Azure Developer CLI デプロイメント向けの環境構成、認証パターン、セキュリティのベストプラクティスを扱います。

> 2026年6月に `azd 1.25.6` で検証済み。

## 学習目標

本章を修了すると、次のことができるようになります：
- AZD の構成階層を理解する
- 複数環境（dev、staging、prod）を管理する
- マネージドID を用いた安全な認証を実装する
- 環境固有の設定を構成する

---

## 📚 レッスン

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [構成ガイド](configuration.md) | 環境のセットアップと管理 | 30 分 |
| 2 | [認証とセキュリティ](authsecurity.md) | マネージドID と RBAC のパターン | 30 分 |

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

AZD は次の順序で設定を適用します（後に指定したものが前のものを上書きします）：

1. <strong>デフォルト値</strong>（テンプレートに組み込み）
2. **azure.yaml**（プロジェクト構成）
3. <strong>環境変数</strong>（`azd env set`）
4. <strong>コマンドラインフラグ</strong>（`--location eastus`）

---

## 🔐 セキュリティのベストプラクティス

```bash
# マネージドIDを使用（推奨）
azd env set AZURE_USE_MANAGED_IDENTITY true

# AZD の認証ステータスを確認
azd auth status

# 任意: az コマンドを実行する予定がある場合は Azure CLI のコンテキストを確認
az account show

# 必要に応じて再認証
azd auth login

# 任意: az コマンド用に Azure CLI の認証を更新
az login
```

---

## 🔗 ナビゲーション

| 方向 | 章 |
|-----------|---------|
| <strong>前へ</strong> | [第2章: AI 開発](../chapter-02-ai-development/README.md) |
| <strong>次へ</strong> | [第4章: インフラストラクチャ](../chapter-04-infrastructure/README.md) |

---

## 📖 関連リソース

- [デプロイ前チェック](../chapter-06-pre-deployment/README.md)
- [トラブルシューティング](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->