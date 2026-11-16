# 第3章: 設定と認証

**📚 コース**: [AZD初心者向け](../../README.md) | **⏱️ 所要時間**: 統合演習含め90-150分 | **⭐ 難易度**: 中級者向け

---

## 概要

この章では、Azure Developer CLIのデプロイにおける環境設定、認証パターン、およびセキュリティのベストプラクティスを取り上げます。

> コマンドおよび設定レビュー対象: `azd 1.37.2` (2026年11月)。レビュー時に実際のAzureプロビジョニングは実行していません。

## 学習目標

この章を完了すると、以下ができるようになります:
- AZD設定階層をマスターする
- 複数環境（開発、ステージング、本番）を管理する
- マネージドIDによる安全な認証を実装する
- 環境固有の設定を構成する

---

## 📚 レッスン

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [設定ガイド](configuration.md) | 環境セットアップと管理 | 30分 |
| 2 | [認証とセキュリティ](authsecurity.md) | マネージドIDとRBACパターン | 30分 |

---

## 🚀 クイックスタート

<strong>すでに初期化済みのazdアプリケーション</strong>のルートから実行してください。コースリポジトリからではありません。既に存在する場合は未使用の環境名を使用してください。

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` は例示的なものであり、テンプレートが明示的にそれを使う場合にのみインフラに影響します。通常の `azd env set` 値はローカルに平文で保存され、セキュアな秘密ストレージではありません。

---

## 🔧 設定階層

3つの異なる設定領域を分離して保持してください：グローバル設定 (`azd config`)、プロジェクト構造 (`azure.yaml`)、および環境ごとの値 (`azd env`)。フラグは実際に対応する設定だけを上書きし、任意の環境変数を`azure.yaml`やBicepに一律で適用するオーバーレイはありません。

---

## 🔐 セキュリティのベストプラクティス

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 ナビゲーション

| 方向 | 章 |
|-----------|---------|
| <strong>前へ</strong> | [第2章: AI開発](../chapter-02-ai-development/README.md) |
| <strong>次へ</strong> | [第4章: インフラストラクチャ](../chapter-04-infrastructure/README.md) |

---

## 📖 関連資料

- [事前デプロイチェック](../chapter-06-pre-deployment/README.md)
- [トラブルシューティング](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->