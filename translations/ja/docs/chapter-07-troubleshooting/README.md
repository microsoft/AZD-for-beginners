# 第7章: トラブルシューティングとデバッグ

**📚 コース**: [AZD For Beginners](../../README.md) | **⏱️ 所要時間**: 1～1.5時間 | **⭐ 複雑度**: 中級

---

## 概要

この章では、Azure Developer CLIを使用する際の一般的な問題の診断と解決方法を説明します。デプロイ失敗からAI固有の問題までをカバーします。

> コマンドの案内はリリースされた`azd 1.37.2`リファレンスに基づき確認済みです。クラウドへのデプロイは実行されていません。コマンド使用前に例示されたリソース名やIDを置き換えてください。

## 学習目標

この章を修了すると次のことができるようになります:
- 一般的なAZDデプロイ失敗の診断
- 認証および権限の問題をデバッグ
- AIサービスの接続問題の解決
- トラブルシューティングにAzureポータルとCLIを活用

---

## 📚 レッスン

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [一般的な問題](common-issues.md) | よくあるトラブル | 30分 |
| 2 | [デバッグガイド](debugging.md) | ステップごとのデバッグ方法 | 45分 |
| 3 | [AIトラブルシューティング](ai-troubleshooting.md) | AI固有の問題 | 30分 |

---

## 🚨 クイックフィックス

### 認証問題
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### プロビジョニング失敗
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### リソース競合
既存のリソースとデプロイのエラーをまず調査してください。命名競合を解決するために共有または本番環境を削除しないでください。<strong>新しい使い捨て環境の場合</strong>は一意の名前を使用してください:

```bash
azd env new different-name
azd up
```

### クォータ超過
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

`AZURE_LOCATION`を変更しても既存リソースは移動されず、再デプロイ時にロケーションの競合が発生する可能性があります。

---

## 📋 エラーコードリファレンス

| エラー | 原因 | 解決策 |
|-------|-------|----------|
| `AuthenticationError` | ログインしていない | `azd auth login` |
| `ResourceNotFound` | リソースが存在しない | リソース名を確認 |
| `QuotaExceeded` | サブスクリプション制限 | クォータ増加を依頼 |
| `InvalidTemplate` | Bicep構文エラー | `az bicep build` |
| `Conflict` | リソースが既に存在 | 新しい名前を使うか削除 |
| `Forbidden` | 権限不足 | RBACロールを確認 |

---

## 🔄 リセットと復旧

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

ハードリセットはデータを削除し、エンドポイントが変更される可能性があります。事前にバックアップを行い、対話型の削除プロンプトを確認してください。`--force --purge`は戻せない削除を意図する使い捨て環境でのみ適切です。

---

## 🔗 ナビゲーション

| 方向 | 章 |
|-----------|---------|
| <strong>前へ</strong> | [第6章: プレデプロイメント](../chapter-06-pre-deployment/README.md) |
| <strong>次へ</strong> | [第8章: 本番環境](../chapter-08-production/README.md) |

---

## 📖 関連リソース

- [プレデプロイメントチェック](../chapter-06-pre-deployment/preflight-checks.md)
- [構成ガイド](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->