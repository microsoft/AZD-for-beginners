# Chapter 7: トラブルシューティングとデバッグ

**📚 コース**: [AZD入門](../../README.md) | **⏱️ 所要時間**: 1～1.5時間 | **⭐ 難易度**: 中級

---

## 概要

この章では Azure Developer CLI を使用する際の一般的な問題の診断と解決を支援します。デプロイ失敗からAI特有の問題までカバーします。

> 2026年3月の `azd 1.23.12` にて検証済みです。

## 学習目標

この章を完了すると以下ができるようになります：
- 一般的な AZD のデプロイ失敗を診断する
- 認証とアクセス権限の問題をデバッグする
- AIサービスの接続問題を解決する
- トラブルシューティングにAzureポータルとCLIを活用する

---

## 📚 レッスン

| # | レッスン | 内容 | 所要時間 |
|---|--------|-------------|------|
| 1 | [一般的な問題](common-issues.md) | よくある問題の解説 | 30分 |
| 2 | [デバッグガイド](debugging.md) | ステップバイステップのデバッグ手法 | 45分 |
| 3 | [AIのトラブルシューティング](ai-troubleshooting.md) | AI特有の問題 | 30分 |

---

## 🚨 クイック修正

### 認証の問題
```bash
# AZD ワークフローに必要です
azd auth login

# Azure CLI コマンドを直接使用する場合はオプションです
az login

azd auth status
```

### プロビジョニング失敗
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### リソースの競合
```bash
azd down --force --purge
azd env new different-name
azd up
```

### クォータ超過
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 エラーコードリファレンス

| エラー | 原因 | 解決策 |
|-------|-------|----------|
| `AuthenticationError` | ログインしていない | `azd auth login` |
| `ResourceNotFound` | リソースが存在しない | リソース名を確認 |
| `QuotaExceeded` | サブスクリプションの制限 | クォータの増加を依頼 |
| `InvalidTemplate` | Bicep 構文エラー | `az bicep build` |
| `Conflict` | リソースが既に存在 | 新しい名前を使うか削除 |
| `Forbidden` | 権限不足 | RBACロールを確認 |

---

## 🔄 リセットと復旧

```bash
# ソフトリセット（リソースを保持し、コードを再デプロイ）
azd deploy --force

# ハードリセット（すべて削除し、初期状態から開始）
azd down --force --purge
azd up
```

---

## 🔗 ナビゲーション

| 方向 | 章タイトル |
|-----------|---------|
| <strong>前</strong> | [第6章: デプロイ前準備](../chapter-06-pre-deployment/README.md) |
| <strong>次</strong> | [第8章: 本番環境](../chapter-08-production/README.md) |

---

## 📖 関連リソース

- [デプロイ前チェック](../chapter-06-pre-deployment/preflight-checks.md)
- [構成ガイド](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確さを期しておりますが、自動翻訳には誤りや不正確な箇所が含まれる可能性があることをご承知ください。原文の言語で書かれたオリジナルの文書が正本とみなされます。重要な情報については、専門の人力翻訳を推奨します。本翻訳の使用により生じたいかなる誤解や誤訳についても、一切責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->