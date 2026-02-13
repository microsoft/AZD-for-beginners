# 第3章: 構成と認証

**📚 コース**: [AZD 初心者向け](../../README.md) | **⏱️ 所要時間**: 45～60分 | **⭐ 難易度**: 中級

---

## 概要

この章では、Azure Developer CLI のデプロイにおける環境の構成、認証パターン、およびセキュリティのベストプラクティスを扱います。

## 学習目標

この章を完了すると、次のことを習得できます:
- AZD の構成階層を習得する
- 複数の環境（dev、staging、prod）を管理する
- マネージド ID を使用した安全な認証を実装する
- 環境固有の設定を構成する

---

## 📚 レッスン

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [構成ガイド](configuration.md) | 環境のセットアップと管理 | 30分 |
| 2 | [認証とセキュリティ](authsecurity.md) | マネージド ID と RBAC パターン | 30分 |

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

1. **デフォルト値** (built into templates)
2. **azure.yaml** (プロジェクト構成)
3. **環境変数** (`azd env set`)
4. **コマンドラインフラグ** (`--location eastus`)

---

## 🔐 セキュリティのベストプラクティス

```bash
# マネージド ID を使用する（推奨）
azd env set AZURE_USE_MANAGED_IDENTITY true

# 認証状態を確認する
azd auth whoami
az account show

# 必要に応じて再認証する
azd auth login
az login
```

---

## 🔗 ナビゲーション

| 方向 | 章 |
|-----------|---------|
| **前の章** | [第2章: AI 開発](../chapter-02-ai-development/README.md) |
| **次の章** | [第4章: インフラストラクチャ](../chapter-04-infrastructure/README.md) |

---

## 📖 関連リソース

- [デプロイ前チェック](../chapter-06-pre-deployment/README.md)
- [トラブルシューティング](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
本書はAI翻訳サービス「Co-op Translator」（https://github.com/Azure/co-op-translator）を使用して翻訳されました。正確性には努めていますが、自動翻訳は誤りや不正確な表現を含む可能性があることをご承知おきください。原文（原言語）の文書が公式の根拠と見なされます。重要な情報については、専門の人による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈の相違についても、当方は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->